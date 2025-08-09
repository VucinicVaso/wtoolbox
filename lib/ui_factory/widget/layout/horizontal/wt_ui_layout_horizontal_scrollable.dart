import 'package:flutter/material.dart';
import '../wt_ui_layout.dart';

class WTUILayoutHorizontalScrollable extends WTUILayout {

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width  = constraints.maxWidth;
        height = constraints.maxHeight;

        return Container(
          width: width,
          color: backgroundColor,
          padding: padding,
          margin: margin,
          child: widgets!.isEmpty
            ? SizedBox.shrink()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: mainAxisAlignment!,
                  crossAxisAlignment: crossAxisAlignment!,
                  children: <Widget>[
                    ...widgets!.map((c) {
                      c..setWidth(width)..setHeight(height);
                      return c.build()!;
                    }),
                  ],
                ),
              ),
        );
      }
    );
  }

}