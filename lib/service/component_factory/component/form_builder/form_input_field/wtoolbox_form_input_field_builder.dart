import 'package:flutter/material.dart';

mixin WTFormInputFieldBuilder {

  BoxDecoration? createContainerDecoration({
    Color? backgroundColor,
    Color? borderColor,
    double? width = 2.0,
    BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(6)),
  }) {
    return BoxDecoration(
      color: backgroundColor,
      border: Border.all(
        width: width!,
        color: borderColor!
      ),
      borderRadius: borderRadius!,
    );
  }

  Widget? createLabelContainer({
    Color? backgroundColor = Colors.transparent,
    Alignment? alignment   = Alignment.centerLeft,
    EdgeInsets? margin     = const EdgeInsets.all(0.0),
    FontWeight? fontWeight = FontWeight.bold,
    double? fontSize       = 15.0,
    String? label,
    Color? labelColor,
    TextStyle? textStyle,
    TextAlign? textAlign   = TextAlign.left,
  }) {
    if(label == null) { return const SizedBox.shrink(); }

    return Container(
      alignment: alignment,
      color: backgroundColor,
      margin: margin,
      child: Text(
        label,
        style: textStyle ?? TextStyle(
          color: labelColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        textAlign: textAlign,
      ),
    );
  }

  Widget? createInputFieldIcon({
    IconData? icon,
    Function? action,
    Color? color,
    double? size = 25.0
  }) {
    if(icon == null) { return null; }

    return GestureDetector(
      onTap: action != null ? () => action() : () {},
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }

}