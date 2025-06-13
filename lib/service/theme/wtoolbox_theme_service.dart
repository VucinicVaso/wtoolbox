import 'package:flutter/material.dart';
import 'wtoolbox_theme_service_extension.dart';
import 'wtoolbox_theme.dart';

enum WTThemeServiceEnums {
  light,
  dark
}

abstract class WTThemeService {

  WTTheme? lightTheme;
  WTTheme? darkTheme;
  void setThemes();

  void useLightTheme();
  void useDarkTheme();

  WTTheme? theme;
  ThemeData? themeData;
  WTThemeServiceExtension? themeExtensionService;
  void setThemeData(ThemeData? tD);

  void setTheme({ WTThemeServiceEnums? wtType, WTTheme? wtTheme });

}
