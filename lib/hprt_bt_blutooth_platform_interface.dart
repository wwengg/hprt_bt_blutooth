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
}
