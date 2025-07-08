import 'package:wtoolbox/external/lib_device_info_plus.dart';

abstract class WTDevice {

  Map<String, dynamic>? _device = <String, dynamic>{};
  void setDevice(Map<String, dynamic>? v) { _device = v; }
  Map<String, dynamic>? getDevice() { return _device; }

  Future<void> getDeviceData();
  Map<dynamic, dynamic>? androidDeviceData(AndroidDeviceInfo build);
  Map<dynamic, dynamic>? iosDeviceData(IosDeviceInfo data);
  Map<String, dynamic>? macOsDeviceData(MacOsDeviceInfo data);
  Map<dynamic, dynamic>? windowsDeviceData(WindowsDeviceInfo data);
  Map<dynamic, dynamic>? linuxDeviceData(LinuxDeviceInfo data);
  Map<String, dynamic>? webBrowserData(WebBrowserInfo data);

}