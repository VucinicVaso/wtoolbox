import 'wt_theme.dart';

enum WTThemeEnums {
  light,
  dark
}

abstract class WTThemeService {

  WTTheme? lightTheme;
  void setLightTheme(WTTheme? wtTheme);
  WTTheme? getLightTheme();
  void useLightTheme();

  WTTheme? darkTheme;
  void setDarkTheme(WTTheme? wtTheme);
  WTTheme? getDarkTheme();
  void useDarkTheme();

  List<Map<String, dynamic>> themes = List<Map<String, dynamic>>.empty(growable: true);
  void addTheme(WTTheme? theme) { themes.add({ 'key': themes.length + 1, 'name': theme!.name, 'data': theme }); }
  List<Map<String, dynamic>>? getThemes() { return themes; }

  WTTheme? theme;
  WTTheme? getTheme() { return theme!; }
  void updateTheme(String? name) {
    if(name == WTThemeEnums.light.name) { useLightTheme(); }
    if(name == WTThemeEnums.dark.name) { useDarkTheme(); }
  }

}