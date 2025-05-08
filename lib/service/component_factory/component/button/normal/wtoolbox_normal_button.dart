import 'package:flutter/material.dart';
import '../wtoolbox_button.dart';
import '../../wtoolbox_component_builder.dart';

class WTNormalButton extends WTButton {

  BoxDecoration? boxDecoration() {
    if(!underline!) {
      return BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      );
    }

    return BoxDecoration(
      color: backgroundColor,
      border: Border(
        bottom: BorderSide(
          color: labelColor!,
          width: 1.0,
        ),
      ),
    );
  }

  Widget? textWidget() {
    if(label == null) { WTComponentBuilder.emptyComponent(); }

    return WTComponentBuilder.createText(
      text: label,
      textAlign: TextAlign.center,
      textStyle: textStyle(
        textColor: labelColor,
        fontSize: labelSize,
      ),
    );
  }

  @override
  Widget? build() {
    return GestureDetector(
      key: getUniqueKey(),
      onTap: action ?? () {},
      child: IntrinsicWidth(
        child: Container(
          padding: padding,
          margin: margin,
          alignment: Alignment.center,
          decoration: boxDecoration(),
          child: textWidget()!,
        ),
      ),
    );
  }

}