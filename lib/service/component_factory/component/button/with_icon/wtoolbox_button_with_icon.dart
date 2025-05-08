import 'package:flutter/material.dart';
import '../wtoolbox_button.dart';
import '../../wtoolbox_component_builder.dart';

class WTButtonWithIcon extends WTButton {

  Widget? createIconWidget() {
    if(icon == null) { return WTComponentBuilder.emptyComponent(); }

    return WTComponentBuilder.createIcon(
      iconData: icon,
      size: iconSize!,
      color: iconColor,
    );
  }

  Widget? createTextWidget() {
    if(label == null) { return WTComponentBuilder.emptyComponent(); }

    label = label!.length > 30 ? '${label!.substring(0, 27)}...' : label!;

    EdgeInsets? lPadding = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
    EdgeInsets? lMargin  = icon != null ? const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0) : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

    return Container(
      padding: lPadding,
      margin: lMargin,
      child: WTComponentBuilder.createText(
        text: label,
        textAlign: TextAlign.center,
        textStyle: textStyle(
          textColor: labelColor,
          fontSize: labelSize,
        ),
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
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              createIconWidget()!, /// icon
              createTextWidget()!, /// label
            ],
          ),
        ),
      ),
    );
  }

}