import 'package:flutter/material.dart';
import '../wt_widget.dart';
import '../header/wt_header.dart';
import '../body/wt_body.dart';
import '../floating_menu/wt_floating_menu.dart';
import '../footer/wt_footer.dart';

abstract class WTScaffold extends WTWidget {

  GlobalKey? globalKey;
  void setGlobalKey() { globalKey = GlobalKey<ScaffoldState>(); }

  VoidCallback? onSwipeAction;
  void onSwipe(VoidCallback? v) { onSwipeAction = v; }

  bool? unfocused = false;
  void isUnfocused(bool? v) { unfocused = v; }

  WTHeader? header;
  void setHeader(WTHeader? v) { header = v; }

  WTBody? body;
  void setBody(WTBody? v) { body = v; }

  WTFloatingMenu? floatingMenu;
  void setFlyMenu(WTFloatingMenu? v) { floatingMenu = v; }

  WTFooter? footer;
  void setFooter(WTFooter? v) { footer = v; }

}