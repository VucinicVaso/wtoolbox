import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTDismissibleComponent extends WTComponent {

  VoidCallback? action;
  void setAction(VoidCallback? v) { action = v; }

  Color? swipeColorStart, swipeColorEnd;
  void setSwipeStartColor(Color? v) { swipeColorStart = v; }
  void setSwipeEndColor(Color? v) { swipeColorEnd = v; }

  IconData? icon;
  double? iconSize;
  Color? iconColor;
  void setIcon(IconData? v) { icon = v; }
  void setIconSize(double? v) { iconSize = v; }
  void setIconColor(Color? v) { iconColor = v; }

  Widget? component;
  void addComponent(Widget? v) { component = v; }

}