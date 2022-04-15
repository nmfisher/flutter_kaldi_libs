import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_kaldi_libs/flutter_kaldi_libs_method_channel.dart';

void main() {
  MethodChannelFlutterKaldiLibs platform = MethodChannelFlutterKaldiLibs();
  const MethodChannel channel = MethodChannel('flutter_kaldi_libs');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
