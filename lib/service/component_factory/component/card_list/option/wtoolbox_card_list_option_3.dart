import 'package:flutter/material.dart';
import '../wtoolbox_card_list.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardListOption3 extends WTCardList {

  @override
  Widget? build() {
    return WTListCardOptionState(
      key:             getUniqueKey(),
      textStyle:       textStyle,
      width:           width,
      padding:         padding,
      margin:          margin,
      backgroundColor: backgroundColor,
      borderColor:     borderColor,
      shadeColor:      shadeColor,
      items:           items,
      borderEnabled:   borderEnabled,
    );
  }

}

// ignore: must_be_immutable
class WTListCardOptionState extends StatefulWidget {

  WTListCardOptionState({
    super.key,
    this.textStyle,
    this.width,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.shadeColor,
    this.items,
    this.borderEnabled,
  });

  Function? textStyle;
  double? width;
  EdgeInsets? padding, margin;
  Color? backgroundColor, borderColor, shadeColor;
  List<Map>? items = List<Map>.empty(growable: true);
  bool? borderEnabled;

  @override
  State<WTListCardOptionState> createState() => _WTListCardOptionState();

}

class _WTListCardOptionState extends State<WTListCardOptionState> {

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

  Widget? iconWidget(Map? item) {
    if(item!['icon'] == null) { return WTComponentBuilder.emptyComponent(); }

    return Container(
      width: item['iconSize'],
      height: item['iconSize'],
      padding: const EdgeInsets.all(2.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: item['iconBackgroundColor'],
        shape: BoxShape.circle,
      ),
      child: WTComponentBuilder.createIcon(
        iconData: item['icon'],
        color:    item['iconColor'],
        size:     item['iconSize'] * 0.6
      ),
    );
  }

  Widget? titleWidget(Map? item) {
    if(item!['title'] == null) { return Expanded(child: WTComponentBuilder.emptyComponent()!); }

    item['title'] = item['title'].length > 15 ? '${item['title'].substring(0, 12)}...' : item['title'];

    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
        child: WTComponentBuilder.createText(
          text:      item['title'],
          textAlign: TextAlign.left,
          textStyle: widget.textStyle!(textColor: item['titleColor'], fontSize: item['titleSize'])
        ),
      ),
    );
  }

  Widget? actionIconWidget(Map? item) {
    return Container(
      width: item!['actionIconSize'],
      height: item['actionIconSize'],
      padding: const EdgeInsets.all(5.0),
      alignment: Alignment.center,
      child: item['data']['selected'] == true
        ? WTComponentBuilder.createIcon(
            iconData: Icons.radio_button_checked,
            color:    item['actionIconColor'],
            size:     item['actionIconSize'] * 0.8
          )
        : WTComponentBuilder.createIcon(
            iconData: Icons.radio_button_off,
            color:    item['actionDecorationIconColor'],
            size:     item['actionIconSize'] * 0.8
          ),
    );
  }

  Widget? createItemsList() {
    if(items!.isEmpty) { return const SizedBox.shrink(); }

    List<Widget>? widgets = List<Widget>.empty(growable: true);
    for(int i = 0; i < items!.length; i++) {
      Map? item = items![i];
      
      widgets.add(
        GestureDetector(
          onTap: () => onItemSelected(item),
          child: Container(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            margin: const EdgeInsets.all(5.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 0.0)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                iconWidget(item)!,       /// icon
                titleWidget(item)!,      /// title
                actionIconWidget(item)!, /// actionIcon
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
    return Container(
      key: widget.key,
      width: widget.width!,
      padding: widget.padding,
      margin: widget.margin,
      decoration: widget.borderEnabled!
        ? BoxDecoration(
            color: widget.backgroundColor!,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            border: Border.all(width: 1, color: widget.borderColor!),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: widget.shadeColor!,
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          )
        : BoxDecoration(color: widget.backgroundColor),
      alignment: Alignment.center,
      child: createItemsList(),
    );
  }

}