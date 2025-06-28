import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTLayout extends WTComponent {

  bool? scrollable = false;
  void setScrollable() { scrollable = true; }

  bool? expandable = false;
  void setExpandable() { expandable = true; }

  List<Widget>? components = List<Widget>.empty(growable: true);
  void addComponent(Widget? v) { components!.add(v!); }
  void addComponents(List<Widget>? v) { components!.addAll(v!); }

}