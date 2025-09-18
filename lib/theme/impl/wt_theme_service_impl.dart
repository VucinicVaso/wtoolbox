import 'package:flutter/material.dart';
import '../../external/lib_getx.dart';
import '../wt_theme.dart';
import '../wt_theme_service.dart';
import 'wt_theme_dark.dart';
import 'wt_theme_light.dart';

class WTThemeServiceImpl extends WTThemeService {

  WTThemeServiceImpl() {
    setLightTheme(WTThemeLight());
    setDarkTheme(WTThemeDark());
    useLightTheme();
  }

  @override
  void setLightTheme(WTTheme? wtTheme) {
    lightTheme = wtTheme;
    addTheme(wtTheme);
  }
  @override
  WTTheme? getLightTheme() { return lightTheme; }
  @override
  void useLightTheme() {
    theme = lightTheme!;
    ThemeData themeData = lightTheme!.getThemeData()!;
    Get.changeTheme(themeData);
    Get.changeThemeMode(ThemeMode.light);
  }

  @override
  void setDarkTheme(WTTheme? wtTheme) {
    darkTheme = wtTheme;
    addTheme(wtTheme);
  }
  @override
  WTTheme? getDarkTheme() { return darkTheme; }
  @override
  void useDarkTheme() {
    theme = darkTheme!;
    ThemeData themeData = darkTheme!.getThemeData()!;
    Get.changeTheme(themeData);
    Get.changeThemeMode(ThemeMode.dark);
  }

}