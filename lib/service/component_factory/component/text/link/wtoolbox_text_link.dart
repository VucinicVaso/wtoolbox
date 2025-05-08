import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../wtoolbox_text.dart';

class WTTextLink extends WTText {

  List<InlineSpan>? createBody() {
    List<InlineSpan>? linksWidget = List<InlineSpan>.empty(growable: true);

    for(var link in links!) {
      if(link.containsKey('text')) {
        linksWidget.add(
          TextSpan(
            text: link['text'],
            style: textStyle(
              textColor: textColor,
              fontSize: textSize,
            ),
          )
        );
      }

      if(link.containsKey('link')) {
        TapGestureRecognizer? tapGestureRecognizer = TapGestureRecognizer();
        tapGestureRecognizer.onTap = link['action'];

        linksWidget.add(
          TextSpan(
            text: link['link'],
            style: textStyle(
              textColor: linkColor,
              fontSize: linkSize,
            ),
            recognizer: tapGestureRecognizer
          )
        );
      }
    }

    return linksWidget;
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        width    = constraints.maxWidth;
        textSize = constraints.maxWidth * 0.0425;
        linkSize = constraints.maxWidth * 0.0425;

        return Container(
          key: getUniqueKey(),
          width: width,
          padding: padding,
          margin: margin,
          color: backgroundColor,
          alignment: alignment,
          child: RichText(
            textAlign: textAlign!,
            text: TextSpan(
              children: createBody()!,
              //children: links
            ),
          ),
        );
      },
    );
  }

}