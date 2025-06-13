import 'package:flutter/material.dart';
import 'wtoolbox_theme_service_extension.dart';
import 'wtoolbox_theme.dart';

enum WTThemeServiceEnums {
  light,
  dark
}

abstract class WTThemeService {

  WTThemeServiceExtension? themeExtensionService;

  WTTheme? lightTheme;
  WTTheme? darkTheme;
  void setLightTheme();
  void setDarkTheme();
  void setThemes();

  ThemeData? themeData;
  void setThemeData(ThemeData? tD);

  void setTheme({ WTThemeServiceEnums? type, WTThemeServiceExtension? theme });

}
