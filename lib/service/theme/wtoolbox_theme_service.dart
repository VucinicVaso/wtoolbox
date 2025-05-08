import 'package:flutter/material.dart';
import 'wtoolbox_theme_service_extension.dart';
import '../../entity/theme/wt_theme.dart';

abstract class WTThemeService {

  WTThemeServiceExtension? themeExtensionService;

  ThemeData? themeData;
  void setThemeData(ThemeData? tD);

  void setInitialTheme();

  void setTheme(WTTheme? entity);

}
