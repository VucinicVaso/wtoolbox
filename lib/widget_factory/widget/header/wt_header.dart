import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

abstract class WTHeader {

  UniqueKey? getUniqueKey() { return UniqueKey(); }

  double? width;
  void setWidth(double? v) { width = v; }

  BuildContext? buildContext;
  void setBuildContext(BuildContext? v) { buildContext = v; }

  String? googleFonts = '';
  void setGoogleFonts(String? v) { if(v != null || v != '') { googleFonts = v; } }

  Color? backgroundColor;
  void setBackgroundColor(Color? v) { backgroundColor = v; }

  bool? shadow = false;
  void withShadow(bool? v) { shadow = v; }

  bool? sidebar = false;
  IconData? sidebarIcon;
  Color? sidebarIconColor;
  double? sidebarIconSize;
  VoidCallback? sidebarAction;
  void withSidebar() { sidebar = true; }
  void setSidebarIcon(IconData? v) { sidebarIcon = v; }
  void setSidebarIconColor(Color? v) { sidebarIconColor = v; }
  void setSidebarIconSize(double? v) { sidebarIconSize = v; }
  void setSidebarAction(VoidCallback? v) { sidebarAction = v; }

  VoidCallback? backAction;

  String? backActionNetworkImage, backActionAssetImage;
  Uint8List? backActionMemoryImage;
  
  File? backActionSvgFile;
  Uint8List? backActionSvgMemory;
  String? backActionSvgString, backActionSvgNetwork, backActionSvgAsset;
  Color? backActionSvgBackgroundColor;
  void setBackActionSvgBackgroundColor(Color? v) { backActionSvgBackgroundColor = v; }

  IconData? backActionIcon;
  double? backActionIconSize;
  Color? backActionIconColor;
  void setBackActionIconSize(double? v) { backActionIconSize = v; }
  void setBackActionIconColor(Color? v) { backActionIconColor = v; }

  String? backActionLabel;
  double? backActionLabelSize;
  Color? backActionLabelColor;
  void setBackActionLabelSize(double? v) { backActionLabelSize = v; }
  void setBackActionLabelColor(Color? v) { backActionLabelColor = v; }

  void setBackAction({
    VoidCallback? action,
    IconData? icon,
    String? imageFromNetwork, 
    String? imageFromAsset,
    Uint8List? imageFromMemory,
    File? svgFile,
    Uint8List? svgMemory,
    String? svgString, 
    String? svgNetwork, 
    String? svgAsset,
    String? label,
  }) { 
    backAction             = action; 
    backActionIcon         = icon;
    backActionNetworkImage = imageFromNetwork;
    backActionAssetImage   = imageFromAsset;
    backActionMemoryImage  = imageFromMemory;
    backActionSvgFile      = svgFile;
    backActionSvgMemory    = svgMemory;
    backActionSvgString    = svgString; 
    backActionSvgNetwork   = svgNetwork;
    backActionSvgAsset     = svgAsset;
    backActionLabel        = label;
  }

  String? label;
  double? labelSize;
  Color? labelColor;
  void setLabel(String? v) { label = v; }
  void setLabelSize(double? v) { labelSize = v; }
  void setLabelColor(Color? v) { labelColor = v; }

  double? actionIconSize, actionLabelSize;
  Color? actionIconColor, actionIconBackgroundColor, actionLabelColor;
  void setActionIconSize(double? v) { actionIconSize = v; }
  void setActionIconColor(Color? v) { actionIconColor = v; }
  void setActionIconBackgroundColor(Color? v) { actionIconBackgroundColor = v; }
  void setActionLabelSize(double? v) { actionLabelSize = v; }
  void setActionLabelColor(Color? v) { actionLabelColor = v; }
  List<Map>? actions = List<Map>.empty(growable: true);
  void addAction({
    VoidCallback? action,
    IconData? icon,
    String? label,
    String? networkImage,
    String? assetImage,
    Uint8List? memoryImage
  }) {
    actions!.add({
      'action':       action,
      'icon':         icon,
      'label':        label,
      'networkImage': networkImage,
      'assetImage':   assetImage,
      'memoryImage':  memoryImage
    });
  }

  IconData? menuIcon;
  void setMenuIcon(IconData? v) { menuIcon = v; }
  double? menuIconSize, menuLabelSize;
  void setMenuIconSize(double? v) { menuIconSize = v; }
  void setMenuLabelSize(double? v) { menuLabelSize = v; }
  Color? menuIconColor, menuBackgroundColor, menuItemIconColor, menuItemLabelColor;
  void setMenuIconColor(Color? v) { menuIconColor = v; }
  void setMenuBackgroundColor(Color? v) { menuBackgroundColor = v; }
  void setMenuItemIconColor(Color? v) { menuItemIconColor = v; }
  void setMenuItemLabelColor(Color? v) { menuItemLabelColor = v; }
  List<Map>? menuItems = List<Map>.empty(growable: true);
  void addMenuItem({
    VoidCallback? action,
    IconData? icon,
    String? label,
    String? networkImage,
    String? assetImage,
    Uint8List? memoryImage,
  }) {
    menuItems!.add({
      'action':       action,
      'icon':         icon,
      'label':        label,
      'networkImage': networkImage,
      'assetImage':   assetImage,
      'memoryImage':  memoryImage
    });
  }

  PreferredSizeWidget? build();

}