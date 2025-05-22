import 'package:flutter/material.dart';
import '../../../3rd_party/lib_getx.dart';
import '../../theme/wtoolbox_theme_service_extension.dart';

mixin WTComponentFactoryServiceConfig {

  bool? isInitialized = false;
  void initialize() { if(isInitialized == false) { isInitialized = true; } }

  String? translate(String? v) { return '$v'.tr; }

  BuildContext? getCurrentContext() { return Get.key.currentContext; }

  void modalNavigateBack() { Get.back(); }

  String? fonts;
  void setTextFont({ String? type, String? font }) {
    if(type == 'Google') { fonts = font; }
  }

  WTThemeServiceExtension? theme;
  void setTheme(WTThemeServiceExtension? v) { theme = v; }

  double? deviceWidth, deviceHeight;
  void setDeviceWidth(double? v) { deviceWidth = v; }
  void setDeviceHeight(double? v) { deviceHeight = v; }

}