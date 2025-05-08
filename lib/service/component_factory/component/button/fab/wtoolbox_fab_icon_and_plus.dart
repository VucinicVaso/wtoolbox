import 'package:flutter/material.dart';
import '../wtoolbox_button.dart';
import '../../wtoolbox_component_builder.dart';

class WTFabIconAndPlus extends WTButton {

  @override
  Widget? build() {
    return FloatingActionButton(
      heroTag: getUniqueKey(),
      backgroundColor: backgroundColor,
      onPressed: () => action!(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0)
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Container(
              margin: const EdgeInsets.fromLTRB(20.0, 14.0, 0.0, 0.0),
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: decorationIconBackgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: WTComponentBuilder.createIcon(
                iconData: decorationIcon,
                size: decorationIconSize,
                color: decorationIconColor
              )!,
            ),
          ),
          Positioned(
            top: 11.0,
            left: 11.0,
            child: WTComponentBuilder.createIcon(
              iconData: icon,
              size: iconSize,
              color: iconColor
            )!,
          ),
        ],
      ),
    );
  }

}