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
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
