import 'dart:ui';
import '../wtoolbox_theme.dart';
import '../wtoolbox_theme_extension.dart';

class WTThemeLight extends WTTheme {

  WTThemeLight() {
    setName('Light');
    setTheme();
  }

  @override
  void setName(String? v) { name = v; }
  @override
  String? getName() { return name; }

  @override
  void setTheme() {
    themeExtension = WTThemeExtension(
      background1: const Color(0xFFffffff),
      background2: const Color(0xFFf3f5f7),
      text1: const Color(0xFF192434),
      text2: const Color(0xFF253445),
      text3: const Color(0xFF616d7c),
      text4: const Color(0xFF8893a1),
      text5: const Color(0xFFc4cad3),
      primary1: const Color(0xFF006af6),
      primary2: const Color(0xFF005fdb),
      primary3: const Color(0xFF3d8ffb),
      primary4: const Color(0xFFe4f0ff),
      primary5: const Color(0xFFffffff),
      error1: const Color(0xFFe21d11),
      error2: const Color(0xFFca140c),
      error3: const Color(0xFFf38e89),
      error4: const Color(0xFFfde8e7),
      error5: const Color(0xFFffffff),
      success1: const Color(0xFF148444),
      success2: const Color(0xFF087637),
      success3: const Color(0xFF8bc3a2),
      success4: const Color(0xFFe8f3ec),
      success5: const Color(0xFFffffff),
      shade1: const Color(0xFF192434),
      shade2: const Color(0xFF253446),
      shade3: const Color(0xFF414d5e),
      shade4: const Color(0xFF626d7c),
      shade5: const Color(0xFF77828f),
      shade6: const Color(0xFF8893a1),
      shade7: const Color(0xFFa9b1bc),
      shade8: const Color(0xFFc4cad3),
      shade9: const Color(0xFFdbdfe5),
      shade10: const Color(0xFFe7ebef),
    );
  }
  @override
  WTThemeExtension? getTheme() { return themeExtension!; }

} 
