import 'package:flutter/material.dart';
import '../wtoolbox_text.dart';
import '../../wtoolbox_component_builder.dart';

class WTTextTitle extends WTText {

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width     = constraints.maxWidth;
        titleSize = titleScale != null ? width! * titleScale! : width! * 0.055;

        return Container(
          key: getUniqueKey(),
          alignment: alignment,
          width: width,
          margin: margin,
          padding: padding,
          color: backgroundColor,
          child: WTComponentBuilder.createText(
            text: title!,
            textAlign: titleAlign,
            textStyle: textStyle(
              textColor: titleColor,
              fontSize: titleSize,
              fontWeight: titleFontWeight,
            ),
          ),
        );
      }
    );
  }

}