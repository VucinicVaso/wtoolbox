import 'package:flutter/material.dart';
import '../wtoolbox_card_list.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardListText2 extends WTCardList {

  BoxDecoration? createBoxDecoration() {
    if(!borderEnabled!) { return BoxDecoration(color: backgroundColor); }

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

  BoxDecoration? itemBoxDecoration({ Color? color }) {
    if(separator!) {
      return BoxDecoration(
        color: color,
        border: const Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      );
    }

    return BoxDecoration(
      color: color,
      border: Border.all(
        color: Colors.transparent,
        width: 0.0,
      ),
    );
  }

  /// item { title as icon, title, subtitle }
  Widget? leftWidget(Map? item) {
    if(item!['title'] == null && item['subtitle'] == null) { return WTComponentBuilder.emptyComponent(); }

    /// icon
    Widget? iconWidget = WTComponentBuilder.emptyComponent();
    if(iconEnabled!) {
      double? iSize = width! * 0.05;

      String? t = '';
      if(item['title'].contains(' ')) {
        List<String> stringList = item['title'].split(' ');
        t = '${stringList[0][0].toUpperCase()}${stringList[1][0].toLowerCase()}';
      }else {
        t = item['title'][0].toUpperCase();
      }

      iconWidget = Container(
        padding: const EdgeInsets.fromLTRB(2.5, 2.5, 7.5, 7.5),
        margin: const EdgeInsets.only(right: 7.5),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          border: Border.all(
            color: Colors.grey,
            width: 1.0
          ),
        ),
        alignment: Alignment.topLeft,
        child: WTComponentBuilder.createText(
          text: t,
          textAlign: TextAlign.left,
          textStyle: textStyle(
            textColor: Colors.grey,
            fontSize: iSize,
            fontWeight: FontWeight.normal
          ),
        )!,
      );
    }

    /// title
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
            fontWeight: FontWeight.normal,
          ),
        )!,
      );
    }

    /// subtitle
    Widget? subtitleWidget = WTComponentBuilder.emptyComponent();
    if(item['subtitle'] != null) {
      double? sSize        = width! * 0.04;
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            iconWidget!,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  titleWidget!,
                  subtitleWidget!,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// item { actionLabel, actionSubLabel }
  Widget? rightWidget(Map? item) {
    if(item!['actionLabel'] == null && item['actionSubLabel'] == null) { return WTComponentBuilder.emptyComponent(); }

    Widget? actionLabelWidget = WTComponentBuilder.emptyComponent();
    if(item['actionLabel'] != null) {
      double? alSize          = width! * 0.045;
      item['actionLabelSize'] = item['actionLabel'].length > 30 ? alSize * 0.8 : alSize;
      EdgeInsets? alPadding   = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
      EdgeInsets? alMargin    = item['actionSubLabel'] != null ? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0) : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

      actionLabelWidget = Container(
        padding: alPadding,
        margin: alMargin,
        child: WTComponentBuilder.createText(
          text: item['actionLabel'],
          textAlign: TextAlign.right,
          textStyle: textStyle(
            textColor: item['actionLabelColor'],
            fontSize: item['actionLabelSize'],
            fontWeight: FontWeight.normal
          ),
        )!,
      );
    }

    Widget? actionSubLabelWidget = WTComponentBuilder.emptyComponent();
    if(item['actionSubLabel'] != null) {
      double? aslSize            = width! * 0.045;
      item['actionSubLabelSize'] = item['actionSubLabel'].length > 30 ? aslSize * 0.8 : aslSize;
      EdgeInsets? aslPadding     = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
      EdgeInsets? aslMargin      = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

      actionSubLabelWidget = Container(
        padding: aslPadding,
        margin: aslMargin,
        child: WTComponentBuilder.createText(
          text: item['actionSubLabel'],
          textAlign: TextAlign.right,
          textStyle: textStyle(
            textColor: item['actionSubLabelColor'],
            fontSize: item['actionSubLabelSize']
          ),
        )!,
      );
    }

    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            actionLabelWidget!,
            actionSubLabelWidget!,
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
      width: width,
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: WTComponentBuilder.createText(
        text: title,
        textAlign: TextAlign.left,
        textStyle: textStyle(
          textColor: titleColor,
          fontSize: titleSize,
          fontWeight: FontWeight.bold,
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
            padding: const EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
            margin: const EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
            decoration: itemBoxDecoration(color: item['backgroundColor'] ?? Colors.transparent),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                leftWidget(item)!,  /// icon, title, subtitle
                rightWidget(item)!, /// actionLabel, actionSubLabel
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
            width: width,
            padding: padding,
            margin: margin,
            decoration: createBoxDecoration(),
            alignment: Alignment.center,
            child: createBody(),
          ),
        );
      }
    );
  }

}