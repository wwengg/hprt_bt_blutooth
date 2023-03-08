package com.wwengg.hprt_bt_blutooth;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import android.util.Base64;
import android.util.Log;

import androidx.annotation.NonNull;

import java.util.Map;

import cpcl.PrinterHelper;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** HprtBtBlutoothPlugin */
public class HprtBtBlutoothPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  private static Context context;


  private static class MethodResultWrapper implements Result {
    private Result methodResult;
    private Handler handler;


    MethodResultWrapper(Result result) {
      methodResult = result;
      handler = new Handler(Looper.getMainLooper());
    }

    @Override
    public void success(final Object result) {
      handler.post(new Runnable() {
        @Override
        public void run() {
          methodResult.success(result);
        }
      });
    }

    @Override
    public void error(final String errorCode, final String errorMessage, final Object errorDetails) {
      handler.post(new Runnable() {
        @Override
        public void run() {
          methodResult.error(errorCode, errorMessage, errorDetails);
        }
      });
    }

    @Override
    public void notImplemented() {
      handler.post(new Runnable() {
        @Override
        public void run() {
          methodResult.notImplemented();
        }
      });
    }
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "hprt_bt_blutooth");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result rawResult) {
    Result result = new MethodResultWrapper(rawResult);

    final Map<String, Object> arguments = call.arguments();
    System.out.println(call.method);
    switch (call.method){
      case "portOpenBT":
        assert arguments != null;
        if (arguments.containsKey("address")) {
          String address = (String) arguments.get("address");
          try {
//            PrinterHelper.portClose();
            int portOpen = PrinterHelper.portOpenBT(context,address);
//            PrinterHelper.logcat("portOpen:"+portOpen);
            result.success(portOpen);
          } catch (Exception e) {
            result.error("portOpen error:", e.toString(), null);
          }
        } else {
          result.error("invalid_argument", "argument 'address' not found", null);
        }
        break;
      case "getPrintSN":
        try {
          String msg = PrinterHelper.getPrintSN();
          result.success(msg);
        } catch (Exception e) {
          result.error("getPrintSN error:", e.toString(), null);
        }
        break;
      case "printAreaSize":
//        assert arguments != null;
        if (!arguments.containsKey("offset")){
          result.error("invalid_argument", "argument 'offset' not found", null);
        }
        if (!arguments.containsKey("horizontal")){
          result.error("invalid_argument", "argument 'horizontal' not found", null);
        }
        if (!arguments.containsKey("vertical")){
          result.error("invalid_argument", "argument 'vertical' not found", null);
        }
        if (!arguments.containsKey("height")){
          result.error("invalid_argument", "argument 'height' not found", null);
        }
        if (!arguments.containsKey("qty")){
          result.error("invalid_argument", "argument 'qty' not found", null);
        }
        String offset = (String) arguments.get("offset");
        String horizontal = (String) arguments.get("horizontal");
        String vertical = (String) arguments.get("vertical");
        String height = (String) arguments.get("height");
        String qty = (String) arguments.get("qty");
        try {
          PrinterHelper.printAreaSize(offset,horizontal,vertical,height,qty);
          PrinterHelper.Encoding("gb2312");
          result.success("");
        } catch (Exception e) {
          result.error("printAreaSize error:", e.toString(), null);
        }
        break;
      case "Text":
//        assert arguments != null;
//        if (!arguments.containsKey("command")){
//          result.error("invalid_argument", "argument 'command' not found", null);
//        }
        if (!arguments.containsKey("font")){
          result.error("invalid_argument", "argument 'font' not found", null);
        }
        if (!arguments.containsKey("size")){
          result.error("invalid_argument", "argument 'size' not found", null);
        }
        if (!arguments.containsKey("x")){
          result.error("invalid_argument", "argument 'x' not found", null);
        }
        if (!arguments.containsKey("y")){
          result.error("invalid_argument", "argument 'y' not found", null);
        }
        if (!arguments.containsKey("data")){
          result.error("invalid_argument", "argument 'data' not found", null);
        }
        String font = (String) arguments.get("font");
        String size = (String) arguments.get("size");
        String x = (String) arguments.get("x");
        String y = (String) arguments.get("y");
        String data = (String) arguments.get("data");
        try {
          PrinterHelper.Text(PrinterHelper.TEXT,font,size,x,y,data);
          result.success("");
        } catch (Exception e) {
          result.error("Text error:", e.toString(), null);
        }
        break;
      case "PrintQR":
//        assert arguments != null;
        if (!arguments.containsKey("command")){
          result.error("invalid_argument", "argument 'command' not found", null);
        }
        if (!arguments.containsKey("x")){
          result.error("invalid_argument", "argument 'x' not found", null);
        }
        if (!arguments.containsKey("y")){
          result.error("invalid_argument", "argument 'y' not found", null);
        }
        if (!arguments.containsKey("m")){
          result.error("invalid_argument", "argument 'm' not found", null);
        }
        if (!arguments.containsKey("u")){
          result.error("invalid_argument", "argument 'u' not found", null);
        }
        if (!arguments.containsKey("data")){
          result.error("invalid_argument", "argument 'data' not found", null);
        }
        String command = (String) arguments.get("command");
        String x2 = (String) arguments.get("x");
        String y2 = (String) arguments.get("y");
        String m = (String) arguments.get("m");
        String u = (String) arguments.get("u");
        String data2 = (String) arguments.get("data");
        try {
          PrinterHelper.PrintQR(PrinterHelper.BARCODE,x2,y2,m,u,data2);
          result.success("");
        } catch (Exception e) {
          result.error("Text error:", e.toString(), null);
        }
        break;
      case "printBitmapCPCL":
//        assert arguments != null;
        if (!arguments.containsKey("base64")){
          result.error("invalid_argument", "argument 'base64' not found", null);
        }
        if (!arguments.containsKey("xInt")){
          result.error("invalid_argument", "argument 'xInt' not found", null);
        }
        if (!arguments.containsKey("yInt")){
          result.error("invalid_argument", "argument 'yInt' not found", null);
        }
        if (!arguments.containsKey("typeInt")){
          result.error("invalid_argument", "argument 'typeInt' not found", null);
        }
        if (!arguments.containsKey("compressType")){
          result.error("invalid_argument", "argument 'compressType' not found", null);
        }
        if (!arguments.containsKey("light")){
          result.error("invalid_argument", "argument 'light' not found", null);
        }
        String base64 = (String) arguments.get("base64");
        int x3 = (int) arguments.get("xInt");
        int y3 = (int) arguments.get("yInt");
        int type = (int) arguments.get("typeInt");
        int compressType = (int) arguments.get("compressType");
        int light = (int) arguments.get("light");

//        BitmapFactory.Options options = new BitmapFactory.Options();
//        options.inPurgeable = true;
//        options.inPreferredConfig = Bitmap.Config.ARGB_8888;
//
//        try {
//          BitmapFactory.Options.class.getField("inNativeAlloc").setBoolean(options, true);
//        } catch (IllegalArgumentException var25) {
//          var25.printStackTrace();
//        } catch (SecurityException var26) {
//          var26.printStackTrace();
//        } catch (IllegalAccessException var27) {
//          var27.printStackTrace();
//        } catch (NoSuchFieldException var28) {
//          var28.printStackTrace();
//        }

        byte[] bytes = Base64.decode(base64,Base64.DEFAULT);
        Bitmap bitmap = BitmapFactory.decodeByteArray(bytes,0,bytes.length);

        try {
          PrinterHelper.printBitmapCPCL(bitmap,x3,y3,type,compressType,light);
          result.success("");
        } catch (Exception e) {
          result.error("printBitmapCPCL error:", e.toString(), null);
        }
        break;
      case "Print":
        try {
          PrinterHelper.Form();
          PrinterHelper.Print();
//          PrinterHelper.portClose();
          result.success("");
        } catch (Exception e) {
          result.error("Print error:", e.toString(), null);
        }
        break;
      case "portClose":
        try {
          PrinterHelper.portClose();
          result.success("");
        } catch (Exception e) {
          result.error("Print error:", e.toString(), null);
        }
        break;
      default:
        result.notImplemented();
        break;
    }

//    if (call.method.equals("getPlatformVersion")) {
//      result.success("Android " + android.os.Build.VERSION.RELEASE);
//    } else {
//      result.notImplemented();
//    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
