import 'wtoolbox_theme_service_extension.dart';

abstract class WTTheme {

  String? name;
  void setName();
  String? getName();

  WTThemeServiceExtension? themeExtensionService;

  void setTheme();
  
  WTThemeServiceExtension? getTheme();

}