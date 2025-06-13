import 'wtoolbox_theme_service_extension.dart';

abstract class WTTheme {

  WTThemeServiceExtension? themeExtensionService;

  void setTheme();
  
  WTThemeServiceExtension? getTheme();

}