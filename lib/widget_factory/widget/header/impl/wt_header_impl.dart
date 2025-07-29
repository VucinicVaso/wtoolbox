import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:wtoolbox/external/lib_svg.dart';
import '../wt_header.dart';
import '../wt_header_builder.dart';

class WTHeaderImpl extends WTHeader {

  @override
  PreferredSizeWidget? build() {
    return HeaderWidget(
      key:                          getUniqueKey(),
      width:                        width,
      backgroundColor:              backgroundColor,
      shadow:                       shadow,
      fontFamily:                   googleFonts,
      sidebar:                      sidebar,
      sidebarIcon:                  sidebarIcon,
      sidebarIconColor:             sidebarIconColor,
      sidebarIconSize:              sidebarIconSize,
      sidebarAction:                sidebarAction,
      backAction:                   backAction,
      backActionNetworkImage:       backActionNetworkImage,
      backActionAssetImage:         backActionAssetImage,
      backActionMemoryImage:        backActionMemoryImage,
      backActionSvgMemory:          backActionSvgMemory,
      backActionSvgString:          backActionSvgString,
      backActionSvgNetwork:         backActionSvgNetwork,
      backActionSvgAsset:           backActionSvgAsset,
      backActionSvgBackgroundColor: backActionSvgBackgroundColor,
      backActionIcon:               backActionIcon,
      backActionIconSize:           backActionIconSize,
      backActionIconColor:          backActionIconColor,
      backActionLabel:              backActionLabel,
      backActionLabelSize:          backActionLabelSize,
      backActionLabelColor:         backActionLabelColor,
      label:                        label,
      labelSize:                    labelSize,
      labelColor:                   labelColor,
      actionIconSize:               actionIconSize,
      actionIconColor:              actionIconColor,
      actionIconBackgroundColor:    actionIconBackgroundColor,
      actionLabelSize:              actionLabelSize,
      actionLabelColor:             actionLabelColor,
      actions:                      actions,
      menuIcon:                     menuIcon,
      menuIconSize:                 menuIconSize,
      menuLabelSize:                menuLabelSize,
      menuIconColor:                menuIconColor,
      menuBackgroundColor:          menuBackgroundColor,
      menuItemIconColor:            menuItemIconColor,
      menuItemLabelColor:           menuItemLabelColor,
      menuItems:                    menuItems,
    );
  }

}

// ignore: must_be_immutable
class HeaderWidget extends StatefulWidget implements PreferredSizeWidget {

  double? width;
  bool? shadow;
  Color? backgroundColor, borderColor;
  String? fontFamily;

  bool? sidebar;
  IconData? sidebarIcon;
  Color? sidebarIconColor;
  double? sidebarIconSize;
  VoidCallback? sidebarAction;

  VoidCallback? backAction;
  IconData? backActionIcon;
  String? backActionLabel;
  double? backActionIconSize, backActionLabelSize;
  Color? backActionIconColor, backActionLabelColor;

  String? backActionNetworkImage, backActionAssetImage;
  Uint8List? backActionMemoryImage;

  Uint8List? backActionSvgMemory;
  String? backActionSvgString, backActionSvgNetwork, backActionSvgAsset;
  Color? backActionSvgBackgroundColor;

  String? label;
  double? labelSize;
  Color? labelColor;

  List<Map>? actions;
  double? actionIconSize, actionLabelSize;
  Color? actionIconColor, actionIconBackgroundColor, actionLabelColor;

  IconData? menuIcon;
  List<Map>? menuItems;
  double? menuIconSize, menuLabelSize;
  Color? menuIconColor, menuBackgroundColor, menuItemIconColor, menuItemLabelColor;

