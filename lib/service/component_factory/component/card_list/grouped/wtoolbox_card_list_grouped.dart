import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_group_list_view.dart';
import '../wtoolbox_card_list.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardListGrouped extends WTCardList {

  @override
  Widget? build() {
    return ListCardGrouped(
      key:                  getUniqueKey(),
      width:                width,
      padding:              padding,
      margin:               margin,
      backgroundColor:      backgroundColor,
      reverseComponents:    reverseComponents,
      groupedComponentsMap: groupedComponentsMap,
      textStyle:            textStyle
    );
  }

}

// ignore: must_be_immutable
class ListCardGrouped extends StatefulWidget {

  double? width;
  EdgeInsets? padding, margin;
  Color? backgroundColor;
  bool? reverseComponents;
  Map<String, List>? groupedComponentsMap;
  Function? textStyle;

  ListCardGrouped({
    super.key,
    this.width,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.reverseComponents,
    this.groupedComponentsMap,
    this.textStyle,
  });

  @override
  State<ListCardGrouped> createState() => _ListCardGroupedState();

}

class _ListCardGroupedState extends State<ListCardGrouped> {

  @override
  void initState() {
    setScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController!.dispose();
    super.dispose();
  }

  ScrollController? scrollController;
  void setScrollController() {
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: widget.key,
      builder: (context, constraints) {
        widget.width            = constraints.maxWidth;
        double? headerLabelSize = widget.width! * 0.045;

        return Container(
          width: widget.width,
          padding: widget.padding,
          margin: widget.margin,
          color: widget.backgroundColor,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            color: widget.backgroundColor,
            child: GroupListView(
              shrinkWrap: true,
              reverse: widget.reverseComponents!,
              controller: scrollController,
              scrollDirection: Axis.vertical,
              sectionsCount: widget.groupedComponentsMap!.keys.toList().length,
              countOfItemInSection: (int section) {
                return widget.groupedComponentsMap!.values.toList()[section].length;
              },
              itemBuilder: (BuildContext context, IndexPath index) {
                Widget? w = widget.groupedComponentsMap!.values.toList()[index.section][index.index]['component'];

                if(w.runtimeType.toString() != 'Flexible') { return w!; }

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[ w! ],
                );
              },
              groupHeaderBuilder: (BuildContext context, int section) {
                String? headerLabel = widget.groupedComponentsMap!.keys.toList()[section];
                headerLabel = headerLabel.length > 20 ? '${headerLabel.substring(0, 20)}...' : headerLabel;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: WTComponentBuilder.createText(
                    text: headerLabel,
                    textAlign: TextAlign.center,
                    textStyle: widget.textStyle!(
                      textColor: Colors.grey,
                      fontSize: headerLabelSize,
                    ),
                  )
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
          ),
        );
      },
    );
  }

}