import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTInputButton extends WTComponent {

  Function? action;
  void setAction(Function? v) { action = v; }

  bool? checked;
  void isChecked(bool? v) { checked = v; }

  IconData? activeIcon, inactiveIcon;
  double? activeIconSize, inactiveIconSize;
  Color? activeIconColor, inactiveIconColor;
  void setActiveIcon(IconData? v) { activeIcon = v; }
  void setActiveIconSize(double? v) { activeIconSize = v; }
  void setActiveIconColor(Color? v) { activeIconColor = v; }
  void setInactiveIcon(IconData? v) { inactiveIcon = v; }
  void setInactiveIconSize(double? v) { inactiveIconSize = v; }
  void setInactiveIconColor(Color? v) { inactiveIconColor = v; }

  String? label;
  double? labelSize;
  Color? labelColor;
  void setLabel(String? v) { label = v; }
  void setLabelSize(double? v) { labelSize = v; }
  void setLabelColor(Color? v) { labelColor = v; }

}