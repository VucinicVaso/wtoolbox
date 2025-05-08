import 'package:flutter/material.dart';
import '../../wtoolbox_component_builder.dart';

// ignore: must_be_immutable
class WTQuickActionGridCardItem extends StatelessWidget {

  WTQuickActionGridCardItem({ super.key, Map? map, this.textStyle }) {
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
    Color? iconBorderColor,
  }) {
    double iconContainerSize = containerSize! + (containerSize * 0.15);
    double? iconSize = (containerSize + (containerSize * 0.15)) / 2;

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
      ),
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
    double mainIconContainerSize = iconSize! + (iconSize * 0.15);
    double? mainIconSize = (iconSize + (iconSize * 0.15)) / 2;

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
  Widget? createIconHolder() {
    if(item!['icon'] != null && item!['decorationIcon'] == null) {
      return createIconWidget(
        containerSize:       item!['iconSize'],
        containerPadding:    const EdgeInsets.all(0.0), //5.0
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
        decorationIconBorderColor:     item!['decorationIconBorderColor']
      );
    }

    return WTComponentBuilder.emptyComponent();
  }

  /// title
  Widget? createTitleHolder() {
    if(item!['title'] == null) { return WTComponentBuilder.emptyComponent(); }

    String? primaryLabel = item!['title'];
    double? primaryLabelSize = item!['titleSize'];
    Color? primaryLabelColor = item!['titleColor'];

    String text = '';
    double? textSize = primaryLabel!.length <= 12 ? primaryLabelSize! * 0.9 : primaryLabelSize! * 0.85;

    if(primaryLabel.length <= 12) {
      text = primaryLabel;
    }
    if(primaryLabel.length > 12) {
      List<String>? strings = primaryLabel.split(' ');
      if(strings.length > 1) {
        strings[0] = '${strings[0]} \n';
        text = strings.join('');
      }
    }

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
      child: WTComponentBuilder.createText(
        text:      text,
        textAlign: TextAlign.center,
        textStyle: textStyle!(textColor: primaryLabelColor, fontSize: textSize),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item!['action'] ?? () {},
      child: Container(
        padding: item!['padding'],
        margin: item!['margin'],
        color: item!['backgroundColor'],
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            createIconHolder()!,  /// icon, decorationIcon
            createTitleHolder()!, /// title
          ],
        ),
      ),
    );
  }

}