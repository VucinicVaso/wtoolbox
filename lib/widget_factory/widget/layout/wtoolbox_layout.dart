import 'package:flutter/material.dart';
import '../wtoolbox_widget.dart';

abstract class WTLayout extends WTWidget {

  bool? scrollable = false;
  void setScrollable() { scrollable = true; }

  bool? expandable = false;
  void setExpandable() { expandable = true; }

  List<Widget>? widgets = List<Widget>.empty(growable: true);
  void addWidget(Widget? v) { widgets!.add(v!); }
  void addWidgets(List<Widget>? v) { widgets!.addAll(v!); }

}