import 'package:flutter/material.dart';
import '../wtoolbox_layout.dart';

class WTLayoutVerticalExpandableAndScrollable extends WTLayout {

  @override
  Widget? build() {
    return Expanded(
      key: getUniqueKey(),
      child: Container(
        color: backgroundColor,
        width: width,
        padding: padding!,
        margin: margin!,
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
      ),
    );
  }

}