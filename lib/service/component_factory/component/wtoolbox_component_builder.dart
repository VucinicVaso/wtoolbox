import 'package:flutter/material.dart';
import '../../../3rd_party/lib_fontaws.dart';

enum WTComponentBuilderIconType {
  fontAwesome,
  materialIcons
}

class WTComponentBuilder {

  static Widget? emptyComponent() { return const SizedBox.shrink(); }

  static Widget? sizedComponent({ double? width = 0.0, double? height = 0.0 }) {
    return SizedBox(width: width!, height: height!); }

  static Widget? createIcon({ IconData? iconData, double? size, Color? color }) {
    if(iconData == null) { return emptyComponent(); }
    return Icon(iconData, size: size, color: color);
  }

  static Widget? createFaIcon({ String? iconData, double? size, Color? color }) {
    if(iconData == null) { return emptyComponent(); }
    return FaIcon(faIconNameMapping[iconData], size: size!, color: color!);
  }

  static Widget? createText({
    String? text,
    TextAlign? textAlign = TextAlign.start,
    TextStyle? textStyle,
    Color? color,
    double? size,
    FontWeight? fontWeight = FontWeight.normal,
  }) {
    if(text == null) { return emptyComponent(); }

    if(textStyle != null) {
      return Text(
        text,
        textAlign: textAlign,
        style: textStyle,
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }

}