import 'package:flutter/material.dart';
import '../wtoolbox_layout.dart';

class WTLayoutVerticalScrollable extends WTLayout {

  @override
  Widget? build() {
    return Container(
      key: getUniqueKey(),
      color: backgroundColor,
      padding: padding,
      margin: margin,
      width: width,
      alignment: alignment,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: mainAxisAlignment!,
          crossAxisAlignment: crossAxisAlignment!,
          children: <Widget>[
            ...components!,
          ],
        ),
      ),
    );
  }

}