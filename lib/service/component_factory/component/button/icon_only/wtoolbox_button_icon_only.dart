import 'package:flutter/material.dart';
import '../wtoolbox_button.dart';
import '../../wtoolbox_component_builder.dart';

class WTButtonIconOnly extends WTButton {

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
          child: Container(
            alignment: Alignment.center,
            child: WTComponentBuilder.createIcon(
              iconData: icon,
              size: iconSize!,
              color: iconColor
            ),
          ),
        ),
      ),
    );
  }

}