import 'package:flutter/material.dart';
import '../wtoolbox_card.dart';
import '../wtoolbox_card_builder.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardQuickExtendedAction extends WTCard with WTCardBuilder {

  Decoration? createDecoration() {
    if(!borderEnabled!) { return BoxDecoration(color: backgroundColor); }

    return BoxDecoration(
      color: backgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      border: Border.all(
        width: 2,
        color: borderColor!
      ),
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

  /// icon, decorationIcon
  Widget? leftWidget() {
    if(icon != null && decorationIcon == null) {
      iconSize = width! * 0.075;

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
      iconSize           = width! * 0.075;
      decorationIconSize = width! * 0.045;

      return createStackedIconHolder(
        containerSize: iconSize! + (iconSize! * 0.2),
        containerMargin: const EdgeInsets.all(0.0),
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

  /// title, subtitle
  Widget? centerWidget() {
    if(title == null && subtitle == null) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: WTComponentBuilder.emptyComponent()!
        ),
      );
    }

    BoxDecoration? widgetDecoration = const BoxDecoration(color: Colors.transparent);
    if(underlineEnabled!) {
      widgetDecoration = BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade400,
            width: 2.0,
          ),
        ),
      );
    }

    Widget? titleWidget = WTComponentBuilder.emptyComponent()!;
    if(title != null) {
      double tSize         = width! * 0.045;
      titleSize            = title!.length > 30 ? tSize * 0.8 : tSize;
      EdgeInsets? tPadding = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
      EdgeInsets? tMargin  = subtitle != null ? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0) : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

      titleWidget = Container(
        padding: tPadding,
        margin: tMargin,
        child: WTComponentBuilder.createText(
          text: title,
          textAlign: TextAlign.start,
          textStyle: textStyle(
            textColor: titleColor,
            fontSize: titleSize,
            fontWeight: FontWeight.normal,
          ),
        )!,
      );
    }

    Widget? subtitleWidget = WTComponentBuilder.emptyComponent()!;
    if(subtitle != null) {
      double sSize         = width! * 0.045;
      subtitleSize         = subtitle!.length > 30 ? sSize * 0.8 : sSize;
      EdgeInsets? sPadding = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
      EdgeInsets? sMargin  = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

      subtitleWidget = Container(
        padding: sPadding,
        margin: sMargin,
        child: WTComponentBuilder.createText(
          text: subtitle,
          textAlign: TextAlign.start,
          textStyle: textStyle(
            textColor: subtitleColor,
            fontSize: subtitleSize,
          ),
        )!,
      );
    }

    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        padding: underlineEnabled! ? const EdgeInsets.only(bottom: 10.0) : const EdgeInsets.all(0.0),
        alignment: Alignment.centerLeft,
        decoration: widgetDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleWidget,    /// title
            subtitleWidget, /// subtitle
          ],
        ),
      ),
    );
  }

  /// actionIcon, actionDecorationIcon
  Widget? rightWidget() {
    if(actionIcon != null && actionDecorationIcon == null) {
      actionIconSize = width! * 0.075;

      return createIconHolder(
        showBoxDecoration: false,
        containerPadding: const EdgeInsets.all(5.0),
        containerMargin:  const EdgeInsets.all(5.0),
        iconData: actionIcon,
        iconSize: actionIconSize!,
        iconColor: actionIconColor,
        iconBackgroundColor: actionIconBackgroundColor,
        iconBorderColor: actionIconBorderColor,
      );
    }

    if(actionIcon != null && actionDecorationIcon != null) {
      actionIconSize           = width! * 0.075;
      actionDecorationIconSize = width! * 0.045;

      return createStackedIconHolder(
       showIconBoxDecoration: false,
        containerMargin: const EdgeInsets.all(0.0),
        iconData: actionIcon,
        iconSize: iconSize,
        iconColor: actionIconColor,
        iconBackgroundColor: actionIconBackgroundColor,
        iconBorderColor: actionIconBorderColor,
        iconPadding: const EdgeInsets.all(5.0),
        decorationIcon: actionDecorationIcon,
        decorationIconSize: decorationIconSize,
        decorationIconColor: actionDecorationIconColor,
        decorationIconBackgroundColor: actionDecorationIconBackgroundColor,
        decorationIconBorderColor: actionDecorationIconBorderColor,
      );
    }

    return WTComponentBuilder.emptyComponent();
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width = constraints.maxWidth;

        return GestureDetector(
          key: getUniqueKey(),
          onTap: action ?? () {},
          child: Container(
            width: width,
            padding: padding,
            margin: margin,
            alignment: Alignment.center,
            decoration: createDecoration()!,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                leftWidget()!,   /// icon, decorationIcon
                centerWidget()!, /// title, subtitle
                rightWidget()!,  /// actionIcon, actionDecorationIcon
              ],
            ),
          ),
        );
      }
    );
  }

}