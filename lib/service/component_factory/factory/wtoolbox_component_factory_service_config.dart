import 'package:flutter/material.dart';
import '../../../3rd_party/lib_getx.dart';
import '../../theme/wtoolbox_theme_service_extension.dart';
import '../config/wtoolbox_component_configuration.dart';

mixin WTComponentFactoryServiceConfig {

  String? translate(String? v) { return '$v'.tr; }

  BuildContext? getCurrentContext() { return Get.key.currentContext; }

  void modalNavigateBack() { Get.back(); }

  String? fonts;
  void setTextFont({ String? type, String? font }) {
    if(type == 'Google') { fonts = font; }
  }

  WTThemeServiceExtension? theme;
  void setTheme(WTThemeServiceExtension? v) { theme = v; }

  WTComponentConfiguration? componentConfiguration;
  void setComponentConfiguration(WTComponentConfiguration? v) { componentConfiguration = v; }
  void initComponentConfiguration() { componentConfiguration!.initComponentConfiguration(); }

}