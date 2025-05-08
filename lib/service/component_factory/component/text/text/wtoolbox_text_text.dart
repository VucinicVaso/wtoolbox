import 'package:flutter/material.dart';
import '../wtoolbox_text.dart';
import '../../wtoolbox_component_builder.dart';

class WTTextText extends WTText {

  @override
  Widget? build() {
    return LayoutBuilder(
      builder: (context, constraints) {
        width    = constraints.maxWidth;
        textSize = width! * 0.0425;

        return Container(
          key: getUniqueKey(),
          alignment: alignment,
          color: backgroundColor,
          margin: margin,
          padding: padding,
          child: WTComponentBuilder.createText(
            text: text!,
            textAlign: textAlign,
            textStyle: textStyle(
              textColor: textColor,
              fontSize: textSize,
              fontWeight: textFontWeight
            ),
          ),
        );
      }
    );
  }

}