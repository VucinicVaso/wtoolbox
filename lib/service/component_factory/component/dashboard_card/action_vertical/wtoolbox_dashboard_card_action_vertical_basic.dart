import 'package:flutter/material.dart';
import '../wtoolbox_dashboard_card.dart';
import '../../wtoolbox_component_builder.dart';

class WTDashboardCardActionVerticalBasic extends WTDashboardCard {

  Widget? createBody({ double? itemSize }) {
    List<Widget>? componentList = List<Widget>.empty(growable: true);

    if(actionCardList!.isNotEmpty) {
      for(dynamic a in actionCardList!) {
        Map<String, dynamic> aMap = a.toMap();
        aMap['size']              = itemSize;
        aMap['padding']           = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        aMap['margin']            = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0);

        componentList.add(ItemBuilder(map: aMap, textStyle: textStyle));
      }
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ...componentList,
        ],
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width            = constraints.maxWidth;
        height           = constraints.maxWidth;
        padding          = padding ?? const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0);
        margin           = margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        double? itemSize = constraints.maxWidth * 0.9;

        return Container(
          key: getUniqueKey(),
          padding: padding,
          margin: margin,
          width: width,
          height: height,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: backgroundColor!,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            border: Border.all(
              width: 1,
              color: borderColor!
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: shadeColor!,
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: createBody(itemSize: itemSize)!,
        );
      }
    );
  }

}

// ignore: must_be_immutable
class ItemBuilder extends StatelessWidget {

  ItemBuilder({ super.key, Map? map, this.textStyle }) {
    item = map!;
  }

  Map? item = <String, dynamic>{};
  Function? textStyle;

  Widget? createIconWidget({ EdgeInsets? containerPadding, EdgeInsets? containerMargin }) {
    double? iconContainerSize = item!['size'] * 0.15;
    double? iconSize          = (item!['size'] * 0.15) / 2;

    Widget iconWidget = item!['iconType'] == WTComponentBuilderIconType.fontAwesome.name
      ? WTComponentBuilder.createFaIcon(
          iconData: item!['iconValue']!,
          color:    item!['iconColor'],
          size:     iconSize
        )!
      : WTComponentBuilder.createIcon(
          iconData: item!['iconValue'],
          color:    item!['iconColor'],
          size:     iconSize
        )!;

    return Container(
      width: iconContainerSize,
      height: iconContainerSize,
      padding: containerPadding ?? const EdgeInsets.all(0.0),
      margin: containerMargin ?? const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: item!['iconBackgroundColor'],
        borderRadius: BorderRadius.circular(iconContainerSize!),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: item!['iconBorderColor'],
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: iconWidget,
    );
  }

  Widget? createStackedIconWidget({ EdgeInsets? containerPadding, EdgeInsets? containerMargin, }) {
    double? iconContainerSize           = item!['size'] * 0.15;
    double? iconSize                    = (item!['size'] * 0.15) / 2;
    double? decorationIconContainerSize = ((item!['size'] * 0.15) / 2) / 1.5;
    double? decorationIconSize          = ((item!['size'] * 0.15) / 2) * 0.5;

    Widget mainIconWidget = item!['iconType'] == WTComponentBuilderIconType.fontAwesome.name
      ? WTComponentBuilder.createFaIcon(
          iconData: item!['iconValue']!,
          color:    item!['iconColor'],
          size:     iconSize
        )!
      : WTComponentBuilder.createIcon(
          iconData: item!['iconData'],
          color:    item!['iconColor'],
          size:     iconSize
        )!;

    Widget decorationIconWidget = item!['decorationIconType'] == WTComponentBuilderIconType.fontAwesome.name
      ? WTComponentBuilder.createFaIcon(
          iconData: item!['decorationIconValue']!,
          color:    item!['decorationIconColor'],
          size:     decorationIconSize
        )!
      : WTComponentBuilder.createIcon(
          iconData: item!['decorationIconData']!,
          color:    item!['decorationIconColor'],
          size:     decorationIconSize
        )!;

    return Container(
      padding: containerPadding ?? const EdgeInsets.all(0.0),
      margin: containerMargin ?? const EdgeInsets.all(0.0),
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          /// icon
          Container(
            alignment: Alignment.center,
            width: iconContainerSize,
            height: iconContainerSize,
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: item!['iconBackgroundColor'],
              borderRadius: BorderRadius.circular(iconContainerSize!),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: item!['iconBorderColor']!,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: mainIconWidget,
          ),

          /// decorationIcon
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: decorationIconContainerSize,
              height: decorationIconContainerSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: item!['decorationIconBackgroundColor'],
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: item!['decorationIconBorderColor'],
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: decorationIconWidget,
            ),
          ),
        ],
      ),
    );
  }

  /// icon, decorationIcon
  Widget? createLeftWidget() {
    if(item!['iconType'] != null && item!['decorationIconType'] == null) {
      return createIconWidget(
        containerPadding: const EdgeInsets.all(5.0),
        containerMargin:  const EdgeInsets.all(5.0),
      );
    }

    if(item!['iconType'] != null && item!['decorationIconType'] != null) {
      return createStackedIconWidget(
        containerPadding: const EdgeInsets.all(0.0),
        containerMargin:  const EdgeInsets.all(5.0),
      );
    }

    return WTComponentBuilder.emptyComponent();
  }

  /// title, subtitle
  Widget? createCenterWidget() {
    item!['titleSize']    = item!['size'] * 0.045;
    item!['subtitleSize'] = item!['size'] * 0.04;

    if(item!['title'] != null && item!['subtitle'] == null) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
          alignment: Alignment.centerLeft,
          child: WTComponentBuilder.createText(
            text: item!['title']!,
            textAlign: TextAlign.left,
            textStyle: textStyle!(
              textColor: item!['titleColor'],
              fontSize: item!['titleSize'],
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      );
    }

    if(item!['title'] == null && item!['subtitle'] != null) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
          alignment: Alignment.centerLeft,
          child: WTComponentBuilder.createText(
            text: item!['subtitle']!,
            textAlign: TextAlign.left,
            textStyle: textStyle!(
              textColor: item!['subtitleColor'],
              fontSize: item!['subtitleSize']
            ),
          )!,
        ),
      );
    }

    if(item!['title'] != null && item!['subtitle'] != null) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /// title
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                child: WTComponentBuilder.createText(
                  text: item!['title'],
                  textAlign: TextAlign.start,
                  textStyle: textStyle!(
                    textColor: item!['titleColor'],
                    fontSize: item!['titleSize'],
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              /// subtitle
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: WTComponentBuilder.createText(
                  text: item!['subtitle'],
                  textAlign: TextAlign.start,
                  textStyle: textStyle!(
                    textColor: item!['subtitleColor'],
                    fontSize: item!['subtitleSize']
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Expanded(
      child: WTComponentBuilder.emptyComponent()!
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item!['action'] ?? () {},
      child: Container(
        alignment: Alignment.center,
        padding: item!['padding'],
        margin: item!['margin'],
        width: item!['size'],
        color: item!['background'],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            createLeftWidget()!,   /// (icon, decorationIcon)
            createCenterWidget()!, /// (title, subtitle)
          ],
        ),
      ),
    );
  }

}