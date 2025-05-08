import 'package:flutter/material.dart';
import '../wtoolbox_button.dart';
import '../../wtoolbox_component_builder.dart';

class WTFabExtended extends WTButton {

  Widget? createIconWidget() {
    if(icon == null) { return WTComponentBuilder.emptyComponent(); }

    return WTComponentBuilder.createIcon(
      iconData: icon,
      size: iconSize,
      color: iconColor,
    )!;
  }

  Widget? createTextWidget() {
    if(label == null) { return WTComponentBuilder.emptyComponent(); }

    label = label!.length > 10 ? '${label!.substring(0, 10)}...' : label!;

    return WTComponentBuilder.createText(
      text: label,
      textStyle: textStyle(textColor: labelColor, fontSize: labelSize)
    )!;
  }

  @override
  Widget? build() {
    return FloatingActionButton.extended(
      heroTag: getUniqueKey(),
      focusColor: backgroundColor,
      backgroundColor: backgroundColor,
      extendedPadding: padding,
      onPressed: () => action!(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0)
      ),
      icon: createIconWidget()!,
      label: createTextWidget()!,
    );
  }

}