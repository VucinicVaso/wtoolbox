import 'package:flutter/material.dart';
import '../wtoolbox_layout.dart';

class WTLayoutHorizontal extends WTLayout {

  @override
  Widget? build() {
    return Container(
      key: getUniqueKey(),
      width: width,
      color: backgroundColor,
      padding: padding,
      margin: margin,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignment!,
        crossAxisAlignment: crossAxisAlignment!,
        children: <Widget>[
          ...components!.map((c) {
            if(c.runtimeType.toString() == 'GestureDetector') { return Container(child: c); }
            if(c.runtimeType.toString() == 'TextInputField') { return Expanded(child: c); }
            return c;
          }),
        ],
      ),
    );
  }

}