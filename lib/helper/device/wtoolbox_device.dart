import 'package:wtoolbox/3rd_party/lib_device_info_plus.dart';

abstract class WTDevice {

  Map<String, dynamic>? _device = <String, dynamic>{};
  void setDevice(Map<String, dynamic>? v) { _device = v; }
  Map<String, dynamic>? getDevice() { return _device; }

  Future<void> getDeviceData();

  Map<dynamic, dynamic> readAndroidBuildData(AndroidDeviceInfo build);

  Map<dynamic, dynamic> readIosDeviceInfo(IosDeviceInfo data);

  Map<dynamic, dynamic> readWindowsDeviceInfo(WindowsDeviceInfo data);

  Map<dynamic, dynamic> readLinuxDeviceInfo(LinuxDeviceInfo data);

  Map<String, dynamic> readMacOsDeviceInfo(MacOsDeviceInfo data);

  Map<String, dynamic> readWebBrowserInfo(WebBrowserInfo data);

}