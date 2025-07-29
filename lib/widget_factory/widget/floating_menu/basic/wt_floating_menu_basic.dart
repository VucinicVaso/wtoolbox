import 'package:flutter/material.dart';
import '../wt_floating_menu.dart';

class WtFloatingMenuBasic extends WTFloatingMenu {
  
  void setSizes() {
    iconSize = 25;  
  }

  @override
  Widget? build() {
    setSizes();

    return FloatingActionButton(
      heroTag: getUniqueKey(),
      mini: mini!,
      backgroundColor: backgroundColor,
      onPressed: action!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0)
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }

}