import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import '../wtoolbox_theme_service.dart';
import '../wtoolbox_theme_service_extension.dart';
import 'wtoolbox_theme_dark.dart';
import 'wtoolbox_theme_light.dart';

class WTThemeServiceImpl extends WTThemeService {

  WTThemeServiceImpl() {
    setThemes();
    setTheme(wtType: WTThemeServiceEnums.light, wtTheme: lightTheme!);
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
  void setTheme({ WTThemeServiceEnums? wtType, WTTheme? wtTheme }) {
    theme = wtTheme;
    themeExtensionService = theme.getTheme()!;

    if(wtType == WTThemeServiceEnums.light) {
      setThemeData(
        ThemeData
          .light()
          .copyWith(
            extensions: <ThemeExtension<dynamic>>[ themeExtensionService! ]
          )
      );
    }

    if(wtType == WTThemeServiceEnums.dark) {
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
    setTheme(wtType: WTThemeServiceEnums.light, wtTheme: lightTheme!);
  }

  @override
  void setDarkTheme() {
    setTheme(wtType: WTThemeServiceEnums.dark, wtTheme: darkTheme!);
  }

}