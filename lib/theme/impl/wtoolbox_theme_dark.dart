import 'dart:ui';
import '../wtoolbox_theme.dart';
import '../wtoolbox_theme_extension.dart';

class WTThemeDark extends WTTheme {

  WTThemeDark() {
    setName('dark');
    setTheme();
  }

  @override
  void setName(String? v) { name = v; }
  @override
  String? getName() { return name; }

  @override
  void setTheme() {
    themeExtension = WTThemeExtension(
      background1: const Color(0xFF1E1E1E),
      background2: const Color(0xFF2A2A2A),
      text1: const Color(0xFFFFFFFF),
      text2: const Color(0xFFE0E0E0),
      text3: const Color(0xFFBDBDBD),
      text4: const Color(0xFF9E9E9E),
      text5: const Color(0xFF757575),
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
      shade1: const Color(0xFFf5f9ff),
      shade2: const Color(0xFFd7e0ec),
      shade3: const Color(0xFFa0b0c4),
      shade4: const Color(0xFF626d7c),
      shade5: const Color(0xFF8799af),
    );
  }
  @override
  WTThemeExtension? getTheme() { return themeExtension!; }

} 
