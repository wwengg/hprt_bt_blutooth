
import 'hprt_bt_blutooth_platform_interface.dart';

class HprtBtBlutooth {
  Future<String?> getPlatformVersion() {
    return HprtBtBlutoothPlatform.instance.getPlatformVersion();
  }

  Future<dynamic> portOpenBT(String address) {
    return HprtBtBlutoothPlatform.instance.portOpenBT(address);
  }

  Future<dynamic> getPrintSN() {
    return HprtBtBlutoothPlatform.instance.getPrintSN();
  }

  Future<dynamic> printAreaSize(String offset, String horizontal,
          String vertical, String height, String qty) {
    return HprtBtBlutoothPlatform.instance.printAreaSize(offset,horizontal,vertical,height,qty);
  }

  Future<dynamic> text(
          String font, String size, String x, String y, String data) {
    return HprtBtBlutoothPlatform.instance.text(font,size,x,y,data);
  }

  Future<dynamic> printQR(String command, String x, String y, String m,
          String u, String data) {
    return HprtBtBlutoothPlatform.instance.printQR(command,x,y,m,u,data);
  }

  Future<dynamic> printBitmapCPCL(
          String base64, int x, int y, int type, int compressType, int light) {
    return HprtBtBlutoothPlatform.instance.printBitmapCPCL(base64,x,y,type,compressType,light);
  }

  Future<dynamic> print() {
    return HprtBtBlutoothPlatform.instance.print();
  }

  Future<dynamic> portClose() {
    return HprtBtBlutoothPlatform.instance.portClose();
  }
}
