import 'wtoolbox_theme_extension.dart';

abstract class WTTheme {

  String? name;
  void setName(String? v);
  String? getName();

  WTThemeExtension? themeExtension;
  void setTheme();  
  WTThemeExtension? getTheme();

}