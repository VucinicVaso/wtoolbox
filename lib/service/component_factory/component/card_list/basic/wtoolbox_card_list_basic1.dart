import 'package:flutter/material.dart';
import '../wtoolbox_card_list.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardListBasic1 extends WTCardList {

  @override
  Widget? build() {
    return CardListStatefulWidget(
      key:             getUniqueKey(),
      width:           width,
      padding:         padding,
      margin:          margin,
      backgroundColor: backgroundColor,
      borderColor:     borderColor,
      shadeColor:      shadeColor,
      borderEnabled:   borderEnabled,
      textStyle:       textStyle,
      items:           items,
    );
  }

}

// ignore: must_be_immutable
class CardListStatefulWidget extends StatefulWidget {

  double? width;
  EdgeInsets? padding, margin;
  Color? backgroundColor, borderColor, shadeColor;
  bool? borderEnabled;
  Function? textStyle;
  List<Map>? items = List<Map>.empty(growable: true);

  CardListStatefulWidget({
    super.key,
    this.width,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.shadeColor,
    this.borderEnabled,
    this.textStyle,
    this.items,
  });

  @override
  State<CardListStatefulWidget> createState() => CardListState();

}

class CardListState extends State<CardListStatefulWidget> {

  @override
  void initState() {
    super.initState();
    setItems();
  }

  List<Map>? items = List<Map>.empty(growable: true);
  void setItems() { setState(() { items = widget.items; }); }

  BoxDecoration? createDecoration() {
    BoxDecoration? boxDecoration = BoxDecoration(color: widget.backgroundColor);

    if(widget.borderEnabled!) {
      boxDecoration = BoxDecoration(
        color: widget.backgroundColor!,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(
          width: 1,
          color: widget.borderColor!,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: widget.shadeColor!,
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      );
    }

    return boxDecoration;
  }

  /// icon
  Widget? createIconWidget(Map? map, double? iconSize) {
    Widget? iconWidget = WTComponentBuilder.emptyComponent();

    if(map!.containsKey('icon')) {
      iconWidget = Container(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        margin: const EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
        alignment: Alignment.center,
        color: map['iconBackgroundColor'],
        child: WTComponentBuilder.createIcon(
          iconData: map['icon'],
          size: iconSize,
          color: map['iconColor'],
        ),
      );
    }

    return iconWidget;
  }

  /// title, subtitle
  Widget? createLabelsWidget(Map? map, double? titleSizeMd, titleSizeSm, double? subtitleSizeMd, double? subtitleSizeSm) {
    if(!map!.containsKey('title') && !map.containsKey('subtitle')) {
      return Expanded(child: WTComponentBuilder.emptyComponent()!);
    }

    Widget? titleWidget = WTComponentBuilder.emptyComponent()!;
    if(map.containsKey('title')) {
      EdgeInsets? titlePadding = map.containsKey('subtitle') ? const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 2.5) : const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0);
      EdgeInsets? titleMargin  = const EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5);
      double? titleSize        = map['title']!.length > 40 ? titleSizeSm : titleSizeMd;

      titleWidget = Container(
        padding: titlePadding,
        margin: titleMargin,
        alignment: Alignment.centerLeft,
        color: Colors.transparent,
        child: WTComponentBuilder.createText(
          text: map['title'],
          textAlign: TextAlign.left,
          textStyle: widget.textStyle!(
            textColor: map['titleColor'],
            fontSize: titleSize,
            fontWeight: FontWeight.normal,
          ),
        )!,
      );
    }

    Widget? subtitleWidget = WTComponentBuilder.emptyComponent()!;
    if(map.containsKey('subtitle')) {
      EdgeInsets? subtitlePadding = const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0);
      EdgeInsets? subtitleMargin  = const EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5);
      double? subtitleSize        = map['subtitle']!.length > 40 ? subtitleSizeSm : subtitleSizeMd;

      subtitleWidget = Container(
        padding: subtitlePadding,
        margin: subtitleMargin,
        alignment: Alignment.centerLeft,
        color: Colors.transparent,
        child: WTComponentBuilder.createText(
          text: map['subtitle'],
          textAlign: TextAlign.left,
          textStyle: widget.textStyle!(
            textColor: map['subtitleColor'],
            fontSize: subtitleSize,
            fontWeight: FontWeight.normal
          ),
        )!,
      );
    }

    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleWidget,
            subtitleWidget,
          ],
        ),
      ),
    );
  }

  /// actionIcon
  Widget? actionIconWidget(Map? map, double? actionIconSize) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
      alignment: Alignment.center,
      color: map!['actionIconBackgroundColor'],
      child: WTComponentBuilder.createIcon(
        iconData: map['actionIcon'],
        size: actionIconSize,
        color: map['actionIconColor'],
      ),
    );
  }

  Widget? createBody() {
    if(items!.isEmpty) { return const SizedBox.shrink(); }

    double? iconSize       = widget.width! * 0.065;
    double? titleSizeMd    = widget.width! * 0.045;
    double? titleSizeSm    = titleSizeMd * 0.8;
    double? subtitleSizeMd = widget.width! * 0.04;
    double? subtitleSizeSm = subtitleSizeMd * 0.8;
    double? actionIconSize = widget.width! * 0.065;

    List<Widget>? widgets = List<Widget>.empty(growable: true);
    for(int i = 0; i < items!.length; i++) {
      Map? item = items![i];

      widgets.add(
        GestureDetector(
          onTap: () => item['action'](),
          child: Container(
            padding: const EdgeInsets.fromLTRB(5.0, 2.5, 5.0, 2.5),
            margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 15.0),
            alignment: Alignment.centerLeft,
            decoration: createDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                createIconWidget(
                  item,
                  iconSize
                )!, /// item[icon]
                createLabelsWidget(
                  item,
                  titleSizeMd,
                  titleSizeSm,
                  subtitleSizeMd,
                  subtitleSizeSm
                )!, /// item[title, subtitle]
                actionIconWidget(
                  item,
                  actionIconSize
                )!,   /// item[actionIcon]
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ...widgets,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: widget.key,
      builder: (context, constraints) {
        widget.width   = constraints.maxWidth;
        widget.padding = widget.padding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        widget.margin  = widget.margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

        return Container(
          padding: widget.padding,
          margin: widget.margin,
          width: widget.width,
          decoration: BoxDecoration(color: widget.backgroundColor),
          alignment: Alignment.centerLeft,
          child: createBody(),
        );
      }
    );
  }

}