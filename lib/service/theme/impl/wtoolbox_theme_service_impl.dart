import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import '../wtoolbox_theme.dart';
import '../wtoolbox_theme_service.dart';
import 'wtoolbox_theme_dark.dart';
import 'wtoolbox_theme_light.dart';

class WTThemeServiceImpl extends WTThemeService {

  WTThemeServiceImpl() {
    setLightTheme(WTThemeLight());
    setDarkTheme(WTThemeDark());
    useLightTheme();
  }

  @override
  void setLightTheme(WTTheme? wtTheme) {
    lightTheme = wtTheme;
  }
  @override
  void useLightTheme() {
    setTheme(wtType: WTThemeServiceEnums.light, wtTheme: lightTheme!);
  }

  @override
  void setDarkTheme(WTTheme? wtTheme) {
    darkTheme = wtTheme;
  }
  @override
  void useDarkTheme() {
    setTheme(wtType: WTThemeServiceEnums.dark, wtTheme: darkTheme!);
  }

  @override
  void setTheme({ WTThemeServiceEnums? wtType, WTTheme? wtTheme }) {
    theme = wtTheme;
    themeExtensionService = theme!.getTheme()!;

    if(wtType!.name == WTThemeServiceEnums.light.name) {
      themeData = ThemeData
        .light()
        .copyWith(
          extensions: <ThemeExtension<dynamic>>[ themeExtensionService! ]
        );
      Get.changeTheme(themeData!);
      Get.changeThemeMode(ThemeMode.light);
    }

    if(wtType.name == WTThemeServiceEnums.dark.name) {
      themeData = ThemeData
        .dark()
        .copyWith(
          extensions: <ThemeExtension<dynamic>>[ themeExtensionService! ]
        );
      Get.changeTheme(themeData!);
      Get.changeThemeMode(ThemeMode.dark);
    }
  }

}