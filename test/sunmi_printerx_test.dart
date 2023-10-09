import 'package:flutter_test/flutter_test.dart';
import 'package:sunmi_printerx/sunmi_printerx.dart';
import 'package:sunmi_printerx/sunmi_printerx_platform_interface.dart';
import 'package:sunmi_printerx/sunmi_printerx_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSunmiPrinterxPlatform
    with MockPlatformInterfaceMixin
    implements SunmiPrinterxPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SunmiPrinterxPlatform initialPlatform = SunmiPrinterxPlatform.instance;

  test('$MethodChannelSunmiPrinterx is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSunmiPrinterx>());
  });

  test('getPlatformVersion', () async {
    SunmiPrinterx sunmiPrinterxPlugin = SunmiPrinterx();
    MockSunmiPrinterxPlatform fakePlatform = MockSunmiPrinterxPlatform();
    SunmiPrinterxPlatform.instance = fakePlatform;

    expect(await sunmiPrinterxPlugin.getPlatformVersion(), '42');
  });
}
