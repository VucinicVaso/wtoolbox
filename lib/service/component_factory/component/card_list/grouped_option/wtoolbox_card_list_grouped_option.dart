import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_group_list_view.dart';
import '../wtoolbox_card_list.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardListGroupedOption extends WTCardList {

  @override
  Widget? build() {
    return WTListCardGroupedOptionState(
      key:             getUniqueKey(),
      textStyle:       textStyle,
      backgroundColor: backgroundColor,
      width:           width,
      padding:         padding,
      margin:          margin,
      items:           groupedItemsMap,
    );
  }

}

// ignore: must_be_immutable
class WTListCardGroupedOptionState extends StatefulWidget {

  double? width;
  Function? textStyle;
  Color? backgroundColor;
  EdgeInsets? padding, margin;
  ScrollController? scrollController;
  Map<String, List<dynamic>>? items = <String, List>{};

  WTListCardGroupedOptionState({
    super.key,
    this.textStyle,
    this.backgroundColor,
    this.width,
    this.padding,
    this.margin,
    this.items,
  });

  @override
  State<WTListCardGroupedOptionState> createState() => _WTListCardGroupedOptionState();

}

class _WTListCardGroupedOptionState extends State<WTListCardGroupedOptionState> {

  @override
  void initState() {
    setInitialData();
    super.initState();
  }

  @override
  void dispose() {
    items!.clear();
    scrollController!.dispose();
    super.dispose();
  }

  Color? backgroundColor;
  EdgeInsets? padding, margin;
  Map<String, List<dynamic>>? items = <String, List>{};

  ScrollController? scrollController;
  void setScrollController() {
    scrollController = ScrollController();
  }

  void setInitialData() {
    setState(() {
      backgroundColor = widget.backgroundColor;
      padding         = widget.padding;
      margin          = widget.margin;
      items           = widget.items;
    });
    setScrollController();
  }

  void selectItem(Map? item) {
    items!.forEach((key, value) {
      for(var i in value) {
        i['data']['selected'] = i['data']['key'] == item!['data']['key'];
      }
    });
    setState(() { items = items; });
    item!['action']();
  }

  Widget? iconWidget(Map? item) {
    if(item!['icon'] == null) { return WTComponentBuilder.emptyComponent()!; }

    return WTComponentBuilder.createIcon(
      iconData: item['icon'],
      color: item['iconColor'],
      size: item['iconSize']
    )!;
  }

  Widget? titleWidget(Map? item) {
    if(item!['title'] == null) { return Expanded(child: WTComponentBuilder.emptyComponent()!); }

    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
        child: WTComponentBuilder.createText(
          text: item['title'],
          textStyle: widget.textStyle!(
            textColor: item['titleColor'],
            fontSize: item['titleSize']
          ),
        ),
      ),
    );
  }

  Widget? isSelectedWidget(Map? item) {
    return item!['data']['selected']
      ? WTComponentBuilder.createIcon(
          iconData: Icons.radio_button_checked,
          color: Colors.blue,
          size: item['iconSize'],
        )!
      : WTComponentBuilder.createIcon(
          iconData: Icons.radio_button_off,
          color: Colors.grey,
          size: item['iconSize'],
        )!;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: widget.key,
      builder: (context, constraints) {
        widget.width = constraints.maxWidth;

        return Container(
          width: widget.width,
          padding: padding,
          margin: margin,
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.transparent,
            child: GroupListView(
              shrinkWrap: true,
              reverse: false,
              controller: scrollController,
              sectionsCount: items!.keys.toList().length,
              countOfItemInSection: (int section) { return items!.values.toList()[section].length; },
              itemBuilder: (BuildContext context, IndexPath index) {
                Map? item           = items!.values.toList()[index.section][index.index];
                Color? bgColor      = Colors.transparent;
                EdgeInsets? padding = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
                EdgeInsets? margin  = const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0);

                item!['iconSize'] = widget.width! * 0.065;
                item['titleSize'] = widget.width! * 0.045;

                return GestureDetector(
                  onTap: () => selectItem(item),
                  child: Container(
                    padding: padding,
                    margin: margin,
                    color: bgColor,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        iconWidget(item)!,
                        titleWidget(item)!,
                        isSelectedWidget(item)!,
                      ],
                    ),
                  ),
                );
              },
              groupHeaderBuilder: (BuildContext context, int section) {
                String? headerLabel = items!.keys.toList()[section];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: WTComponentBuilder.createText(
                    text: headerLabel,
                    textAlign: TextAlign.center,
                    textStyle: widget.textStyle!(
                      textColor: Colors.grey,
                      fontSize: 15.0
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
          ),
        );
      }
    );
  }

}