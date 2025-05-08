import 'package:flutter/material.dart';
import '../wtoolbox_text.dart';
import '../../wtoolbox_component_builder.dart';

class WTTextParagraph extends WTText {

  Widget? createTitleWidget() {
    if(title == null) { return WTComponentBuilder.emptyComponent(); }

    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: WTComponentBuilder.createText(
        text: title!,
        textAlign: titleAlign,
        textStyle: textStyle(
          textColor: titleColor,
          fontSize: titleSize,
          fontWeight: titleFontWeight
        ),
      )!,
    );
  }

  Widget? createTextWidget() {
    if(text == null) { return WTComponentBuilder.emptyComponent(); }

    return Container(
      padding: borderEnabled!
        ? const EdgeInsets.fromLTRB(7.5, 7.5, 7.5, 7.5)
        : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      width: double.infinity,
      decoration: borderEnabled!
        ? BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            border: Border.all(
              width: 1,
              color: borderColor!
            ),
          )
        : BoxDecoration(
            color: backgroundColor,
          ),
      child: WTComponentBuilder.createText(
        text: text,
        textAlign: textAlign,
        textStyle: textStyle(
          textColor: textColor,
          fontSize: textSize,
          fontWeight: textFontWeight
        ),
      )!,
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      builder: (context, constraints) {
        width     = constraints.maxWidth;
        titleSize = width! * 0.0475;
        textSize  = width! * 0.04;

        return Container(
          key: getUniqueKey(),
          width: width,
          padding: padding,
          margin: margin,
          alignment: Alignment.topLeft,
          color: backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: mainAxisAlignment!,
            crossAxisAlignment: crossAxisAlignment!,
            children: <Widget>[
              createTitleWidget()!, /// title
              createTextWidget()!,  /// text
            ],
          ),
        );
      }
    );
  }

}