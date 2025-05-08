import 'package:flutter/material.dart';
import '../wtoolbox_button.dart';
import '../../wtoolbox_component_builder.dart';

class WTWideButton extends WTButton {

  Widget? textWidget() {
    if(label == null) { WTComponentBuilder.emptyComponent(); }

    label = label!.length > 18 ? '${label!.substring(0, 15)}...' : label!;

    return WTComponentBuilder.createText(
      text: label,
      textAlign: TextAlign.center,
      textStyle: textStyle(
        textColor: labelColor,
        fontSize: labelSize
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(smallButton!) { width = constraints.maxWidth * 0.45; }
        if(mediumButton!) { width = constraints.maxWidth * 0.65; }
        if(largeButton!) { width = constraints.maxWidth; }

        return GestureDetector(
          key: getUniqueKey(),
          onTap: action ?? () {},
          child: Container(
            width: width,
            padding: padding,
            margin: margin,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            child: textWidget()!,
          ),
        );
      },
    );
  }

}