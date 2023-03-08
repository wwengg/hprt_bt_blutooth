import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'hprt_bt_blutooth_platform_interface.dart';

/// An implementation of [HprtBtBlutoothPlatform] that uses method channels.
class MethodChannelHprtBtBlutooth extends HprtBtBlutoothPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('hprt_bt_blutooth');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<dynamic> portOpenBT(String address) =>
      methodChannel.invokeMethod<dynamic>('portOpenBT', {'address': address});

  @override
  Future<dynamic> getPrintSN() => methodChannel.invokeMethod<dynamic>('getPrintSN');

  @override
  Future<dynamic> printAreaSize(String offset, String horizontal,
          String vertical, String height, String qty) =>
      methodChannel.invokeMethod<dynamic>('printAreaSize', {
        'offset': offset,
        'horizontal': horizontal,
        'vertical': vertical,
        'height': height,
        'qty': qty
      });

  @override
  Future<dynamic> text(
          String font, String size, String x, String y, String data) =>
      methodChannel.invokeMethod<dynamic>(
          'Text', {'font': font, 'size': size, 'x': x, 'y': y, 'data': data});

  @override
  Future<dynamic> printQR(String command, String x, String y, String m,
          String u, String data) =>
      methodChannel.invokeMethod<dynamic>('PrintQR',
          {'command': command, 'x': x, 'y': y, "m": m, "u": u, "data": data});

  @override
  Future<dynamic> printBitmapCPCL(
          String base64, int x, int y, int type, int compressType, int light) =>
      methodChannel.invokeMethod<dynamic>('printBitmapCPCL', {
        "base64": base64,
        "xInt": x,
        "yInt": y,
        'typeInt': type,
        'compressType': compressType,
        'light': light
      });

  @override
  Future<dynamic> print() => methodChannel.invokeMethod<dynamic>('Print');

  @override
  Future<dynamic> portClose() => methodChannel.invokeMethod<dynamic>('portClose');
}
