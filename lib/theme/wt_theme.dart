import 'package:flutter/material.dart';
import 'wt_theme_extension.dart';

abstract class WTTheme {

  String? name;
  void setName(String? v);
  String? getName();

  ThemeData? themeData;
  void setThemeData();  
  ThemeData? getThemeData();

  WTThemeExtension? themeExtension;
  void setThemeExtension();  
  WTThemeExtension? getThemeExtension();

}