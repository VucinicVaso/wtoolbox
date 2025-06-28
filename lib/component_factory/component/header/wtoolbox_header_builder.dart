import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:wtoolbox/external/lib_fonts.dart';

class WTHeaderBuilder {

  static TextStyle? textStyle({
    String? googleFonts,
    Color? textColor, 
    double? fontSize, 
    FontWeight? fontWeight = FontWeight.normal 
  }) {
    if(googleFonts != null && googleFonts.isNotEmpty) {
      return GoogleFonts.getFont(
        googleFonts,
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
    }

    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static Widget? createNetworkImage({
    EdgeInsets? padding    = const EdgeInsets.all(0.0),
    EdgeInsets? margin     = const EdgeInsets.all(0.0),
    double? size           = 35.0,
    Color? backgroundColor = Colors.transparent,
    String? image,
  }) {
    return Container(
      padding: padding,
      margin: margin,
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0)
        ),
        color: backgroundColor,
        image: DecorationImage(
          image: NetworkImage(image!),
          fit: BoxFit.cover
        ),
      ),
    );
  }

  static Widget? createAssetsImage({
    EdgeInsets? padding    = const EdgeInsets.all(0.0),
    EdgeInsets? margin     = const EdgeInsets.all(0.0),
    double? size           = 35.0,
    Color? backgroundColor = Colors.transparent,
    String? image,
  }) {
    return Container(
      padding: padding,
      margin: margin,
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        color: backgroundColor,
        image: DecorationImage(
          image: NetworkImage(image!),
          fit: BoxFit.cover
        ),
      ),
    );
  }

  static Widget? createMemoryImage({
    EdgeInsets? padding    = const EdgeInsets.all(0.0),
    EdgeInsets? margin     = const EdgeInsets.all(0.0),
    double? size           = 35.0,
    Color? backgroundColor = Colors.transparent,
    Uint8List? image,
  }) {
    return Container(
      padding: padding,
      margin: margin,
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        color: backgroundColor,
        image: DecorationImage(
          image: MemoryImage(image!),
          fit: BoxFit.cover
        ),
      ),
    );   
  }

}