import 'package:flutter/material.dart';
import '../wtoolbox_button.dart';
import '../../wtoolbox_component_builder.dart';

class WTFabStandard extends WTButton {

  @override
  Widget? build() {
    return FloatingActionButton(
      heroTag: getUniqueKey(),
      mini: smallButton!,
      backgroundColor: backgroundColor,
      onPressed: () => action!(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0)
      ),
      child: WTComponentBuilder.createIcon(
        iconData: icon,
        size: iconSize,
        color: iconColor,
      )!,
    );
  }

}