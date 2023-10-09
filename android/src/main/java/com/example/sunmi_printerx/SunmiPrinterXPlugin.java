package com.example.sunmi_printerx;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.RemoteException;
import android.util.Log;

import androidx.annotation.NonNull;

import com.sunmi.printerx.PrinterSdk;
import com.sunmi.printerx.SdkException;
import com.sunmi.printerx.api.LineApi;
import com.sunmi.printerx.style.BaseStyle;
import com.sunmi.printerx.style.TextStyle;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class SunmiPrinterXPlugin implements FlutterPlugin, MethodCallHandler {
    private String CHANNEL = "sunmi_printerx_library/method_channel";

    public PrinterSdk.Printer selectPrinter;

    @Override
    public void onAttachedToEngine(
            @NonNull FlutterPluginBinding flutterPluginBinding) {
        final MethodChannel channel = new MethodChannel(
                flutterPluginBinding.getBinaryMessenger(),
                CHANNEL);
        initPrinter(flutterPluginBinding.getApplicationContext());
        channel.setMethodCallHandler(this);
    }

    private void initPrinter(Context context) {
        try {
            PrinterSdk.getInstance().getPrinter(context, new PrinterSdk.PrinterListen() {
                @Override
                public void onDefPrinter(PrinterSdk.Printer printer) {
                    selectPrinter = printer;
                }

                @Override
                public void onPrinters(List<PrinterSdk.Printer> printers) {

                }
            });
        } catch (SdkException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result)  {

        switch (call.method) {
            case "CUT_PAPER":
                try {
                    LineApi api = selectPrinter.lineApi();
                    api.initLine(BaseStyle.getStyle());
                    api.printText("Test Printer X 1", TextStyle.getStyle());
                    api.printText("Test Printer X 2", TextStyle.getStyle());
                    api.printText("Test Printer X 3", TextStyle.getStyle());
                    api.printText("Test Printer X 4 ", TextStyle.getStyle());
                    api.printText("Test Printer X 5 ", TextStyle.getStyle());
                    api.autoOut();
                } catch (SdkException e) {
                    e.printStackTrace();
                }
                break;
        }
    }
}
