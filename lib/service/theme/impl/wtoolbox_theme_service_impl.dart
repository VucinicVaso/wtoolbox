import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import '../wtoolbox_theme_service.dart';
import '../wtoolbox_theme_service_extension.dart';
import 'wtoolbox_theme_dark.dart';
import 'wtoolbox_theme_light.dart';

class WTThemeServiceImpl extends WTThemeService {

  WTThemeServiceImpl() {
    setThemes();
    setTheme(type: WTThemeServiceEnums.light, theme: lightTheme!.getTheme()!);
  }

  @override
  void setThemes() {
    lightTheme = WTThemeLight();
    darkTheme  = WTThemeDark();
  }

  @override
  void setThemeData(ThemeData? tD) {
    themeData = tD;
    Get.changeTheme(themeData!);
    Get.changeThemeMode(ThemeMode.light);
  }

  @override
  void setTheme({ WTThemeServiceEnums? type, WTThemeServiceExtension? theme }) {
    themeExtensionService = theme;

    if(type == WTThemeServiceEnums.light) {
      setThemeData(
        ThemeData
          .light()
          .copyWith(
            extensions: <ThemeExtension<dynamic>>[ themeExtensionService! ]
          )
      );
    }

    if(type == WTThemeServiceEnums.dark) {
      setThemeData(
        ThemeData
          .dark()
          .copyWith(
            extensions: <ThemeExtension<dynamic>>[ themeExtensionService! ]
          )
      );
    }
  }

  @override
  void setLightTheme() {
    setTheme(type: WTThemeServiceEnums.light, theme: lightTheme!.getTheme()!);
  }

  @override
  void setDarkTheme() {
    setTheme(type: WTThemeServiceEnums.dark, theme: darkTheme!.getTheme()!);
  }

}