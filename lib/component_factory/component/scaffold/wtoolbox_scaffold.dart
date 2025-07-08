import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTScaffold extends WTComponent {

  GlobalKey? globalKey;
  void setGlobalKey() { globalKey = GlobalKey<ScaffoldState>(); }

  VoidCallback? onSwipeAction;
  void onSwipe(VoidCallback? v) { onSwipeAction = v; }

  bool? unfocused = false;
  void isUnfocused(bool? v) { unfocused = v; }

  PreferredSizeWidget? header;
  void setHeader(PreferredSizeWidget? v) { header = v; }

  Widget? body;
  void setBody(Widget? v) { body = v; }

  Widget? flyMenu;
  void setFlyMenu(Widget? v) { flyMenu = v; }

  Widget? footer;
  void setFooter(Widget? v) { footer = v; }

}