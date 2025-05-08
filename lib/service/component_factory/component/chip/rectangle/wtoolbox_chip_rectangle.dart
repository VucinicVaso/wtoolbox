import 'package:flutter/material.dart';
import '../wtoolbox_chip.dart';
import '../../wtoolbox_component_builder.dart';

class WTChipRectangle extends WTChip {

  Widget? createPrimaryIconWidget() {
    return WTComponentBuilder.createIcon(
      iconData: primaryIcon,
      size: primaryIconSize,
      color: primaryIconColor,
    )!;
  }

  Widget? createLabelWidget() {
    EdgeInsets? labelPadding = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
    if(primaryIcon != null && secondaryIcon != null) { labelPadding = const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0); }
    if(primaryIcon != null && secondaryIcon == null) { labelPadding = const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0); }
    if(primaryIcon == null && secondaryIcon != null) { labelPadding = const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0); }

    return Container(
      padding: labelPadding,
      child: WTComponentBuilder.createText(
        text: label!,
        textAlign: TextAlign.center,
        textStyle: textStyle(
          textColor: labelColor,
          fontSize: labelSize,
        ),
      )!,
    );
  }

  Widget? createSecondaryIconWidget() {
    return WTComponentBuilder.createIcon(
      iconData: secondaryIcon,
      size: secondaryIconSize,
      color: secondaryIconColor,
    )!;
  }

  Widget? createBody() {
    if(primaryIcon == null && label == null && secondaryIcon == null) {
      return WTComponentBuilder.emptyComponent();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        createPrimaryIconWidget()!,
        createLabelWidget()!,
        createSecondaryIconWidget()!,
      ],
    );
  }

  @override
  Widget? build() {
    return Center(
      key: getUniqueKey(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: padding!,
            margin: margin,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: createBody(),
          ),
        ],
      ),
    );
  }

}