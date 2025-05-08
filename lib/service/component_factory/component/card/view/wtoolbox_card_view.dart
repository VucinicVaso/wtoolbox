import 'package:flutter/material.dart';
import '../wtoolbox_card.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardView extends WTCard {

  Widget? headerWidget() {
    if(title == null) { return WTComponentBuilder.emptyComponent(); }
    
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      width: width,
      alignment: Alignment.centerLeft,
      child: WTComponentBuilder.createText(
        text: title,
        size: titleSize,
        color: titleColor,
        textAlign: TextAlign.left,
      ),
    );
  }
  
  Widget? bodyWidget() {
    if(components!.isEmpty) { return WTComponentBuilder.emptyComponent(); }

    BoxDecoration? bodyDecoration =  BoxDecoration(color: backgroundColor);
    if(borderEnabled!) {
      bodyDecoration = BoxDecoration(
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

    return Container(
      width: width,
      alignment: Alignment.center,
      decoration: bodyDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ...components!,
        ],
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width     = constraints.maxWidth;
        padding   = padding ?? const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0);
        margin    = margin ?? const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0);
        titleSize = width! * 0.05;

        return Container(
          key: getUniqueKey(),
          alignment: Alignment.center,
          width: width,
          padding: padding,
          margin: margin,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              headerWidget()!, /// title
              bodyWidget()!,   /// components
            ],
          ),
        );
      }
    );
  }
  
}