import 'package:flutter/material.dart';
import '../wt_ui_wrap.dart';

class WTUIWrapImpl extends WTUIWrap {

  @override
  Widget? build() {
    return Container(
      width: width,
      padding: padding,
      margin: margin,
      alignment: Alignment.center,
      child: Wrap(
        direction: direction!,
        children: <Widget>[
          ...components!.map((c) {
            c..setWidth(width)..setHeight(height);
            return c.build()!;
          }),
        ],
      ),
    );
  }

}