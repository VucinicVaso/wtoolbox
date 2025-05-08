import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_scroll_snap_list.dart';
import '../wtoolbox_dashboard_card_list.dart';
import '../../../component/wtoolbox_component_builder.dart';

class WTDashboardCardListScrollingBasic extends WTDashboardCardList {

  @override
  Widget? build() {
    return SnappingList(
      key:       getUniqueKey(),
      padding:    padding,
      margin:     margin,
      width:      width,
      height:     height,
      title:      title,
      titleSize:  titleSize,
      titleColor: titleColor,
      textStyle:  textStyle,
      cards:      cards,
    );
  }

}

// ignore: must_be_immutable
class SnappingList extends StatefulWidget {

  EdgeInsets? padding, margin;
  double? width, height, titleSize;
  String? title;
  Color? titleColor;
  Function? textStyle;
  List<Widget>? cards;

  SnappingList({
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.title,
    this.titleSize,
    this.titleColor,
    this.textStyle,
    this.cards,
  });

  @override
  State<SnappingList> createState() => SnappingListState();

}

class SnappingListState extends State<SnappingList> {

  int? activeItem = 0;
  void setActiveItem(int? i) { setState(() { activeItem = i; }); }

  Widget? createTitleWidget() {
    if(widget.title == null) { return WTComponentBuilder.emptyComponent(); }

    widget.title     = widget.title!.length > 23 ? '${widget.title!.substring(0, 23)}...' : widget.title!;
    widget.titleSize = widget.title!.length > 20 ? widget.width! * 0.035 : widget.width! * 0.045;

    return WTComponentBuilder.createText(
      text:      widget.title!,
      textAlign: TextAlign.left,
      textStyle: widget.textStyle!(textColor: widget.titleColor, fontSize: widget.titleSize),
    );
  }

  Widget? createNavigationWidget() {
    if(widget.cards!.isEmpty || widget.cards!.length < 2) { return WTComponentBuilder.emptyComponent(); }

    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ...List.generate(
            widget.cards!.length,
            (index) => index == activeItem
              ? const Icon(Icons.circle, color: Colors.blue, size: 12.0)
              : const Icon(Icons.circle_outlined, color: Colors.grey, size: 12.0)
          ),
        ],
      ),
    );
  }

  /// title, card navigation dots
  Widget? createHeaderWidget() {
    double? containerWidth  = widget.width! * 0.9;
    double? containerHeight = widget.width! * 0.1;

    return Container(
      width: containerWidth,
      height: containerHeight,
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      alignment: Alignment.centerLeft,
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          createTitleWidget()!,      /// title
          createNavigationWidget()!, /// card navigation (dots)
        ],
      ),
    );
  }

  /// cards
  Widget? createBodyWidget() {
    double? containerWidth      = widget.width! * 0.95;
    double? containerHeight     = widget.height! - (widget.width! * 0.1);
    double? containerItemWidth  = widget.width! * 0.9;
    double? containerItemHeight = widget.width! * 0.9;

    return Container(
      width: containerWidth,
      height: containerHeight,
      alignment: Alignment.center,
      color: Colors.transparent,
      child: ScrollSnapList(
        duration: 750,
        itemBuilder: (context, i) {
          return Container(
            width: containerItemWidth,
            height: containerItemHeight,
            color: Colors.transparent,
            alignment: Alignment.center,
            child: widget.cards![i],
          );
        },
        itemCount: widget.cards!.length,
        itemSize: containerItemHeight,
        onItemFocus: (i) => setActiveItem(i),
        dynamicItemSize: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: widget.key,
      builder: (context, constraints) {
        widget.width   = constraints.maxWidth;
        widget.height  = constraints.maxWidth + (constraints.maxWidth * 0.1);
        widget.padding = widget.padding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        widget.margin  = widget.margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

        return Container(
          key: widget.key,
          padding: widget.padding,
          margin: widget.margin,
          alignment: Alignment.center,
          width: widget.width,
          height: widget.height,
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              createHeaderWidget()!, /// title && cards navigation
              createBodyWidget()!,   /// cards
            ],
          ),
        );
      }
    );
  }

}