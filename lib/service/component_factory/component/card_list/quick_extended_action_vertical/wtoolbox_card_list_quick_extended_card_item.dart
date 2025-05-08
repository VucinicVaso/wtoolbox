import 'package:flutter/material.dart';
import '../../wtoolbox_component_builder.dart';

// ignore: must_be_immutable
class WTQuickExtendedActionVerticalCardItem extends StatelessWidget {

  WTQuickExtendedActionVerticalCardItem({ super.key, Map? map, this.textStyle }) {
    item = map!;
  }

  Map? item = <String, dynamic>{};
  Function? textStyle;

  Widget? createIconWidget({
    double? containerSize,
    EdgeInsets? containerPadding,
    EdgeInsets? containerMargin,
    IconData? iconData,
    Color? iconColor,
    Color? iconBackgroundColor,
    Color? iconBorderColor
  }) {
    double? iconContainerSize = containerSize! + (containerSize * 0.15);
    double? iconSize = (containerSize + (containerSize * 0.15)) / 1.80;

    return Container(
      width: iconContainerSize,
      height: iconContainerSize,
      padding: containerPadding ?? const EdgeInsets.all(0.0),
      margin: containerMargin ?? const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: iconBackgroundColor,
        borderRadius: BorderRadius.circular(iconContainerSize),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: iconBorderColor!,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: WTComponentBuilder.createIcon(
        iconData: iconData,
        size:     iconSize,
        color:    iconColor
      )
    );
  }

  Widget? createStackedIconWidget({
    EdgeInsets? containerMargin,
    double? iconSize,
    IconData? iconData,
    Color? iconColor,
    Color? iconBackgroundColor,
    Color? iconBorderColor,
    IconData? decorationIcon,
    Color? decorationIconColor,
    Color? decorationIconBackgroundColor,
    Color? decorationIconBorderColor,
  }) {
    double? mainIconContainerSize = iconSize! + (iconSize * 0.15);
    double? mainIconSize = (iconSize + (iconSize * 0.15)) / 1.80;

    double? decorationIconContainerSize = iconSize * 0.45;
    double? decorationIconSize = iconSize * 0.35;

    return Container(
      margin: containerMargin ?? const EdgeInsets.all(0.0),
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          /// icon
          Container(
            alignment: Alignment.center,
            width: mainIconContainerSize,
            height: mainIconContainerSize,
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(mainIconContainerSize),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: iconBorderColor!,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: WTComponentBuilder.createIcon(
              iconData: iconData,
              size:     mainIconSize,
              color:    iconColor
            ),
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
                color: decorationIconBackgroundColor,
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: decorationIconBorderColor!,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: WTComponentBuilder.createIcon(
                iconData: decorationIcon,
                size:     decorationIconSize,
                color:    decorationIconColor
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// icon, decorationIcon
  Widget? createLeftWidget() {
    if(item!['icon'] != null && item!['decorationIcon'] == null) {
      return createIconWidget(
        containerSize:       item!['iconSize'],
        containerPadding:    const EdgeInsets.all(5.0),
        containerMargin:     const EdgeInsets.all(5.0),
        iconData:            item!['icon'],
        iconColor:           item!['iconColor'],
        iconBackgroundColor: item!['iconBackgroundColor'],
        iconBorderColor:     item!['iconBorderColor'],
      );
    }

    if(item!['icon'] != null && item!['decorationIcon'] != null) {
      return createStackedIconWidget(
        containerMargin:               const EdgeInsets.all(5.0),
        iconSize:                      item!['iconSize'],
        iconData:                      item!['icon'],
        iconColor:                     item!['iconColor'],
        iconBackgroundColor:           item!['iconBackgroundColor'],
        iconBorderColor:               item!['iconBorderColor'],
        decorationIcon:                item!['decorationIcon'],
        decorationIconColor:           item!['decorationIconColor'],
        decorationIconBackgroundColor: item!['decorationIconBackgroundColor'],
        decorationIconBorderColor:     item!['decorationIconBorderColor'],
      );
    }

    return WTComponentBuilder.emptyComponent();
  }

  /// title, subtitle
  Widget? createCenterWidget() {
    if(item!['title'] != null && item!['subtitle'] == null) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
          alignment: Alignment.centerLeft,
          child: WTComponentBuilder.createText(
            text:      item!['title']!,
            textAlign: TextAlign.left,
            textStyle: textStyle!(textColor: item!['titleColor'], fontSize: item!['titleSize'], fontWeight: FontWeight.bold),
          )!,
        ),
      );
    }

    if(item!['title'] == null && item!['subtitle'] != null) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
          alignment: Alignment.centerLeft,
          child: WTComponentBuilder.createText(
            text:      item!['subtitle']!,
            textAlign: TextAlign.left,
            textStyle: textStyle!(textColor: item!['subtitleColor'], fontSize: item!['subtitleSize']),
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
                  text:      item!['title'],
                  textAlign: TextAlign.start,
                  textStyle: textStyle!(textColor: item!['titleColor'], fontSize: item!['titleSize'], fontWeight: FontWeight.bold),
                ),
              ),
              /// subtitle
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: WTComponentBuilder.createText(
                  text:      item!['subtitle'],
                  textAlign: TextAlign.start,
                  textStyle: textStyle!(textColor: item!['subtitleColor'], fontSize: item!['subtitleSize']),
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

  /// actionIcon, actionDecorationIcon
  Widget? createRightWidget() {
    if(item!['actionIcon'] != null && item!['actionDecorationIcon'] == null) {
      return createIconWidget(
        containerSize:       item!['actionIconSize'],
        containerPadding:    const EdgeInsets.all(5.0),
        containerMargin:     const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
        iconData:            item!['actionIcon'],
        iconColor:           item!['actionIconColor'],
        iconBackgroundColor: item!['actionIconBackgroundColor'],
        iconBorderColor:     item!['actionIconBorderColor'],
      );
    }

    if(item!['actionIcon'] != null && item!['actionDecorationIcon'] != null) {
      return createStackedIconWidget(
        containerMargin:               const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
        iconSize:                      item!['actionIconSize'],
        iconData:                      item!['actionIconIcon'],
        iconColor:                     item!['actionIconColor'],
        iconBackgroundColor:           item!['actionIconColor'],
        iconBorderColor:               item!['actionIconColor'],
        decorationIcon:                item!['actionDecorationIcon'],
        decorationIconColor:           item!['actionDecorationIconColor'],
        decorationIconBackgroundColor: item!['actionDecorationIconBackgroundColor'],
        decorationIconBorderColor:     item!['actionDecorationIconBorderColor'],
      );
    }

    return WTComponentBuilder.emptyComponent();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item!['action'] ?? () {},
      child: Container(
        alignment: Alignment.center,
        padding: item!['padding'],
        margin: item!['margin'],
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            createLeftWidget()!,   /// (icon, decorationIcon)
            createCenterWidget()!, /// (title, subtitle)
            createRightWidget()!,  /// (actionIcon, actionDecorationIcon)
          ],
        ),
      ),
    );
  }

}