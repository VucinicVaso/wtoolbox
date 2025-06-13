import 'package:flutter/material.dart';
import 'wtoolbox_theme_service_extension.dart';
import 'wtoolbox_theme.dart';

enum AppThemeServiceEnums {
  light,
  dark
}

abstract class WTThemeService {

  WTThemeServiceExtension? themeExtensionService;

  WTTheme? lightTheme;
  WTTheme? darkTheme;
  void setThemes();

  ThemeData? themeData;
  void setThemeData(ThemeData? tD);

  void setTheme({ AppThemeServiceEnums? type, WTThemeServiceExtension? theme });

  void setLightTheme();
  void setDarkTheme();

}