  HeaderWidget({
    super.key,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.fontFamily,
    this.shadow,
    this.sidebar,
    this.sidebarIcon,
    this.sidebarIconColor,
    this.sidebarIconSize,
    this.sidebarAction,
    this.backAction,
    this.backActionNetworkImage,
    this.backActionAssetImage,
    this.backActionMemoryImage,
    this.backActionSvgMemory,
    this.backActionSvgString,
    this.backActionSvgNetwork,
    this.backActionSvgAsset,
    this.backActionSvgBackgroundColor,
    this.backActionIcon,
    this.backActionIconSize,
    this.backActionIconColor,
    this.backActionLabel,
    this.backActionLabelSize,
    this.backActionLabelColor,
    this.label,
    this.labelSize,
    this.labelColor,
    this.actionIconSize,
    this.actionIconColor,
    this.actionIconBackgroundColor,
    this.actionLabelSize,
    this.actionLabelColor,
    this.actions,
    this.menuIcon,
    this.menuIconSize,
    this.menuLabelSize,
    this.menuIconColor,
    this.menuBackgroundColor,
    this.menuItemIconColor,
    this.menuItemLabelColor,
    this.menuItems,
  });

  @override
  State<HeaderWidget> createState() => _HeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(50);

}

class _HeaderState extends State<HeaderWidget> {

  double? width, height;
  bool? shadow;
  Function? textStyle;
  Color? backgroundColor;
  String? fontFamily;

  bool? sidebar;
  IconData? sidebarIcon;
  Color? sidebarIconColor;
  double? sidebarIconSize;
  VoidCallback? sidebarAction;

  VoidCallback? backAction;
  IconData? backActionIcon;
  String? backActionLabel;
  double? backActionIconSize, backActionLabelSize;
  Color? backActionIconColor, backActionLabelColor;

  String? backActionNetworkImage, backActionAssetImage;
  Uint8List? backActionMemoryImage;

  Uint8List? backActionSvgMemory;
  String? backActionSvgString, backActionSvgNetwork, backActionSvgAsset;
  Color? backActionSvgBackgroundColor;

  String? label;
  double? labelSize;
  Color? labelColor;

  List<Map>? actions;
  double? actionIconSize, actionLabelSize;
  Color? actionIconColor, actionIconBackgroundColor, actionLabelColor;

  IconData? menuIcon;
  List<Map>? menuItems;
  double? menuIconSize, menuLabelSize;
  Color? menuIconColor, menuBackgroundColor, menuItemIconColor, menuItemLabelColor;

  @override
  void initState() {
    setState(() {
      width                        = widget.width;
      height                       = 50.0;
      backActionIconSize           = height! * 0.5;
      backActionLabelSize          = height! * 0.3;
      labelSize                    = height! * 0.3;
      actionIconSize               = height! * 0.5;
      actionLabelSize              = height! * 0.3;
      menuIconSize                 = height! * 0.5;
      menuLabelSize                = height! * 0.3;
      backgroundColor              = widget.backgroundColor;
      shadow                       = widget.shadow;
      sidebar                      = widget.sidebar;
      sidebarIcon                  = widget.sidebarIcon;
      sidebarIconColor             = widget.sidebarIconColor;
      sidebarIconSize              = height! * 0.5;
      sidebarAction                = widget.sidebarAction;
      backAction                   = widget.backAction;
      backActionNetworkImage       = widget.backActionNetworkImage;
      backActionAssetImage         = widget.backActionAssetImage;
      backActionMemoryImage        = widget.backActionMemoryImage;
      backActionSvgMemory          = widget.backActionSvgMemory;
      backActionSvgString          = widget.backActionSvgString;
      backActionSvgNetwork         = widget.backActionSvgNetwork;
      backActionSvgAsset           = widget.backActionSvgAsset;
      backActionSvgBackgroundColor = widget.backActionSvgBackgroundColor;
      backActionIcon               = widget.backActionIcon;
      backActionIconColor          = widget.backActionIconColor;
      backActionLabelColor         = widget.backActionLabelColor;
      backActionLabel              = widget.backActionLabel;
      label                        = widget.label;
      labelColor                   = widget.labelColor;
      actionIconColor              = widget.actionIconColor;
      actionIconBackgroundColor    = widget.actionIconBackgroundColor;
      actionLabelColor             = widget.actionLabelColor;
      actions                      = widget.actions;
      menuIcon                     = widget.menuIcon;
      menuIconColor                = widget.menuIconColor;
      menuBackgroundColor          = widget.menuBackgroundColor;
      menuItemIconColor            = widget.menuItemIconColor;
      menuItemLabelColor           = widget.menuItemLabelColor;
      menuItems                    = widget.menuItems;
    });

    super.initState();
  }

