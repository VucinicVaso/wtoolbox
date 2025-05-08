import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTButton extends WTComponent {

  bool? smallButton = false, mediumButton = false, largeButton  = false;
  void setSmallButton() { smallButton = true; }
  void setMediumButton() { mediumButton = true; }
  void setLargeButton() { mediumButton = true; }

  VoidCallback? action;
  void setAction(VoidCallback? v) { action = v; }

  bool? underline = false;
  void enableUnderline() { underline = true; }

  IconData? icon, decorationIcon;
  double? iconSize, decorationIconSize;
  Color? iconColor, iconBackgroundColor, decorationIconColor, decorationIconBackgroundColor;
  void setIcon(IconData? v) { icon = v; }
  void setIconSize(double? v) { iconSize = v; }
  void setIconColor(Color? v) { iconColor = v; }
  void setIconBackgroundColor(Color? v) { iconBackgroundColor = v; }
  void setDecorationIcon(IconData? v) { decorationIcon = v; }
  void setDecorationIconSize(double? v) { decorationIconSize = v; }
  void setDecorationIconColor(Color? v) { decorationIconColor = v; }
  void setDecorationIconBackgroundColor(Color? v) { decorationIconBackgroundColor = v; }

  String? label;
  double? labelSize;
  Color? labelColor;
  void setLabel(String? v) { label = v; }
  void setLabelSize(double? v) { labelSize = v; }
  void setLabelColor(Color? v) { labelColor = v; }

  List<Widget>? buttons = List.empty(growable: true);
  void addButton(Widget? v) { buttons!.add(v!); }
  void addButtons(List<Widget>? v) { buttons!.addAll(v!); }

}