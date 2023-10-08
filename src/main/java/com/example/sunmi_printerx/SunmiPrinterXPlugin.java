package com.example.sunmi_printerx;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.RemoteException;
import android.util.Log;

import androidx.annotation.NonNull;

import org.json.JSONArray;
import org.json.JSONObject;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class SunmiPrinterXPlugin implements FlutterPlugin, MethodCallHandler {
    private String CHANNEL = "sunmi_printerx_library/method_channel";

    @Override
    public void onAttachedToEngine(
            @NonNull FlutterPluginBinding flutterPluginBinding) {
        final MethodChannel channel = new MethodChannel(
                flutterPluginBinding.getBinaryMessenger(),
                CHANNEL);
      //  sunmiPrintHelper = new SunmiPrintHelper(flutterPluginBinding.getApplicationContext());

        channel.setMethodCallHandler(this);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        switch (call.method) {
            case "BIND_PRINTER_SERVICE":
              //  sunmiPrintHelper.initSunmiPrinterService();
               // result.success(true);
                break;
        }
    }
}
