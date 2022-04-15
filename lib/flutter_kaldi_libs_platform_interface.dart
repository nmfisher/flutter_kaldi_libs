import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_kaldi_libs_method_channel.dart';

abstract class FlutterKaldiLibsPlatform extends PlatformInterface {
  /// Constructs a FlutterKaldiLibsPlatform.
  FlutterKaldiLibsPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterKaldiLibsPlatform _instance = MethodChannelFlutterKaldiLibs();

  /// The default instance of [FlutterKaldiLibsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterKaldiLibs].
  static FlutterKaldiLibsPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterKaldiLibsPlatform] when
  /// they register themselves.
  static set instance(FlutterKaldiLibsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
