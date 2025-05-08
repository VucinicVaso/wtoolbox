import 'package:flutter/material.dart';
import '../wtoolbox_card_list.dart';
import 'wtoolbox_card_list_quick_extended_card_item.dart';

class WTCardListQuickExtendedActionVertical extends WTCardList {

  Widget? createListView() {
    List<Widget>? componentList = List<Widget>.empty(growable: true);

    if(components!.isNotEmpty) { componentList.addAll(components!); }

    double itemIconSize                   = width! * 0.125;
    double itemDecorationIconSize         = width! * 0.09;
    double itemActionIconSize             = width! * 0.09;
    double itemActionDecorationIconSize   = width! * 0.09;
    double itemTitleSize                  = width! * 0.045;
    double itemSubtitleSize               = width! * 0.035;

    if(items!.isNotEmpty) {
      for(var item in items!) {
        item['padding']                  = const EdgeInsets.all(0.0);
        item['margin']                   = const EdgeInsets.all(5.0);
        item['iconSize']                 = itemIconSize;
        item['decorationIconSize']       = itemDecorationIconSize;
        item['actionIconSize']           = itemActionIconSize;
        item['actionDecorationIconSize'] = itemActionDecorationIconSize;
        item['titleSize']                = itemTitleSize;
        item['subtitleSize']             = itemSubtitleSize;

        componentList.add(WTQuickExtendedActionVerticalCardItem(map: item, textStyle: textStyle));
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

  Widget? createExpandedBody() {
    return Expanded(
      key: getUniqueKey(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          width  = constraints.maxWidth;

          return Container(
            padding: padding,
            margin: margin,
            width: width,
            decoration: BoxDecoration(color: backgroundColor!),
            child: createListView()!,
          );
        }
      ),
    );
  }

  Widget? createBody() {
    return LayoutBuilder(
      builder: (context, constraints) {
        width  = constraints.maxWidth;
        height = width;

        return Container(
          key: getUniqueKey(),
          padding: padding,
          margin: margin,
          width: width,
          height: height,
          decoration: BoxDecoration(
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
          ),
          child: createListView()!,
        );
      }
    );
  }

  @override
  Widget? build() {
    return expandable! ? createExpandedBody() : createBody();
  }

}