import 'package:flutter/material.dart';
import '../wtoolbox_divider_component.dart';

class WTDividerComponentHorizontal extends WTDividerComponent {

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