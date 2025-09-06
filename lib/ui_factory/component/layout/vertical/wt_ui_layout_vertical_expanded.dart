import 'package:flutter/material.dart';
import '../wt_ui_layout.dart';

class WTUILayoutVerticalExpanded extends WTUILayout {

  @override
  Widget? build() {
    return Expanded(
      key: getUniqueKey(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          width  = constraints.maxWidth;
          height = constraints.maxHeight;

          return Container(
            color: backgroundColor,
            width: width,
            padding: padding!,
            margin: margin!,
            alignment: alignment,
            child: components!.isEmpty 
              ? SizedBox.shrink()
              : Column(
                mainAxisAlignment: mainAxisAlignment!,
                crossAxisAlignment: crossAxisAlignment!,
                children: <Widget>[
                  ...components!.map((c) {
                    c..setWidth(width)..setHeight(height);
                    return c.build()!;
                  }),
                ],
              ),
          );
        },
      ),
    );
  }

}