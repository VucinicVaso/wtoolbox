import 'package:flutter/material.dart';
import '../wt_ui_divider.dart';

class WTUIDividerHorizontal extends WTUIDivider {

  void setSizes() {
    margin = margin ?? const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0);
  }

  @override
  Widget? build() {
    setSizes();

    return Container(
      key: getUniqueKey(),
      width: width,
      height: thickness,
      margin: margin,
      color: backgroundColor,
    );
  }

}