  Widget emptyWidget = SizedBox.shrink();

  Widget? sidebarWidget() {
    if(sidebar == false) { return emptyWidget; }

    return GestureDetector(
      onTap: () { sidebarAction!(); },
      child:Container(
        margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        alignment: Alignment.center,
        width: sidebarIconSize,
        height: sidebarIconSize,
        child: Icon(
          sidebarIcon,
          size: sidebarIconSize,
          color: sidebarIconColor
        ),
      ),
    );
  }
  
  Widget? backActionsWidgets() {
    /// backActionIcon
    Widget? backActionIconWidget = emptyWidget;
    if(backActionIcon != null) {
      backActionIconWidget = Container(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
        alignment: Alignment.center,
        width: backActionIconSize,
        height: backActionIconSize,
        child: Icon(
          backActionIcon,
          size: backActionIconSize,
          color: backActionIconColor
        ),
      );
    }

    /// backActionNetworkImage, backActionAssetImage, backActionMemoryImage
    Widget? backActionImageWidget = emptyWidget;
    if(backActionNetworkImage != null || backActionAssetImage != null || backActionMemoryImage != null) {
      if(backActionNetworkImage != null) {
        backActionImageWidget = WTHeaderBuilder.createNetworkImage(
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
          size: backActionIconSize,
          image: backActionNetworkImage
        );
      }

      if(backActionAssetImage != null) {
        backActionImageWidget = WTHeaderBuilder.createAssetsImage(
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
          size: backActionIconSize,
          image: backActionAssetImage
        )!;
      }

      if(backActionMemoryImage != null) {
        backActionImageWidget = WTHeaderBuilder.createMemoryImage(
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
          size: backActionIconSize,
          image: backActionMemoryImage
        )!;
      }
    }

    /// backActionSvgMemory, backActionSvgString, backActionSvgNetwork, backActionSvgAsset
    Widget? svgImageWidget = emptyWidget;
    if(backActionSvgMemory != null || backActionSvgString != null || backActionSvgNetwork != null || backActionSvgAsset != null) {
      Widget? widget  = emptyWidget;
      double? svgSize = backActionIconSize;

      if(backActionSvgMemory != null) {
        widget = SvgPicture.memory(
          backActionSvgMemory!,
          fit: BoxFit.cover,
          width: svgSize,
          height: svgSize,
        );
      }

      if(backActionSvgString != null) {
        widget = SvgPicture.string(
          backActionSvgString!,
          fit: BoxFit.cover,
          width: svgSize,
          height: svgSize,
        );
      }

      if(backActionSvgNetwork != null) {
        widget = SvgPicture.network(
          backActionSvgNetwork!,
          fit: BoxFit.cover,
          width: svgSize,
          height: svgSize,
        );
      }

      if(backActionSvgAsset != null) {
        widget = SvgPicture.asset(
          backActionSvgAsset!,
          fit: BoxFit.fill,
          width: svgSize,
          height: svgSize,
        );
      }

      svgImageWidget = Container(
        width: svgSize! + 15,
        height: svgSize + 15,
        padding: const EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backActionSvgBackgroundColor,
          border: Border.all(
            color: backActionSvgBackgroundColor!,
            width: 1,
          ),
        ),
        child: widget,
      );
    }

