
import 'hprt_bt_blutooth_platform_interface.dart';

class HprtBtBlutooth {
  Future<String?> getPlatformVersion() {
    return HprtBtBlutoothPlatform.instance.getPlatformVersion();
  }
}
