import 'package:flutter_test/flutter_test.dart';
import 'package:hprt_bt_blutooth/hprt_bt_blutooth.dart';
import 'package:hprt_bt_blutooth/hprt_bt_blutooth_platform_interface.dart';
import 'package:hprt_bt_blutooth/hprt_bt_blutooth_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHprtBtBlutoothPlatform
    with MockPlatformInterfaceMixin
    implements HprtBtBlutoothPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final HprtBtBlutoothPlatform initialPlatform = HprtBtBlutoothPlatform.instance;

  test('$MethodChannelHprtBtBlutooth is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHprtBtBlutooth>());
  });

  test('getPlatformVersion', () async {
    HprtBtBlutooth hprtBtBlutoothPlugin = HprtBtBlutooth();
    MockHprtBtBlutoothPlatform fakePlatform = MockHprtBtBlutoothPlatform();
    HprtBtBlutoothPlatform.instance = fakePlatform;

    expect(await hprtBtBlutoothPlugin.getPlatformVersion(), '42');
  });
}
