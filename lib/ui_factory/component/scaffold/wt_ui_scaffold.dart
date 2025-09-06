import 'package:flutter/material.dart';
import '../wt_ui_component.dart';
import '../header/wt_ui_header.dart';
import '../body/wt_ui_body.dart';
import '../floating_menu/wt_ui_floating_menu.dart';
import '../footer/wt_ui_footer.dart';

abstract class WTUIScaffold extends WTUIComponent {

  GlobalKey? globalKey;
  void setGlobalKey() { globalKey = GlobalKey<ScaffoldState>(); }

  VoidCallback? onSwipeAction;
  void onSwipe(VoidCallback? v) { onSwipeAction = v; }

  bool? unfocused = false;
  void isUnfocused(bool? v) { unfocused = v; }

  WTUIHeader? header;
  void setHeader(WTUIHeader? v) { header = v; }

  WTUIBody? body;
  void setBody(WTUIBody? v) { body = v; }

  WTUIFloatingMenu? floatingMenu;
  void setFlyMenu(WTUIFloatingMenu? v) { floatingMenu = v; }

  WTUIFooter? footer;
  void setFooter(WTUIFooter? v) { footer = v; }

}