import 'package:flutter/material.dart';
import '../wt_layout.dart';

class WTLayoutVerticalExpandedAndScrollable extends WTLayout {

  @override
  Widget? build() {
    return Expanded(
      child: LayoutBuilder(
        key: getUniqueKey(),
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
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: mainAxisAlignment!,
                    crossAxisAlignment: crossAxisAlignment!,
                    children: <Widget>[
                      ...components!.map((c) {
                        c..setWidth(width)..setHeight(height);
                        return c.build()!;
                      }),
                    ],
                  ),
                ),
          );
        }
      ),
    );
  }

}