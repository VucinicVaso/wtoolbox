import 'package:flutter/material.dart';
import '../wt_ui_component.dart';

abstract class WTUIWrap extends WTUIComponent {
  
  Axis? direction;
  void setHorizontalDirection() { direction = Axis.horizontal; }
  void setVerticalDirection() { direction = Axis.vertical; }

  List<WTUIComponent>? components = List<WTUIComponent>.empty(growable: true);
  void addComponent(WTUIComponent? v) { components!.add(v!); }
  void addComponents(List<WTUIComponent>? v) { components!.addAll(v!); }

}