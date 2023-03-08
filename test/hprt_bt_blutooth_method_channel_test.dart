import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hprt_bt_blutooth/hprt_bt_blutooth_method_channel.dart';

void main() {
  MethodChannelHprtBtBlutooth platform = MethodChannelHprtBtBlutooth();
  const MethodChannel channel = MethodChannel('hprt_bt_blutooth');

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
