import 'package:flutter/material.dart';
import '../wtoolbox_dashboard_card.dart';
import '../../wtoolbox_component_builder.dart';

class WTDashboardCardActionHorizontalBasic extends WTDashboardCard {

  BoxDecoration? createBoxDecoration() {
    if(!borderEnabled!) { return BoxDecoration(color: backgroundColor!); }

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

  Widget? createBody() {
    List<Widget>? componentList = List<Widget>.empty(growable: true);

    if(actionCardList!.isNotEmpty) {
      for(dynamic a in actionCardList!) {
        Map<String, dynamic>? aMap = a.toMap();
        aMap!['size']   = width! * 0.25;
        aMap['padding'] = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        aMap['margin']  = const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0);

        componentList.add(ItemBuilder(map: aMap, textStyle: textStyle));
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...componentList
        ],
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width   = constraints.maxWidth * 0.9;
        height  = constraints.maxWidth * 0.25;
        padding = padding ?? const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0);
        margin  = margin ?? const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0);

        return Container(
          key: getUniqueKey(),
          width: width,
          padding: padding,
          margin: margin,
          alignment: Alignment.center,
          decoration: createBoxDecoration(),
          child: createBody(),
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
    double? iconContainerSize = item!['size']! / 2;
    double? iconSize          = item!['size']! / 4;

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
      width:  iconContainerSize,
      height:  iconContainerSize,
      padding: containerPadding ?? const EdgeInsets.all(0.0),
      margin:  containerMargin ?? const EdgeInsets.all(0.0),
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

  Widget? createStackedIconWidget({ EdgeInsets? containerPadding, EdgeInsets? containerMargin }) {
    double? mainIconContainerSize = item!['size']! / 2;
    double? mainIconSizeValue     = item!['size'] / 4;

    double? decorationIconContainerSize = mainIconSizeValue! / 1.25;
    double? decorationIconSizeValue     = mainIconSizeValue / 1.75;

    Widget mainIconWidget = item!['iconType'] == WTComponentBuilderIconType.fontAwesome.name
      ? WTComponentBuilder.createFaIcon(
          iconData: item!['iconValue']!,
          color:    item!['iconColor'],
          size:     mainIconSizeValue
        )!
     : WTComponentBuilder.createIcon(
        iconData: item!['iconData'],
        color:    item!['iconColor'],
        size:     mainIconSizeValue
      )!;

    Widget decorationIconWidget = item!['decorationIconType'] == WTComponentBuilderIconType.fontAwesome.name
      ? WTComponentBuilder.createFaIcon(
          iconData: item!['decorationIconValue']!,
          color:    item!['decorationIconColor'],
          size:     decorationIconSizeValue
        )!
     : WTComponentBuilder.createIcon(
        iconData: item!['decorationIconData']!,
        color:    item!['decorationIconColor'],
        size:     decorationIconSizeValue
      )!;

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
              color: item!['iconBackgroundColor'],
              borderRadius: BorderRadius.circular(mainIconContainerSize!),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: item!['iconBorderColor'],
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
  Widget? createIconHolder() {
    if(item!['iconType'] != null && item!['decorationIconType'] == null) {
      return createIconWidget(
        containerPadding: const EdgeInsets.all(0.0),
        containerMargin:  const EdgeInsets.all(5.0)
      );
    }

    if(item!['iconType'] != null && item!['decorationIconType'] != null) {
      return createStackedIconWidget(
        containerPadding: const EdgeInsets.all(0.0),
        containerMargin:  const EdgeInsets.all(5.0)
      );
    }

    return WTComponentBuilder.emptyComponent();
  }

  /// title
  Widget? createTitleHolder() {
    if(item!['title'] == null) { return WTComponentBuilder.emptyComponent(); }

    String? primaryLabel     = item!['title'];
    Color? primaryLabelColor = item!['titleColor'];

    double? textSize = item!['size'] * 0.15;
    if(primaryLabel!.length <= 12) { textSize = item!['size'] * 0.15; }
    if(primaryLabel.length > 12 && primaryLabel.length < 26) { textSize = item!['size'] * 0.125; }
    if(primaryLabel.length > 26) { textSize = item!['size'] * 0.10; }

    List<String> words = primaryLabel.split(' ');
    List<String> lines = [];
    if(words.isNotEmpty) { lines.add(words[0]); }
    String currentLine = '';
    for(int i = 1; i < words.length; i++) {
      if(currentLine.split(' ').length < 2) {
        currentLine += (currentLine.isEmpty ? '' : ' ') + words[i];
      }else {
        lines.add(currentLine);
        currentLine = words[i];
      }
    }
    if(currentLine.isNotEmpty) { lines.add(currentLine); }

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 2.5, 0.0, 2.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: lines.map((l) {
          return WTComponentBuilder.createText(
            text:      l,
            textAlign: TextAlign.center,
            textStyle: textStyle!(textColor: primaryLabelColor, fontSize: textSize),
          )!;
        })
        .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item!['action'] ?? () {},
      child: Container(
        padding: item!['padding'],
        margin:item!['margin'],
        width: item!['size'],
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