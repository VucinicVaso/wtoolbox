import 'package:flutter/material.dart';
import '../wtoolbox_tabs.dart';

class WTTabsRegular extends WTTabs {

  @override
  Widget? build() {
    return RegularTabs(
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
class RegularTabs extends StatefulWidget {

  Function? action, textStyle;
  double? width, labelSize;
  Color? backgroundColor, labelColor, activeLabelColor, activeBackgroundColor;
  EdgeInsets? padding, margin;
  int? selectedTab;
  List<Map>? tabs;
  List<Widget>? components;

  RegularTabs({
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
  State<RegularTabs> createState() => _RegularTabsState();

}

class _RegularTabsState extends State<RegularTabs> with TickerProviderStateMixin {

  @override
  void initState() {
    setTabController();
    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  TabController? tabController;
  void setTabController() {
    tabController = TabController(length: widget.tabs!.length, vsync: this);
    tabController!.animateTo(widget.selectedTab!, duration: const Duration(seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: widget.key,
      child: LayoutBuilder(
        builder: (context, constraints) {
          widget.width     = constraints.maxWidth;
          widget.labelSize = widget.width! * 0.0425;

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// tabs
              Container(
                width: widget.width!,
                padding: widget.padding,
                margin: widget.margin,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  border: const Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.4),
                  ),
                ),
                child: TabBar(
                  isScrollable: true,
                  controller: tabController,
                  indicatorWeight: 2.0,
                  indicatorColor: widget.activeLabelColor,
                  labelStyle: widget.textStyle!(
                    textColor: widget.activeLabelColor,
                    fontSize: widget.labelSize
                  ),
                  unselectedLabelStyle: widget.textStyle!(
                    textColor: widget.labelColor,
                    fontSize: widget.labelSize
                  ),
                  labelPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                  tabAlignment: TabAlignment.center,
                  onTap: (key) => widget.action!(key),
                  tabs: <Widget>[
                    ...widget.tabs!.map((t) =>
                      Tab(
                        key: UniqueKey(),
                        text: t['label']!,
                      )
                    )
                  ],
                ),
              ),

              /// components
              ...widget.components!,
            ],
          );
        },
      ),
    );
  }

}