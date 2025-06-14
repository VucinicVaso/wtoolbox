import 'package:flutter/material.dart';
import 'wtoolbox_theme_service_extension.dart';
import 'wtoolbox_theme.dart';

enum WTThemeServiceEnums {
  light,
  dark
}

abstract class WTThemeService {

  WTTheme? lightTheme;
  void setLightTheme(WTTheme? wtTheme);
  void useLightTheme();

  WTTheme? darkTheme;
  void setDarkTheme(WTTheme? wtTheme);
  void useDarkTheme();

  WTTheme? theme;
  ThemeData? themeData;
  WTThemeServiceExtension? themeExtensionService;

  void setTheme({ WTThemeServiceEnums? wtType, WTTheme? wtTheme });

}
