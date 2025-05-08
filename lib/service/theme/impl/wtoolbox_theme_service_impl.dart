import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import '../wtoolbox_theme_service.dart';
import '../wtoolbox_theme_service_extension.dart';
import '../../../entity/theme/wt_theme.dart';

class WTThemeServiceImpl extends WTThemeService {

  WTThemeServiceImpl() {
    setInitialTheme();
  }

  @override
  void setThemeData(ThemeData? tD) {
    themeData = tD;
    Get.changeTheme(themeData!);
    Get.changeThemeMode(ThemeMode.light);
  }

  @override
  void setInitialTheme() {
    themeExtensionService = WTThemeServiceExtension(
      base1:    const Color(0xFFffffff),
      base2:    const Color(0xFFf3f5f7),
      text1:    const Color(0xFF192434),
      text2:    const Color(0xFF253445),
      text3:    const Color(0xFF616d7c),
      text4:    const Color(0xFF8893a1),
      text5:    const Color(0xFFc4cad3),
      primary1: const Color(0xFF006af6),
      primary2: const Color(0xFF005fdb),
      primary3: const Color(0xFF3d8ffb),
      primary4: const Color(0xFFe4f0ff),
      primary5: const Color(0xFFffffff),
      error1:   const Color(0xFFe21d11),
      error2:   const Color(0xFFca140c),
      error3:   const Color(0xFFf38e89),
      error4:   const Color(0xFFfde8e7),
      error5:   const Color(0xFFffffff),
      success1: const Color(0xFF148444),
      success2: const Color(0xFF087637),
      success3: const Color(0xFF8bc3a2),
      success4: const Color(0xFFe8f3ec),
      success5: const Color(0xFFffffff),
      shade1:   const Color(0xFF192434),
      shade2:   const Color(0xFF253446),
      shade3:   const Color(0xFF414d5e),
      shade4:   const Color(0xFF626d7c),
      shade5:   const Color(0xFF77828f),
      shade6:   const Color(0xFF8893a1),
      shade7:   const Color(0xFFa9b1bc),
      shade8:   const Color(0xFFc4cad3),
      shade9:   const Color(0xFFdbdfe5),
      shade10:  const Color(0xFFe7ebef),
      shade11:  const Color(0xFFf3f5f7),
    );

    setThemeData(
      ThemeData
        .light()
        .copyWith(
          extensions: <ThemeExtension<dynamic>>[ themeExtensionService! ]
        )
    );
  }

  @override
  void setTheme(WTTheme? entity) {
    Map<String, dynamic>? theme = entity!.theme!.cast<String, dynamic>();

    themeExtensionService = WTThemeServiceExtension(
      base1:    Color(theme['base1']),
      base2:    Color(theme['base2']),
      text1:    Color(theme['text1']),
      text2:    Color(theme['text2']),
      text3:    Color(theme['text3']),
      text4:    Color(theme['text4']),
      text5:    Color(theme['text5']),
      primary1: Color(theme['primary1']),
      primary2: Color(theme['primary2']),
      primary3: Color(theme['primary3']),
      primary4: Color(theme['primary4']),
      primary5: Color(theme['primary5']),
      error1:   Color(theme['error1']),
      error2:   Color(theme['error2']),
      error3:   Color(theme['error3']),
      error4:   Color(theme['error4']),
      error5:   Color(theme['error5']),
      success1: Color(theme['success1']),
      success2: Color(theme['success2']),
      success3: Color(theme['success3']),
      success4: Color(theme['success4']),
      success5: Color(theme['success5']),
      shade1:   Color(theme['shade1']),
      shade2:   Color(theme['shade2']),
      shade3:   Color(theme['shade3']),
      shade4:   Color(theme['shade4']),
      shade5:   Color(theme['shade5']),
      shade6:   Color(theme['shade6']),
      shade7:   Color(theme['shade7']),
      shade8:   Color(theme['shade8']),
      shade9:   Color(theme['shade9']),
      shade10:  Color(theme['shade10']),
      shade11:  Color(theme['shade11']),
    );

    setThemeData(
      ThemeData
        .light()
        .copyWith(
          extensions: <ThemeExtension<dynamic>>[ themeExtensionService! ]
        )
    );
  }

}