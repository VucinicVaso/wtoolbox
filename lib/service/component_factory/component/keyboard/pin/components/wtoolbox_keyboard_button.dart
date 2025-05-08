import 'package:flutter/material.dart';
import '../../../wtoolbox_component_builder.dart';

// ignore: must_be_immutable
class WTKeyboardButton extends StatelessWidget {

  Function? action;
  double? width, height, labelSize, iconSize;
  EdgeInsets? padding, margin;
  IconData? icon;
  String? label;
  Color? backgroundColor, labelColor, iconColor;

  WTKeyboardButton({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.action,
    this.label,
    this.labelSize,
    this.labelColor,
    this.icon,
    this.iconSize,
    this.iconColor,
  });

  Widget? createBody() {
    if(label != null) {
      return WTComponentBuilder.createText(text: label, color: labelColor, size: labelSize, textAlign: TextAlign.center);
    }

    if(icon != null) {
      return WTComponentBuilder.createIcon(iconData: icon, color: iconColor, size: iconSize);
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action!(),
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: createBody(),
      ),
    );
  }

}