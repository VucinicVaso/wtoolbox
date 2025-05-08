import 'package:flutter/material.dart';
import '../wtoolbox_dashboard_card.dart';
import '../../wtoolbox_component_builder.dart';

class WTDashboardCardGridBasic extends WTDashboardCard {

  Widget? createBody() {
    if(actionCardList!.isEmpty) { return WTComponentBuilder.emptyComponent(); }

    int? crossAxisCount      = (width! ~/ 150).clamp(gridCrossAxisCountMin!, gridCrossAxisCountMax!);
    double? crossAxisSpacing = gridCrossAxisCountMin! == 3 || gridCrossAxisCountMin! == 4 ? 3 : 12;
    double? mainAxisSpacing  = gridCrossAxisCountMin! == 3 || gridCrossAxisCountMin! == 4 ? 9 : 12;
    double? childAspectRatio = gridCrossAxisCountMin! == 3 || gridCrossAxisCountMin! == 4 ? 0.8 : 0.9;

    List<Widget>? widgets = List<Widget>.empty(growable: true);
    for(dynamic a in actionCardList!) {
      Map<String, dynamic> aMap = a.toMap();
      aMap['crossAxisCount'] = crossAxisCount;

      widgets.add(ItemBuilder(map: aMap, textStyle: textStyle));
    }

    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(
          width: 1,
          color: Colors.transparent,
        ),
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
        ),
        itemCount: widgets.length,
        itemBuilder: (context, index) => widgets[index],
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width   = constraints.maxWidth;
        height  = constraints.maxWidth;
        padding = padding ?? const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0);
        margin  = margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

        return Container(
          key: getUniqueKey(),
          padding: padding,
          margin: margin,
          width: width,
          height: height,
          alignment: Alignment.center,
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
          child: createBody()!,
        );
      },
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

  Widget? createIconWidget({ double? iconContainerSize, double? iconSize }) {
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

  Widget? createStackedIconWidget({ double? iconContainerSize, double? iconSize }) {
    double? decorationIconContainerSize = iconSize! / 1.5;
    double? decorationIconSize          = iconSize * 0.35;

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
      margin: const EdgeInsets.all(0.0),
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
  Widget? createIconHolder({ double? width}) {
    double iconContainerSize = width! * 0.5;
    double iconSize          = iconContainerSize * 0.6;

    if(item!['iconType'] != null && item!['decorationIconType'] == null) {
      return createIconWidget(iconContainerSize: iconContainerSize, iconSize: iconSize);
    }

    if(item!['iconType'] != null && item!['decorationIconType'] != null) {
      return createStackedIconWidget(iconContainerSize: iconContainerSize, iconSize: iconSize);
    }

    return WTComponentBuilder.emptyComponent();
  }

  /// space between createIconHolder && createLabelWidget
  Widget? createSpaceWidget() {
    if(item!['crossAxisCount'] == 3 || item!['crossAxisCount'] == 4) { const SizedBox(height: 6); }
    return const SizedBox(height: 8);
  }

  /// title
  Widget? createLabelWidget({ double? width }) {
    if(item!['title'] == null) { return WTComponentBuilder.emptyComponent(); }

    double labelSize = 14.0;
    if(item!['crossAxisCount'] == 3) {
      if(item!['title'].length <= 15) { labelSize = 13.0; }
      if(item!['title'].length <= 25) { labelSize = 12.0; }
      if(item!['title'].length > 25) { labelSize = 10.0; }
    }
    if(item!['crossAxisCount'] == 4) {
      if(item!['title'].length <= 14) { labelSize = 12.5; }
      if(item!['title'].length > 14) { labelSize = 9.0; }
      if(item!['title'].length > 24) { labelSize = 7.5; }
    }
    if(item!['crossAxisCount'] != 3 || item!['crossAxisCount'] != 4) {
      if(item!['title'].length <= 15) { labelSize = 13.0; }
      if(item!['title'].length <= 25) { labelSize = 13.0; }
      if(item!['title'].length > 25) { labelSize = 11.0; }
    }

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: WTComponentBuilder.createText(
        text: item!['title'],
        textAlign: TextAlign.center,
        textStyle: textStyle!(
          textColor: item!['titleColor'],
          fontSize: labelSize
        ),
      )!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double? width       = constraints.maxWidth;
        Alignment alignment = item!['crossAxisCount'] == 3 || item!['crossAxisCount'] == 4 ? Alignment.topCenter : Alignment.center;
        EdgeInsets? padding = item!['crossAxisCount'] == 3 || item!['crossAxisCount'] == 4 ? const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0) : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        EdgeInsets? margin  = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

        return GestureDetector(
          onTap: item!['action'] ?? () {},
          child: Container(
            padding: padding,
            margin: margin,
            alignment: alignment,
            decoration: BoxDecoration(
              color: item!['backgroundColor'],
              borderRadius: BorderRadius.circular(12),
            ),
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                createIconHolder(width: width)!,  // icon, decorationIcon
                createSpaceWidget()!,
                createLabelWidget(width: width)!, // title
              ],
            ),
          ),
        );

      }
    );
  }

}

