
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterKaldiLibs {
  static const MethodChannel _channel = MethodChannel('flutter_kaldi_libs');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
