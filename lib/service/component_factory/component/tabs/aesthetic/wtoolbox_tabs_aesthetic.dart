import 'package:flutter/material.dart';
import '../wtoolbox_tabs.dart';
import '../../wtoolbox_component_builder.dart';

class WTTabsAesthetic extends WTTabs {

  @override
  Widget? build() {
    return AestheticTabs(
      key:                   getUniqueKey(),
      textStyle:             textStyle,
      action:                action,
      width:                 width,
      backgroundColor:       backgroundColor,
      activeBackgroundColor: activeBackgroundColor,
      labelSize:             labelSize,
      labelColor:            labelColor,
      activeLabelColor:      activeLabelColor,
      padding:               padding,
      margin:                margin,
      selectedTab:           selectedTab,
      tabs:                  tabs,
      components:            components,
    );
  }

}

// ignore: must_be_immutable
class AestheticTabs extends StatefulWidget {

  Function? action, textStyle;
  double? width, labelSize;
  Color? backgroundColor, labelColor, activeLabelColor, activeBackgroundColor;
  EdgeInsets? padding, margin;
  int? selectedTab;
  List<Map>? tabs;
  List<Widget>? components;

  AestheticTabs({
    super.key,
    this.textStyle,
    this.action,
    this.width,
    this.backgroundColor,
    this.activeBackgroundColor,
    this.labelSize,
    this.labelColor,
    this.activeLabelColor,
    this.padding,
    this.margin,
    this.selectedTab,
    this.tabs,
    this.components,
  });

  @override
  State<AestheticTabs> createState() => _AestheticTabsState();

}

class _AestheticTabsState extends State<AestheticTabs> {

  @override
  void initState() {
    setTabs(widget.tabs);
    super.initState();
  }

  List<Map>? tabs = List<Map>.empty(growable: true);
  void setTabs(List<Map>? list) { setState(() { tabs = list; }); }

  Widget? createTabItems(double? tabSize) {
    if(tabs!.isEmpty) { return WTComponentBuilder.emptyComponent(); }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ...tabs!.map((t) {
          Color? tabBackgroundColor = t['key'] == widget.selectedTab ? widget.activeBackgroundColor : widget.backgroundColor;
          Color? tabLabelColor      = t['key'] == widget.selectedTab ? widget.activeLabelColor : widget.labelColor;

          return GestureDetector(
            onTap: () { widget.action!(t['key']); },
            child: Container(
              alignment: Alignment.center,
              width: tabSize,
              height: 40.0,
              decoration: BoxDecoration(
                color: tabBackgroundColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: WTComponentBuilder.createText(
                text: t['label']!,
                textAlign: TextAlign.center,
                textStyle: widget.textStyle!(
                  textColor: tabLabelColor,
                  fontSize: widget.labelSize
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: widget.key,
      child: LayoutBuilder(
        builder: (context, constraints) {
          widget.width     = constraints.maxWidth;
          double? tabsSize = widget.width! * 0.8;
          double? tabSize  = widget.width! * 0.4;
          widget.labelSize = widget.width! * 0.0425;

          return SizedBox(
            width: widget.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// tabs
                Container(
                  width: widget.width!,
                  padding: widget.padding,
                  margin: widget.margin,
                  alignment: Alignment.center,
                  child: Container(
                    width: tabsSize,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: widget.backgroundColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: createTabItems(tabSize)!,
                  ),
                ),

                /// components
                ...widget.components!,
              ],
            ),
          );
        }
      ),
    );
  }

}
