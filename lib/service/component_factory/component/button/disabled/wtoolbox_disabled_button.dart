import 'package:flutter/material.dart';
import '../wtoolbox_button.dart';
import '../../wtoolbox_component_builder.dart';

class WTDisabledButton extends WTButton {

  Widget? createTextWidget() {
    if(label == null) { WTComponentBuilder.emptyComponent(); }

    label = label!.length > 12 ? '${label!.substring(0, 12)}...' : label!;

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
    return IntrinsicWidth(
      key: getUniqueKey(),
      child: Container(
        padding: padding,
        margin: margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor!,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: createTextWidget()!,
      ),
    );
  }

}