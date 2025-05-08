import 'package:flutter/material.dart';
import '../wtoolbox_card.dart';
import '../wtoolbox_card_builder.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardQuickAction extends WTCard with WTCardBuilder {

  BoxDecoration? createBoxDecoration() {
    BoxDecoration? boxDecoration = BoxDecoration(color: backgroundColor!);

    if(borderEnabled!) {
      return BoxDecoration(
        color: backgroundColor!,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(width: 1, color: borderColor!),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadeColor!,
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      );
    }

    return boxDecoration;
  }

  /// primaryIcon, decorationIcon
  Widget? topWidget() {
    if(icon != null && decorationIcon == null) {
      return createIconHolder(
        containerPadding: const EdgeInsets.all(5.0),
        containerMargin: const EdgeInsets.all(5.0),
        iconData: icon,
        iconSize: iconSize!,
        iconColor: iconColor,
        iconBackgroundColor: iconBackgroundColor,
        iconBorderColor: iconBorderColor,
      );
    }

    if(icon != null && decorationIcon != null) {
      return createStackedIconHolder(
        containerSize: iconSize! + (iconSize! * 0.2),
        containerMargin: const EdgeInsets.all(5.0),
        iconData: icon,
        iconSize: iconSize,
        iconColor: iconColor,
        iconBackgroundColor: iconBackgroundColor,
        iconBorderColor: iconBorderColor,
        iconPadding: const EdgeInsets.all(5.0),
        decorationIcon: decorationIcon,
        decorationIconSize: decorationIconSize,
        decorationIconColor: decorationIconColor,
        decorationIconBackgroundColor: decorationIconBackgroundColor,
        decorationIconBorderColor: decorationIconBorderColor,
      );
    }

    return WTComponentBuilder.emptyComponent();
  }

  /// title
  Widget? bottomWidget() {
    if(title == null) { return WTComponentBuilder.emptyComponent(); }

    String text = '';
    double? textSize = 0.0;
    if(title!.length > 12) {
      StringBuffer result = StringBuffer();
      int maxChars = 12;
      for (int i = 0; i < title!.length; i += maxChars) {
        int end = i + maxChars;
        end = end > title!.length ? title!.length : end;
        result.write('${title!.substring(i, end)}\n');

        text = result.toString().trimRight();
        textSize = titleSize! * 0.8;
      }
    }else {
      text = title!;
      textSize = titleSize;
    }

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5.0),
      child: WTComponentBuilder.createText(
        text: text,
        textAlign: TextAlign.center,
        textStyle: textStyle(
          textColor: titleColor,
          fontSize: textSize,
          fontWeight: FontWeight.normal
        ),
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      builder: (context, constraints) {
        width              = constraints.maxWidth;
        titleSize          = width! * 0.085;
        iconSize           = width! * 0.25;
        decorationIconSize = width! * 0.125;

        return GestureDetector(
          key: getUniqueKey(),
          onTap: action ?? () {},
          child: Container(
            alignment: Alignment.center,
            width: width,
            padding: padding,
            margin: margin,
            decoration: createBoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                topWidget()!,    /// primaryIcon, decorationIcon
                bottomWidget()!, /// title
              ],
            ),
          ),
        );
      }
    );
  }

}