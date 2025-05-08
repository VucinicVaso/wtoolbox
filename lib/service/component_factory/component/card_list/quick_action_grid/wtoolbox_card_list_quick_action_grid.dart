import 'package:flutter/material.dart';
import '../wtoolbox_card_list.dart';
import 'wtoolbox_quick_action_grid_card_item.dart';

class WTCardListQuickActionGrid extends WTCardList {

  Widget? createGrid() {
    List<Widget>? componentList = List<Widget>.empty(growable: true);

    if(components!.isNotEmpty) { componentList.addAll(components!); }

    if(items!.isNotEmpty) {
      double? itemIconSize           = width! * 0.125;
      double? itemDecorationIconSize = width! * 0.125;
      double? itemTitleSize          = width! * 0.045;

      for(Map? item in items!) {
        item!['padding']           = const EdgeInsets.all(0.0);
        item['margin']             = const EdgeInsets.all(0.0);
        item['iconSize']           = itemIconSize;
        item['decorationIconSize'] = itemDecorationIconSize;
        item['titleSize']          = itemTitleSize;

        componentList.add(WTQuickActionGridCardItem(map: item, textStyle: textStyle));
      }
    }

    return SingleChildScrollView(
      child: GridView.count(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        childAspectRatio: gridListItemsPerRow! < 3 ? (1 / .78) : 1,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        crossAxisCount: gridListItemsPerRow!,
        children: componentList,
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
            child: createGrid()!,
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
          width: width,
          height: height,
          padding: padding,
          margin: margin,
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
          child: createGrid()!,
        );
      }
    );
  }

  @override
  Widget? build() {
    return expandable! ? createExpandedBody() : createBody();
  }

}