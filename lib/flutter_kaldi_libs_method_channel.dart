import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_kaldi_libs_platform_interface.dart';

/// An implementation of [FlutterKaldiLibsPlatform] that uses method channels.
class MethodChannelFlutterKaldiLibs extends FlutterKaldiLibsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_kaldi_libs');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
