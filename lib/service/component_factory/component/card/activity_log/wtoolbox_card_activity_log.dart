import 'package:flutter/material.dart';
import '../wtoolbox_card.dart';
import '../wtoolbox_card_builder.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardActivityLog extends WTCard with WTCardBuilder {

  /// heading
  Widget? createLeftSideWidget() {
    if(heading == null) { return WTComponentBuilder.emptyComponent(); }

    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
      color: Colors.transparent,
      alignment: Alignment.center,
      child: WTComponentBuilder.createText(
        text: heading,
        textAlign: TextAlign.center,
        textStyle: textStyle(
          textColor: headingColor,
          fontSize: headingSize,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  /// icon, title, subtitle, actionIcon
  Widget? createRightSideWidget() {
    /// icon
    Widget? iconWidget = WTComponentBuilder.emptyComponent();
    if(icon != null) {
      iconWidget = createIconHolder(
        containerPadding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        containerMargin: const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
        iconData: icon,
        iconSize:  iconSize,
        iconColor: iconColor,
        iconBackgroundColor: iconBackgroundColor,
        iconBorderColor: iconBorderColor
      );
    }

    /// title, subtitle
    Widget? labelsWidget = Expanded(child: WTComponentBuilder.emptyComponent()!);
    if(title != null && subtitle != null) {
      Widget? titleWidget = WTComponentBuilder.emptyComponent();
      if(title != null) {
        titleWidget = WTComponentBuilder.createText(
          text:  title,
          fontWeight: FontWeight.bold,
          textStyle: textStyle(
            textColor: titleColor,
            fontSize: titleSize,
            fontWeight: FontWeight.bold
          ),
        )!;
      }

      Widget? subtitleWidget = WTComponentBuilder.emptyComponent();
      if(subtitle != null) {
        subtitleWidget = WTComponentBuilder.createText(
          text: subtitle,
          textStyle: textStyle(
            textColor: subtitleColor,
            fontSize: subtitleSize,
          ),
        )!;
      }

      labelsWidget = Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleWidget!,               /// title
            const SizedBox(height: 5.0),
            subtitleWidget!,            /// subtitle
          ],
        ),
      );
    }

    /// action icon
    Widget? actionIconWidget = WTComponentBuilder.emptyComponent();
    if(actionIcon != null) {
      actionIconWidget = createIconWidget(
        showBoxDecoration: false,
        containerSize: actionIconSize,
        containerPadding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        containerMargin: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
        iconData: actionIcon,
        iconColor: actionIconColor,
        iconBackgroundColor: actionIconBackgroundColor,
        iconBorderColor: actionIconBorderColor
      );
    }

    return Expanded(
      child: GestureDetector(
        onTap: action ?? () {},
        child: Container(
          padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          decoration: BoxDecoration(
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
          ),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              iconWidget!,       /// icon
              labelsWidget,      /// title, subtitle
              actionIconWidget!, /// actionIcon
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      builder: (context, constraints) {
        width          = constraints.maxWidth;
        padding        = padding ?? const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0);
        margin         = margin ?? const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0);
        headingSize    = width! * 0.04;
        iconSize       = width! * 0.065;
        actionIconSize = width! * 0.065;
        titleSize      = width! * 0.04;
        subtitleSize   = width! * 0.03;

        return Container(
          key: getUniqueKey(),
          width: width!,
          color: Colors.transparent,
          padding: padding,
          margin: margin,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              createLeftSideWidget()!,  /// heading
              createRightSideWidget()!, /// icon, title, subtitle, actionIcon
            ],
          ),
        );
      }
    );
  }

}