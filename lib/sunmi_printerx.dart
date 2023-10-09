import 'package:flutter/services.dart';

class SunmiPrinterX {
  static const platform =
      MethodChannel('sunmi_printerx_library/method_channel');

  static Future<void> cut() async {
    // cắt giấy
    await platform.invokeMethod('CUT_PAPER');
  }
}