/*
import 'package:flutter/material.dart';
import '../wtoolbox_dashboard_card.dart';
import '../../wtoolbox_component_builder.dart';

class WTDashboardCardGridBasic extends WTDashboardCard {

  Widget? createBody({ double? itemSize }) {
    if(actionCardList!.isEmpty) { return WTComponentBuilder.emptyComponent(); }

    double? containerWidth  = width! * 0.975;
    double? containerHeight = height! * 0.975;

    List<Widget>? widgets = List<Widget>.empty(growable: true);
    for(dynamic a in actionCardList!) {
      Map<String, dynamic> aMap = a.toMap();
      aMap['size']    = itemSize;
      aMap['padding'] = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
      aMap['margin']  = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

      widgets.add(ItemBuilder(map: aMap, textStyle: textStyle));
    }

    return Container(
      width: containerWidth,
      height: containerHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(
          width: 1,
          color: Colors.transparent,
        ),
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridCrossAxisCount!,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: widgets.length,
        itemBuilder: (context, index) => widgets[index],
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
        padding          = padding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        margin           = margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        double? itemSize = width! / 3 - 20;

        return Container(
          key: getUniqueKey(),
          padding: padding,
          margin: margin,
          width: width,
          height: height,
          alignment: Alignment.center,
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
      },
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

  Widget? createIconWidget({ EdgeInsets? containerPadding = const EdgeInsets.all(0.0), EdgeInsets? containerMargin = const EdgeInsets.all(0.0) }) {
    double? iconContainerSize = item!['size'] / 2.25;
    double? iconSize          = item!['size'] / 4.5;

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
      padding: containerPadding,
      margin: containerMargin,
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

  Widget? createStackedIconWidget({ EdgeInsets? containerPadding = const EdgeInsets.all(0.0), EdgeInsets? containerMargin = const EdgeInsets.all(0.0) }) {
    double? iconContainerSize = item!['size'] / 2.25;
    double? iconSize          = item!['size'] / 4.5;

    double? decorationIconContainerSize = iconSize! / 1.25;
    double? decorationIconSize          = iconSize / 1.75;

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
        containerMargin:  const EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 5.0)
      );
    }

    if(item!['iconType'] != null && item!['decorationIconType'] != null) {
      return createStackedIconWidget(
        containerPadding: const EdgeInsets.all(0.0),
        containerMargin:  const EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 5.0)
      );
    }

    return WTComponentBuilder.emptyComponent();
  }

  /// title
  Widget? createTitleHolder() {
    if(item!['title'] == null) { return WTComponentBuilder.emptyComponent(); }

    double? textSize = item!['size'] * 0.15;
    if(item!['title'].length <= 12) { textSize = item!['size'] * 0.15; }
    if(item!['title'].length > 12 && item!['title'].length <= 26) { textSize = (item!['size'] * 0.15) * 0.82; }
    if(item!['title'].length > 26) { textSize =  (item!['size'] * 0.15) * 0.52;  }

    List<String> words = item!['title'].split(' ');
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
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 2.5, 0.0, 2.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: lines.map((l) {
          return WTComponentBuilder.createText(
            text:      l,
            textAlign: TextAlign.center,
            textStyle: textStyle!(textColor: item!['titleColor'], fontSize: textSize),
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
        width: item!['size'],
        height: item!['size'],
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
* */