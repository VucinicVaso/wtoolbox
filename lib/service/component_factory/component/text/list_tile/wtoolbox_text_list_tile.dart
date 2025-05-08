import 'package:flutter/material.dart';
import '../wtoolbox_text.dart';
import '../../wtoolbox_component_builder.dart';

class WTTextListTile extends WTText {

  Widget? createLabelWidget() {
    if(label == null) { return WTComponentBuilder.emptyComponent(); }

    return Expanded(
      child: Container(
        color: Colors.transparent,
        alignment: Alignment.centerLeft,
        padding: text != null
          ? const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0)
          : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        margin: const  EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: WTComponentBuilder.createText(
          text: label,
          textAlign: labelAlign,
          textStyle: textStyle(
            textColor: labelColor,
            fontSize: labelSize,
            fontWeight: labelFontWeight
          ),
        )
      ),
    );
  }

  Widget? createTextWidget() {
    if(text == null) { return WTComponentBuilder.emptyComponent(); }

    return Expanded(
      child: Container(
        color: Colors.transparent,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: WTComponentBuilder.createText(
          text: text,
          textAlign: textAlign,
          textStyle: textStyle(
            textColor: textColor,
            fontSize: textSize,
            fontWeight: textFontWeight
          ),
        )!,
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width = constraints.maxWidth;
        labelSize = width! * 0.045;
        textSize  = width! * 0.045;

        return Container(
          key: getUniqueKey(),
          width: width,
          padding: padding,
          margin: margin,
          alignment: alignment,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            border: Border.all(
              color: backgroundColor!,
              width: 1.0
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      createLabelWidget()!, /// label
                      createTextWidget()!,  /// text
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }

}