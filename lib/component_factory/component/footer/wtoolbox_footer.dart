import 'package:flutter/material.dart';
import '../../component/wtoolbox_component.dart';

abstract class WTFooter extends WTComponent {

  double? itemIconSize, itemLabelSize;
  void setItemIconSize(double? v) { itemIconSize = v; }
  void setItemLabelSize(double? v) { itemLabelSize = v; }

  List<Map>? items = List<Map>.empty(growable: true);
  void addItem({ IconData? icon, String? label }) { items!.add({ 'icon': icon, 'label': label }); }
  void addItems(List<Map>? v) { items = v; }

  int? selectedItem = 0;
  void setSelectedItem(int? v) { selectedItem = v; }

  Function? selectedItemAction;
  void setSelectedItemAction(Function? v) { selectedItemAction = v; }

  Color? selectedItemIconColor, selectedItemLabelColor, selectedItemBackgroundColor,
      unselectedItemIconColor, unselectedItemLabelColor, unselectedItemBackgroundColor;
  void setSelectedItemIconColor(Color? v) { selectedItemIconColor = v; }
  void setSelectedItemLabelColor(Color? v) { selectedItemLabelColor = v; }
  void setSelectedItemBackgroundColor(Color? v) { selectedItemBackgroundColor = v; }
  void setUnselectedItemIconColor(Color? v) { unselectedItemIconColor = v; }
  void setUnselectedItemLabelColor(Color? v) { unselectedItemLabelColor = v; }
  void setUnselectedItemBackgroundColor(Color? v) { unselectedItemBackgroundColor = v; }

  EdgeInsets? itemPadding, itemMargin;
  void setItemPadding({ double? left = 0.0, double? top = 0.0, double? right = 0.0, double? bottom = 0.0 }) {
    itemPadding = EdgeInsets.fromLTRB(left!, top!, right!, bottom!);
  }
  void setItemMargin({ double? left = 0.0, double? top = 0.0, double? right = 0.0, double? bottom = 0.0 }) {
    itemMargin = EdgeInsets.fromLTRB(left!, top!, right!, bottom!);
  }

}