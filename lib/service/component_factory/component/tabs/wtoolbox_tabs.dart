import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTTabs extends WTComponent {

  Function? action;
  void setAction(Function? v) { action = v; }

  int? selectedTab = 0;
  void setSelectedTab(int? v) { selectedTab = v; }

  List<Map>? tabs = List<Map>.empty(growable: true);
  void addTab({ int? key, String? label }) { tabs!.add({ 'key': key, 'label': label }); }
  void addTabs(List<Map>? v) { tabs!.addAll(v!); }

  List<Widget>? components = List<Widget>.empty(growable: true);
  void addComponent(Widget? v) { components!.add(v!); }
  void addComponents(List<Widget>? v) { components!.addAll(v!); }

  double? labelSize;
  Color? labelColor, activeLabelColor, activeBackgroundColor;
  void setLabelSize(double? v) { labelSize = v; }
  void setLabelColor(Color? v) { labelColor = v; }
  void setActiveLabelColor(Color? v) { activeLabelColor = v; }
  void setActiveBackgroundColor(Color? v) { activeBackgroundColor = v; }

}