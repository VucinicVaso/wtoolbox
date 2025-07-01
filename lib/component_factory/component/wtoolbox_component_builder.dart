import 'package:flutter/material.dart';

enum WTComponentBuilderIconType {
  symbols,
  fontAwesome,
  materialIcons
}

class WTComponentBuilder {

  static Widget? emptyComponent() { 
    return const SizedBox.shrink(); 
  }

  static Widget? sizedComponent({ double? width = 0.0, double? height = 0.0 }) {
    return SizedBox(width: width!, height: height!); 
  }

}