import 'package:flutter/material.dart';
import '../wtoolbox_card.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardBadge extends WTCard {

  BoxDecoration? createBoxDecoration() {
    BoxDecoration? boxDecoration = BoxDecoration(color: backgroundColor);

    if(borderEnabled!) {
      boxDecoration = BoxDecoration(
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

    return boxDecoration;
  }

  /// title, subtitle
  Widget? topWidgetLeftWidget() {
    if(title == null && subtitle == null) { return WTComponentBuilder.emptyComponent(); }

    var titleWidget = WTComponentBuilder.emptyComponent();
    if(title != null) {
      titleWidget = WTComponentBuilder.createText(
        text: title,
        textStyle: textStyle(
          textColor: titleColor,
          fontSize: titleSize,
        ),
      )!;
    }

    Widget? spaceBetweenWidget = title != null && subtitle != null ? const SizedBox(height: 5.0) : WTComponentBuilder.emptyComponent()!;

    var subtitleWidget = WTComponentBuilder.emptyComponent();
    if(subtitle != null) {
      subtitleWidget = WTComponentBuilder.createText(
        text: subtitle,
        textStyle: textStyle(
          textColor: subtitleColor,
          fontSize: subtitleSize,
        ),
      )!;
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleWidget!,       /// title
          spaceBetweenWidget, /// space between
          subtitleWidget!,    /// subtitle
        ],
      ),
    );
  }

  /// actionLabel, actionSubLabel
  Widget? topWidgetRightWidget() {
    if(actionLabel == null && actionSubLabel == null) { return WTComponentBuilder.emptyComponent(); }

    Widget? actionLabelWidget = WTComponentBuilder.emptyComponent();
    if(actionLabel != null) {
      actionLabelWidget = WTComponentBuilder.createText(
        text: actionLabel,
        textAlign: TextAlign.right,
        textStyle: textStyle(
          textColor: actionLabelColor,
          fontSize: actionLabelSize,
        ),
      )!;
    }

    Widget? spaceBetweenWidget = actionLabel != null && actionSubLabel != null ? const SizedBox(height: 5.0) : WTComponentBuilder.emptyComponent()!;

    Widget? actionSubLabelWidget = WTComponentBuilder.emptyComponent();
    if(actionSubLabel != null) {
      actionSubLabelWidget = WTComponentBuilder.createText(
        text: actionSubLabel,
        textAlign: TextAlign.right,
        textStyle: textStyle(
          textColor: actionSubLabelColor,
          fontSize: actionSubLabelSize,
        ),
      )!;
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          actionLabelWidget!,    /// actionLabel
          spaceBetweenWidget,    /// space between
          actionSubLabelWidget!, /// actionSubLabel
        ],
      ),
    );
  }

  /// title, subtitle, actionLabel, actionSubLabel
  Widget topWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        topWidgetLeftWidget()!,  /// title, subtitle
        topWidgetRightWidget()!, /// actionLabel, actionSubLabel
      ],
    );
  }

  /// badges
  Widget? bottomWidget() {
    if(badges!.isEmpty) { return WTComponentBuilder.emptyComponent(); }

    List<Widget>? badgeComponents = List<Widget>.empty(growable: true);
    for(var b in badges!) {
      badgeComponents.add(
        Container(
          padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          margin: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: b['color']!.withAlpha(100),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: WTComponentBuilder.createText(
            text: b['label']!,
            textAlign: TextAlign.center,
            textStyle: textStyle(
              textColor: b['color'],
              fontSize: badgeSize,
            ),
          )!,
        )
      );
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...badgeComponents,
          ],
        ),
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width = constraints.maxWidth;
        titleSize          = width! * 0.045;
        subtitleSize       = width! * 0.035;
        actionLabelSize    = width! * 0.045;
        actionSubLabelSize = width! * 0.035;
        badgeSize          = width! * 0.03;

        return GestureDetector(
          onTap: action ?? () {},
          child: Container(
            alignment: Alignment.center,
            width: width,
            padding: padding,
            margin: margin,
            decoration: createBoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                topWidget(),     /// title, subtitle, actionLabel, actionSubLabel
                bottomWidget()!, /// badges
              ],
            ),
          ),
        );
      }
    );
  }

}