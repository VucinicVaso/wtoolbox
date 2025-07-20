import 'package:flutter/material.dart';
import '../wt_divider_widget.dart';

class WTDividerWidgetHorizontal extends WTDividerWidget {

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width  = constraints.maxWidth;
        margin = margin ?? const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0);

        return Container(
          key: getUniqueKey(),
          width: width,
          height: thickness,
          margin: margin,
          color: backgroundColor,
        );
      }
    );
  }

}