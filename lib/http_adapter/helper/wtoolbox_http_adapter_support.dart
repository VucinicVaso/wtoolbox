import 'dart:io';
import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/device/wtoolbox_device.dart';

class WTHttpAdapterOverrides extends HttpOverrides {

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }

}

class WTHttpAdapterSupport {

  WTHttpAdapterSupport._();

  static WTHttpAdapterSupport? _instance;

  static WTHttpAdapterSupport get instance {
    _instance ??= WTHttpAdapterSupport._();
    return _instance!;
  }

  Future<void> check() async {
    var device = Get.find<WTDevice>().getDevice();

    if(device!['platform'] == 'ANDROID') {
      if(device['data']['version.sdkInt'] < 29) {
        HttpOverrides.global = WTHttpAdapterOverrides();
      }
    }
  }

}