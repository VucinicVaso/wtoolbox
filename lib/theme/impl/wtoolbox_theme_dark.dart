import 'dart:ui';
import '../wtoolbox_theme.dart';
import '../wtoolbox_theme_extension.dart';

class WTThemeDark extends WTTheme {

  WTThemeDark() {
    setName('Dark');
    setTheme();
  }

  @override
  void setName(String? v) { name = v; }
  @override
  String? getName() { return name; }

  @override
  void setTheme() {
    themeExtension = WTThemeExtension(
      background1: const Color(0xFF223248),
      background2: const Color(0xFF2b3d52),
      text1: const Color(0xFFf5f9ff),
      text2: const Color(0xFFd7e0ec),
      text3: const Color(0xFFa0b0c4),
      text4: const Color(0xFF7588a0),
      text5: const Color(0xFF53667f),
      primary1: const Color(0xFF0e6ce9),
      primary2: const Color(0xFF8fbdf9),
      primary3: const Color(0xFF5585c1),
      primary4: const Color(0xFF223d5e),
      primary5: const Color(0xFFffffff),
      error1: const Color(0xFFe1231a),
      error2: const Color(0xFFff9e99),
      error3: const Color(0xFF834950),
      error4: const Color(0xFF3e394a),
      error5: const Color(0xFFffffff),
      success1: const Color(0xFF148444),
      success2: const Color(0xFF0fd965),
      success3: const Color(0xFF1a945c),
      success4: const Color(0xFF20464c),
      success5: const Color(0xFFffffff),
      shade1: const Color(0xFFf5f9ff),
      shade2: const Color(0xFFd7e0ec),
      shade3: const Color(0xFFa0b0c4),
      shade4: const Color(0xFF626d7c),
      shade5: const Color(0xFF8799af),
      shade6: const Color(0xFF7588a0),
      shade7: const Color(0xFF63778f),
      shade8: const Color(0xFF53667f),
      shade9: const Color(0xFF44566e),
      shade10: const Color(0xFF36485f),
    );
  }
  @override
  WTThemeExtension? getTheme() { return themeExtension!; }

} 