    /// backActionLabel
    Widget? backActionLabelWidget = emptyWidget;
    if(backActionLabel != null) {
      backActionLabel = backActionLabel!.length > 20 ? '${backActionLabel!.substring(0, 20)}...' : backActionLabel;

      backActionLabelWidget = Container(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
        child: Text(
          backActionLabel!,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: backActionLabelColor,
            fontSize: backActionLabelSize,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: backAction ?? () {},
      child: Container(
        padding: const EdgeInsets.all(0.0),
        margin: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            backActionIconWidget,
            svgImageWidget,
            backActionImageWidget!,
            backActionLabelWidget,
          ],
        ),
      ),
    );
  }

  Widget? titleWidget() {
    if(label == null) { return const Expanded(child: SizedBox.shrink()); }

    label = label!.length > 20 ? '${label!.substring(0, 20)}...' : label;

    return Expanded(
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          label!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: labelColor,
            fontSize: labelSize,
            fontWeight: FontWeight.normal
          ),
        ),
      ),
    );
  }

  Widget? createActionsList() {
    if(actions!.isEmpty) { return const SizedBox.shrink(); }

    List<Widget>? actionList = List<Widget>.empty(growable: true);
    for(int i = 0; i < actions!.length; i++) {
      var a             = actions![i];
      var actionPadding = const EdgeInsets.all(0.0);
      var actionMargin  = i == actions!.length -1 && menuItems!.isNotEmpty ? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0) : const EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0);

      Widget? iconWidget, labelWidget;

      if(a['icon'] != null) {
        iconWidget = Icon(
          a['icon'],
          size: actionIconSize,
          color: actionIconColor
        );
      }

      if(a['label'] != null) {
        labelWidget = Text(
          a['label']!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: actionLabelColor,
            fontSize: actionLabelSize,
            fontWeight: FontWeight.normal,
          ),
        );
      }

      if(labelWidget == null) {
        actionList.add(
          GestureDetector(
            onTap: a['action'],
            child: Container(
              padding: actionPadding,
              margin: actionMargin,
              child: iconWidget,
            ),
          )
        );
      }

      if(labelWidget != null) {
        actionList.add(
          Container(
            padding: actionPadding,
            margin: actionMargin,
            child: TextButton.icon(
              onPressed: a['action'],
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0.0),
              ),
              icon: iconWidget ?? emptyWidget,
              label: labelWidget,
            ),
          ),
        );
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ...actionList,
      ],
    );
  }

  Widget? createMenuList() {
    if(menuItems!.isEmpty) { return const SizedBox.shrink(); }

    List<PopupMenuItem>? popupMenuItems = List.empty(growable: true);
    for(var m in menuItems!) {
      popupMenuItems.add(
        PopupMenuItem(
          onTap: m['action'],
          padding: const EdgeInsets.all(0.0),
          child: Container(
            color: menuBackgroundColor,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(0.0),
            margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                m['icon'] == null
                  ? SizedBox.shrink()
                  : Icon(
                      m['icon'],
                      size: menuIconSize,
                      color: menuItemIconColor
                    ),
                  
                 m['icon'] == null && m['label'] == null ? SizedBox.shrink() : SizedBox(width: 5.0),

                m['label'] == null 
                  ? SizedBox.shrink()
                  : Text(
                      m['label']!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: menuItemIconColor,
                        fontSize: menuLabelSize,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                ],
              ),
            ),
          )
        );
    }

    return PopupMenuButton(
      iconSize: menuIconSize,
      color: menuBackgroundColor,
      shadowColor: menuBackgroundColor!,
      padding: const EdgeInsets.all(0.0),
      menuPadding: const EdgeInsets.all(0.0),
      position: PopupMenuPosition.under,
      onOpened: () => setState(() { menuIconColor = Colors.blueGrey; }),
      onCanceled: () => setState(() { menuIconColor = widget.menuIconColor; }),
      icon: Icon(
        menuIcon, 
        size: menuIconSize, 
        color: menuIconColor
      ),
      itemBuilder: (BuildContext context) => [ ...popupMenuItems ],
    );
  }

  Widget? actionsAndMenuWidgets() {
    if(actions!.isEmpty && menuItems!.isEmpty) { return SizedBox(height: 50.0, width: menuIconSize! + 10); }

    return Container(
      padding: const EdgeInsets.all(0.0),
      margin: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          createActionsList()!,
          createMenuList()!,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: widget.key,
      elevation: shadow! ? 2.0 : 0.0,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      shadowColor: shadow! ? Colors.grey.shade50 : Colors.transparent,
      backgroundColor: backgroundColor,
      title: Container(
        color: backgroundColor,
        width: width,
        height: height,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            sidebarWidget()!,         /// show sidebar action
            backActionsWidgets()!,    /// back actions
            titleWidget()!,           /// label
            actionsAndMenuWidgets()!, /// actions and menu list
          ],
        ),
      ),
    );
  }

}