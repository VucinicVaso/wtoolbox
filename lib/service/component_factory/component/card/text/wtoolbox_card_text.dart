import 'package:flutter/material.dart';
import '../wtoolbox_card.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardText extends WTCard {

  BoxDecoration? createBoxDecoration() {
    if(!borderEnabled!) { return BoxDecoration(color: backgroundColor); }

    return BoxDecoration(
      color: backgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      border: Border.all(width: 2, color: borderColor!),
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

  /// title, subtitle
  Widget? leftWidget() {
    if(title == null && subtitle == null) { return WTComponentBuilder.emptyComponent(); }

    Widget? titleWidget = WTComponentBuilder.emptyComponent();
    if(title != null && title!.isEmpty == false) {
      titleWidget = Container(
        margin: const EdgeInsets.only(bottom: 5.0),
        child: WTComponentBuilder.createText(
          text:  title,
          textStyle: textStyle(
            textColor: titleColor,
            fontSize: titleSize
          ),
        )!,
      );
    }

    Widget? subtitleWidget = WTComponentBuilder.emptyComponent();
    if(subtitle != null && subtitle!.isEmpty == false) {
      subtitleWidget = Container(
        child: WTComponentBuilder.createText(
          text: subtitle,
          textStyle: textStyle(
            textColor: subtitleColor,
            fontSize: subtitleSize,
          ),
        )!,
      );
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleWidget!,    /// title
          subtitleWidget!, /// subtitle
        ],
      ),
    );
  }

  /// actionLabel, actionSubLabel
  Widget? rightWidget() {
    if(actionLabel == null && actionSubLabel == null) { return WTComponentBuilder.emptyComponent(); }

    Widget? actionLabelWidget = WTComponentBuilder.emptyComponent();
    if(actionLabel != null && actionLabel!.isEmpty == false) {
      actionLabelWidget = Container(
        margin: const EdgeInsets.only(bottom: 5.0),
        child: WTComponentBuilder.createText(
          text: actionLabel,
          textAlign: TextAlign.right,
          textStyle: textStyle(
            textColor: actionLabelColor,
            fontSize: actionLabelSize,
          ),
        )!,
      );
    }

    Widget? actionSubLabelWidget = WTComponentBuilder.emptyComponent();
    if(actionSubLabel != null && actionSubLabel!.isEmpty == false) {
      actionSubLabelWidget = Container(
        child: WTComponentBuilder.createText(
          text: actionSubLabel,
          textAlign: TextAlign.right,
          textStyle: textStyle(
            textColor: actionSubLabelColor,
            fontSize: actionSubLabelSize
          ),
        )!,
      );
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          actionLabelWidget!,    /// actionLabel
          actionSubLabelWidget!, /// actionSubLabel
        ],
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width              = constraints.maxWidth;
        padding            = padding ?? const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0);
        margin             = margin ?? const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0);
        titleSize          = width! * 0.045;
        subtitleSize       = width! * 0.04;
        actionLabelSize    = width! * 0.045;
        actionSubLabelSize = width! * 0.04;

        return GestureDetector(
          key: getUniqueKey(),
          onTap: action ?? () {},
          child: Container(
            alignment: Alignment.center,
            width: width,
            padding: padding,
            margin: margin,
            decoration: createBoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start, // center
              children: <Widget>[
                leftWidget()!,  /// title, subtitle
                rightWidget()!, /// actionLabel, actionSubLabel
              ],
            ),
          ),
        );
      }
    );
  }

}