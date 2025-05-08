import 'package:flutter/material.dart';
import '../../../../../3rd_party/lib_material_symbols.dart';
import '../wtoolbox_card_list.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardListOptionBasic1 extends WTCardList {

  @override
  Widget? build() {
    return CardListOptionStatefulWidget(
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
class CardListOptionStatefulWidget extends StatefulWidget {

  double? width;
  EdgeInsets? padding, margin;
  Color? backgroundColor, borderColor, shadeColor;
  bool? borderEnabled;
  Function? textStyle;
  List<Map>? items = List<Map>.empty(growable: true);

  CardListOptionStatefulWidget({
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
  State<CardListOptionStatefulWidget> createState() => CardListOptionState();

}

class CardListOptionState extends State<CardListOptionStatefulWidget> {

  @override
  void initState() {
    super.initState();
    setItems();
  }

  List<Map>? items = List<Map>.empty(growable: true);
  void setItems() { setState(() { items = widget.items; }); }
  void onItemSelected(Map? item) {
    for(var i in items!) { i['data']['selected'] = i['data']['key'] == item!['data']['key'] ? true : false; }
    setState(() { items = items; });
    item!['action']();
  }

  BoxDecoration? createDecoration() {
    BoxDecoration? boxDecoration = BoxDecoration(color: widget.backgroundColor);

    if(widget.borderEnabled!) {
      boxDecoration = BoxDecoration(
        color: widget.backgroundColor!,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(
          width: 1,
          color: widget.borderColor!
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: widget.shadeColor!,
            spreadRadius: 1,
            blurRadius: 3,
            offset:  const Offset(0, 2),
          ),
        ],
      );
    }

    return boxDecoration;
  }

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

  Widget? createTitleWidget(Map? map, double? titleSizeMd, double? titleSizeSm) {
    Widget? titleWidget = Expanded(child: WTComponentBuilder.emptyComponent()!);

    if(map!.containsKey('title')) {
      titleWidget = Expanded(
        child: Container(
          padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          margin: const EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
          alignment: Alignment.centerLeft,
          color: Colors.transparent,
          child: WTComponentBuilder.createText(
            text: map['title'],
            textAlign: TextAlign.left,
            textStyle: widget.textStyle!(
              textColor: map['titleColor'],
              fontSize: map['title']!.length > 40 ? titleSizeSm : titleSizeMd,
              fontWeight: FontWeight.normal
            ),
          )!,
        ),
      );
    }

    return titleWidget;
  }

  Widget? actionIconWidget(Map? map, double? actionIconSize) {
    if(map!['data']['selected'] == false) {
      return WTComponentBuilder.sizedComponent(width: actionIconSize, height: actionIconSize);
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
      alignment: Alignment.center,
      color: map['actionIconBackgroundColor'],
      child: WTComponentBuilder.createIcon(
        iconData: Symbols.check,
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
    double? actionIconSize = widget.width! * 0.065;

    List<Widget>? widgets = List<Widget>.empty(growable: true);
    for(int i = 0; i < items!.length; i++) {
      Map? item = items![i];

      widgets.add(
        GestureDetector(
          onTap: () => onItemSelected(item),
          child: Container(
            padding: const EdgeInsets.fromLTRB(5.0, 2.5, 5.0, 2.5),
            margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 15.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent, width: 0.0)
            ),
            child: Row(
              mainAxisSize:       MainAxisSize.min,
              mainAxisAlignment:  MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                createIconWidget(
                  item,
                  iconSize
                )!,
                createTitleWidget(
                  item,
                  titleSizeMd,
                  titleSizeSm
                )!,
                actionIconWidget(
                  item,
                  actionIconSize
                )!,
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize:       MainAxisSize.min,
        mainAxisAlignment:  MainAxisAlignment.start,
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
          decoration: createDecoration(),
          alignment: Alignment.centerLeft,
          child: createBody(),
        );
      }
    );
  }

}