import 'dart:ffi' as ffi;

typedef play_once_type = ffi.Void Function();
typedef PlayOnceRust = void Function();

void play_onces() {
  final dl = ffi.DynamicLibrary.open('target/release/libplay_once.so');
  final play_once_rust = dl
      .lookup<ffi.NativeFunction<play_once_type>>('play_once')
      .asFunction<PlayOnceRust>();
  play_once_rust();
}
