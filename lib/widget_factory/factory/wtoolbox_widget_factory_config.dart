import 'package:flutter/material.dart';
import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/theme/wtoolbox_theme_extension.dart';

mixin WTWidgetFactoryConfig {

  String? translate(String? v) { return '$v'.tr; }

  BuildContext? getCurrentContext() { return Get.key.currentContext; }

  void modalNavigateBack() { Get.back(); }

  String? googleFonts;
  void setGoogleFonts({ String? font }) { googleFonts = font; }

  WTThemeExtension? theme;
  void setTheme(WTThemeExtension? v) { theme = v; }

}