import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';
import '../../../../entity/theme/wt_theme.dart';

abstract class WTThemePicker extends WTComponent {

  Function? action;
  void setAction(Function? v) { action = v; }

  IconData? selectedIcon, unselectedIcon;
  void setSelectedIcon(IconData? v) { selectedIcon = v; }
  void setUnselectedIcon(IconData? v) { unselectedIcon = v; }

  Color? textColor, selectedIconColor, unselectedIconColor;
  void setTextColor(Color? v) { textColor = v; }
  void setSelectedIconColor(Color? v) { selectedIconColor = v; }
  void setUnselectedIconColor(Color? v) { unselectedIconColor = v; }

  List<Map>? themes = List<Map>.empty(growable: true);
  void addTheme(WTTheme? value) {
    List<Color>? colors = List<Color>.empty(growable: true);
    value!.theme!.forEach((k, v) { colors.add(Color(v)); });
    themes!.add({ 'key': value.key, 'label': value.title, 'selected': value.selected, 'colors': colors });
  }
  void addThemes(List<WTTheme>? list) {
    for(var t in list!) {
      List<Color>? colors = List<Color>.empty(growable: true);
      t.theme!.forEach((k, v) { colors.add(Color(v)); });
      themes!.add({ 'key': t.key, 'label': t.title, 'selected': t.selected, 'colors': colors });
    }
  }

}