import 'package:flutter/material.dart';
import '../wt_layout.dart';

class WTLayoutVertical extends WTLayout {

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width  = constraints.maxWidth;
        height = constraints.maxHeight;
        if(small == true) { width = width! * 0.33; }
        if(medium == true) { width = width! * 0.5; }
        if(large == true) { width = width; }

        return Container(
          key: getUniqueKey(),
          color: backgroundColor,
          padding: padding,
          margin: margin,
          width: width,
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
      }
    );
  }

}