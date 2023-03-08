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
  
  @override
  Future getPrintSN() {
    // TODO: implement getPrintSN
    throw UnimplementedError();
  }
  
  @override
  Future portOpenBT(String address) {
    // TODO: implement portOpenBT
    throw UnimplementedError();
  }
  
  @override
  Future print() {
    // TODO: implement print
    throw UnimplementedError();
  }
  
  @override
  Future printAreaSize(String offset, String horizontal, String vertical, String height, String qty) {
    // TODO: implement printAreaSize
    throw UnimplementedError();
  }
  
  @override
  Future printBitmapCPCL(String base64, int x, int y, int type, int compressType, int light) {
    // TODO: implement printBitmapCPCL
    throw UnimplementedError();
  }
  
  @override
  Future printQR(String command, String x, String y, String m, String u, String data) {
    // TODO: implement printQR
    throw UnimplementedError();
  }
  
  @override
  Future text(String font, String size, String x, String y, String data) {
    // TODO: implement text
    throw UnimplementedError();
  }
  
  @override
  Future portClose() {
    // TODO: implement portClose
    throw UnimplementedError();
  }
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
