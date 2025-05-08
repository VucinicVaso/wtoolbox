import 'package:flutter/material.dart';
import '../wtoolbox_card_list.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardListText1 extends WTCardList {

  BoxDecoration? createBoxDecoration() {
    if(!borderEnabled!) { BoxDecoration(color: backgroundColor); }

    return BoxDecoration(
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
    );
  }

  /// item { title, subtitle }
  Widget? leftWidget(Map? item) {
    if(item!['title'] == null && item['subtitle'] == null) { return WTComponentBuilder.emptyComponent(); }

    Widget? titleWidget = WTComponentBuilder.emptyComponent();
    if(item['title'] != null) {
      double? tSize        = width! * 0.04;
      item['titleSize']    = item['title'].length > 30 ? tSize * 0.8 : tSize;
      EdgeInsets? tPadding = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
      EdgeInsets? tMargin  = item['subtitle'] != null ? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0) : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

      titleWidget = Container(
        padding: tPadding,
        margin: tMargin,
        child: WTComponentBuilder.createText(
          text: item['title'],
          textAlign: TextAlign.left,
          textStyle: textStyle(
            textColor: item['titleColor'],
            fontSize: item['titleSize'],
          ),
        )!,
      );
    }

    Widget? subtitleWidget = WTComponentBuilder.emptyComponent();
    if(item['subtitle'] != null) {
      double? sSize        = width! * 0.0375;
      item['subtitleSize'] = item['subtitle'].length > 30 ? sSize * 0.8 : sSize;
      EdgeInsets? sPadding = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
      EdgeInsets? sMargin  = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

      subtitleWidget = Container(
        padding: sPadding,
        margin: sMargin,
        child: WTComponentBuilder.createText(
          text: item['subtitle'],
          textAlign: TextAlign.left,
          textStyle: textStyle(
            textColor: item['subtitleColor'],
            fontSize: item['subtitleSize']
          ),
        )!,
      );
    }

    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleWidget!,
            subtitleWidget!,
          ],
        ),
      ),
    );
  }

  /// item { actionLabel, actionSubLabel, actionIcon }
  Widget? rightWidget(Map? item) {
    if(item!['actionLabel'] == null && item['actionSubLabel'] == null) { return WTComponentBuilder.emptyComponent(); }

    Widget? actionLabelWidget = WTComponentBuilder.emptyComponent();
    if(item['actionLabel'] != null) {
      double? alSize          = width! * 0.045;
      item['actionLabelSize'] = item['actionLabel'].length > 30 ? alSize * 0.8 : alSize;
      EdgeInsets? alPadding   = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
      EdgeInsets? alMargin    = item['actionSubLabel'] != null ? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0) : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

      actionLabelWidget = Container(
        alignment: Alignment.centerRight,
        padding: alPadding,
        margin: alMargin,
        child: WTComponentBuilder.createText(
          text: item['actionLabel'],
          textAlign: TextAlign.right,
          textStyle: textStyle(
            textColor: item['actionLabelColor'],
            fontSize: item['actionLabelSize']
          ),
        ),
      );
    }

    Widget? actionSubLabelWidget = WTComponentBuilder.emptyComponent();
    if(item['actionSubLabel'] != null) {
      double? aslSize            = width! * 0.0425;
      item['actionSubLabelSize'] = item['actionSubLabel'].length > 30 ? aslSize * 0.8 : aslSize;
      EdgeInsets? aslPadding     = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
      EdgeInsets? aslMargin      = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

      actionSubLabelWidget = Container(
        alignment: Alignment.centerRight,
        padding: aslPadding,
        margin: aslMargin,
        child: WTComponentBuilder.createText(
          text: item['actionSubLabel'],
          textAlign: TextAlign.right,
          textStyle: textStyle(
            textColor: item['actionSubLabelColor'],
            fontSize: item['actionSubLabelSize']
          ),
        )!
      );
    }

    Widget? actionIconWidget = WTComponentBuilder.emptyComponent();
    if(item['actionIcon'] != null) {
      item['iActionIconSize'] = width! * 0.065;
      EdgeInsets? aiPadding   = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
      EdgeInsets? aiMargin    = item['actionLabel'] != null || item['actionSubLabel'] != null ? const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0) : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

      actionIconWidget = Container(
        padding: aiPadding,
        margin: aiMargin,
        child: WTComponentBuilder.createIcon(
          iconData: item['actionIcon'],
          color: item['actionIconColor'],
          size: item['iActionIconSize'],
        ),
      );
    }

    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  actionLabelWidget!,
                  actionSubLabelWidget!,
                ],
              ),
            ),
            actionIconWidget!,
          ],
        ),
      ),
    );
  }

  /// title
  Widget? createTitleWidget() {
    if(title == null) { return WTComponentBuilder.emptyComponent()!; }

    titleSize = width! * 0.0475;

    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: WTComponentBuilder.createText(
        text: title,
        textAlign: TextAlign.left,
        textStyle: textStyle(
          textColor: titleColor,
          fontSize: titleSize,
          fontWeight: FontWeight.normal
        ),
      )!,
    );
  }

  Widget? createBody() {
    if(items!.isEmpty) { return WTComponentBuilder.emptyComponent(); }

    List<Widget>? widgets = List<Widget>.empty(growable: true);
    for(int i = 0; i < items!.length; i++) {
      Map? item = items![i];

      widgets.add(
        GestureDetector(
          onTap: item['action'],
          child: Container(
            width: width,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
            margin: const EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
            decoration: !separator!
            ? BoxDecoration(
                color: item['backgroundColor'] ?? Colors.transparent
              )
            : BoxDecoration(
              color: item['backgroundColor'] ?? Colors.transparent,
              border: const Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Colors.grey,
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                leftWidget(item)!,  /// item[title, subtitle]
                rightWidget(item)!, /// item[actionLabel, actionSubLabel, actionIcon]
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      width: width,
      alignment: Alignment.centerLeft,
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          createTitleWidget()!,
          ...widgets,
        ],
      ),
    );
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
            key: getUniqueKey(),
            padding: padding,
            margin: margin,
            width: width,
            decoration: createBoxDecoration(),
            alignment: Alignment.center,
            child: createBody(),
          ),
        );
      }
    );
  }

}