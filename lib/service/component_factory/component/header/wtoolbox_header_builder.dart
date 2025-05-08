import 'dart:typed_data';
import 'package:flutter/material.dart';

class WTHeaderBuilder {

  static Widget? createImageFromNetwork({
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

  static Widget? createImageFromAssets({
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

  static Widget? createImageFromMemory({
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