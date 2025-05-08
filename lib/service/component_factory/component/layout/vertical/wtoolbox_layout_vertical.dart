import 'package:flutter/material.dart';
import '../wtoolbox_layout.dart';

class WTLayoutVertical extends WTLayout {

  Widget? createExpandableLayout() {
    return Expanded(
      key: getUniqueKey(),
      child: Container(
        color: backgroundColor,
        width: width,
        padding: padding!,
        margin: margin!,
        alignment: alignment,
        child: Column(
          mainAxisAlignment: mainAxisAlignment!,
          crossAxisAlignment: crossAxisAlignment!,
          children: <Widget>[
            ...components!,
          ],
        ),
      ),
    );
  }

  Widget? createExpandableAndScrollableLayout() {
    return Expanded(
      key: getUniqueKey(),
      child: Container(
        color: backgroundColor,
        width: width,
        padding: padding!,
        margin: margin!,
        alignment: alignment,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: mainAxisAlignment!,
            crossAxisAlignment: crossAxisAlignment!,
            children: <Widget>[
              ...components!,
            ],
          ),
        ),
      ),
    );
  }

  Widget? createScrollableLayout() {
    return Container(
      key: getUniqueKey(),
      color: backgroundColor,
      padding: padding,
      margin: margin,
      width: width,
      alignment: alignment,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: mainAxisAlignment!,
          crossAxisAlignment: crossAxisAlignment!,
          children: <Widget>[
            ...components!,
          ],
        ),
      ),
    );
  }

  Widget? createLayout() {
    return Container(
      key: getUniqueKey(),
      color: backgroundColor,
      padding: padding,
      margin: margin,
      width: width,
      alignment: alignment,
      child: Column(
        mainAxisAlignment: mainAxisAlignment!,
        crossAxisAlignment: crossAxisAlignment!,
        children: <Widget>[
          ...components!,
        ],
      ),
    );
  }

  Widget? createBody() {
    if(expandable! && !scrollable!) { return createExpandableLayout(); }

    if(expandable! && scrollable!) { return createExpandableAndScrollableLayout(); }

    if(!expandable! && scrollable!) { return createScrollableLayout(); }

    if(!expandable! && !scrollable!) { return createLayout(); }

    return createLayout();
  }

  @override
  Widget? build() {
    return createBody()!;
  }

}