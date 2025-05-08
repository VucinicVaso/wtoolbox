import 'package:flutter/material.dart';
import '../wtoolbox_card.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardSetupProcess extends WTCard {

  /// heading
  Widget? leftWidget() {
    if(heading == null) { return WTComponentBuilder.emptyComponent(); }

    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: headingBackgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          width: 2.0,
          color: headingBorderColor!
        ),
      ),
      child: WTComponentBuilder.createText(
        text: heading,
        textAlign: TextAlign.center,
        textStyle: textStyle(
          textColor: headingColor,
          fontSize: headingSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// title, subtitle, description
  Widget? centerWidget() {
    Widget? titleWidget = WTComponentBuilder.emptyComponent()!;
    if(title != null) {
      titleWidget = Container(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
        child: WTComponentBuilder.createText(
          text: title,
          textAlign: TextAlign.start,
          textStyle: textStyle(
            textColor: titleColor,
            fontSize: titleSize,
            fontWeight: FontWeight.bold,
          ),
        )!
      );
    }

    Widget? subtitleWidget = WTComponentBuilder.emptyComponent()!;
    if(subtitle != null) {
      subtitleWidget = Container(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
        child: WTComponentBuilder.createText(
          text: subtitle,
          textAlign: TextAlign.start,
          textStyle: textStyle(
            textColor: subtitleColor,
            fontSize: subtitleSize,
            fontWeight: FontWeight.bold
          ),
        )!,
      );
    }

    Widget descriptionWidget = WTComponentBuilder.emptyComponent()!;
    if(description != null) {
      descriptionWidget = WTComponentBuilder.createText(
        text: description,
        textAlign: TextAlign.start,
        textStyle: textStyle(
          textColor: descriptionColor,
          fontSize: descriptionSize,
        ),
      )!;
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleWidget,       /// title
          subtitleWidget,    /// subtitle
          descriptionWidget, /// description
        ],
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      builder: (context, constraints) {
        width           = constraints.maxWidth;
        padding         = padding ?? const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0);
        margin          = margin ?? const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0);
        headingSize     = width! * 0.04;
        titleSize       = width! * 0.04;
        subtitleSize    = width! * 0.04;
        descriptionSize = width! * 0.04;

        return GestureDetector(
          key: getUniqueKey(),
          onTap: action ?? () {},
          child: Container(
            width: width!,
            padding: padding,
            margin: margin,
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
                leftWidget()!,   /// title
                centerWidget()!, /// subtitle, heading, description
              ],
            ),
          ),
        );
      }
    );
  }

}