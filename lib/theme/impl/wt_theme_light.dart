import 'package:flutter/material.dart';
import '../wt_theme.dart';
import '../wt_theme_extension.dart';

class WTThemeLight extends WTTheme {

  WTThemeLight() {
    setName('light');
    setThemeExtension();
    setThemeData();
  }

  @override
  void setName(String? v) { name = v; }
  @override
  String? getName() { return name; }

  @override
  void setThemeData() {
    themeData = ThemeData
      .light()
      .copyWith(
        extensions: <ThemeExtension<dynamic>>[ getThemeExtension()! ]
      );
  }
  @override
  ThemeData? getThemeData() { return themeData; }

  @override
  void setThemeExtension() {
    themeExtension = WTThemeExtension(
      background1: const Color(0xFFffffff),
      background2: const Color(0xFFF5F5F5),
      text1: const Color(0xFF212121),
      text2: const Color(0xFF424242),
      text3: const Color(0xFF616161),
      text4: const Color(0xFF9E9E9E),
      text5: const Color(0xFFBDBDBD),
      primary1: const Color(0xFF0B3C61),
      primary2: const Color(0xFF115293),
      primary3: const Color(0xFF1976D2),
      primary4: const Color(0xFF90CAF9),
      primary5: const Color(0xFFE3F2FF),
      error1: const Color(0xFF7F1009),
      error2: const Color(0xFFB2160D),
      error3: const Color(0xFFE21D11),
      error4: const Color(0xFFFFB8B2),
      error5: const Color(0xFFFFE5E3),
      success1: const Color(0xFF103915),
      success2: const Color(0xFF1B5E20),
      success3: const Color(0xFF2E7D32),
      success4: const Color(0xFFA5D6A7),
      success5: const Color(0xFFE3F9E5),
      shade1: const Color(0xFF192434),
      shade2: const Color(0xFF253446),
      shade3: const Color(0xFF414d5e),
      shade4: const Color(0xFF626d7c),
      shade5: const Color(0xFF77828f),
    );
  }
  @override
  WTThemeExtension? getThemeExtension() { return themeExtension!; }

} 
