import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'hprt_bt_blutooth_method_channel.dart';

abstract class HprtBtBlutoothPlatform extends PlatformInterface {
  /// Constructs a HprtBtBlutoothPlatform.
  HprtBtBlutoothPlatform() : super(token: _token);

  static final Object _token = Object();

  static HprtBtBlutoothPlatform _instance = MethodChannelHprtBtBlutooth();

  /// The default instance of [HprtBtBlutoothPlatform] to use.
  ///
  /// Defaults to [MethodChannelHprtBtBlutooth].
  static HprtBtBlutoothPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HprtBtBlutoothPlatform] when
  /// they register themselves.
  static set instance(HprtBtBlutoothPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<dynamic> portOpenBT(String address) {
    throw UnimplementedError('portOpenBT() has not been implemented.');
  }

  Future<dynamic> getPrintSN() {
    throw UnimplementedError('getPrintSN() has not been implemented.');
  }

  Future<dynamic> printAreaSize(String offset, String horizontal,
          String vertical, String height, String qty) {
    throw UnimplementedError('printAreaSize() has not been implemented.');
  }

  Future<dynamic> text(
          String font, String size, String x, String y, String data) {
    throw UnimplementedError('text() has not been implemented.');
  }

  Future<dynamic> printQR(String command, String x, String y, String m,
          String u, String data) {
    throw UnimplementedError('printQR() has not been implemented.');
  }

  Future<dynamic> printBitmapCPCL(
          String base64, int x, int y, int type, int compressType, int light) {
    throw UnimplementedError('printBitmapCPCL() has not been implemented.');
  }

  Future<dynamic> print() {
    throw UnimplementedError('print() has not been implemented.');
  }

  Future<dynamic> portClose() {
    throw UnimplementedError('portClose() has not been implemented.');
  }

}
