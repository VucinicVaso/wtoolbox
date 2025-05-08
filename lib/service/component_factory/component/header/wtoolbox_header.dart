import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_fonts.dart';

abstract class WTHeader {

  UniqueKey? getUniqueKey() { return UniqueKey(); }

  double? width;
  void setWidth(double? v) { width = v; }

  BuildContext? buildContext;
  void setBuildContext(BuildContext? v) { buildContext = v; }

  String? googleFonts = '';
  void setGoogleFonts(String? v) {
    if(v != null || v != '') { googleFonts = v; }
  }

  TextStyle? textStyle({ Color? textColor, double? fontSize, FontWeight? fontWeight = FontWeight.normal }) {
    if(googleFonts != null && googleFonts!.isNotEmpty) {
      return GoogleFonts.getFont(
        googleFonts!,
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
    }

    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  Color? backgroundColor;
  void setBackgroundColor(Color? v) { backgroundColor = v; }

  bool? shadow = false;
  void withShadow(bool? v) { shadow = v; }

  VoidCallback? backAction;
  void setBackAction(VoidCallback? v) { backAction = v; }

  String? backActionNetworkImage, backActionAssetImage;
  Uint8List? backActionMemoryImage;
  void setBackActionNetworkImage(String? v) { backActionNetworkImage = v; }
  void setBackActionAssetImage(String? v) { backActionAssetImage = v; }
  void setBackActionMemoryImage(Uint8List? v) { backActionMemoryImage = v; }

  File? backActionSvgFile;
  Uint8List? backActionSvgMemory;
  String? backActionSvgString, backActionSvgNetwork, backActionSvgAsset;
  void setBackActionSvgFromFile(File? v) { backActionSvgFile = v; }
  void setBackActionSvgFromMemory(Uint8List? v) { backActionSvgMemory = v; }
  void setBackActionSvgFromAssets(String? v) { backActionSvgAsset = v; }
  void setBackActionSvgFromNetwork(String? v) { backActionSvgNetwork = v; }
  void setBackActionSvgFromString(String? v) { backActionSvgString = v; }
  Color? backActionSvgBackgroundColor;
  void setBackActionSvgBackgroundColor(Color? v) { backActionSvgBackgroundColor = v; }

  IconData? backActionIcon;
  double? backActionIconSize;
  Color? backActionIconColor;
  void setBackActionIcon(IconData? v) { backActionIcon = v; }
  void setBackActionIconSize(double? v) { backActionIconSize = v; }
  void setBackActionIconColor(Color? v) { backActionIconColor = v; }

  String? backActionLabel;
  double? backActionLabelSize;
  Color? backActionLabelColor;
  void setBackActionLabel(String? v) { backActionLabel = v; }
  void setBackActionLabelSize(double? v) { backActionLabelSize = v; }
  void setBackActionLabelColor(Color? v) { backActionLabelColor = v; }

  String? backActionLinkLabel;
  double? backActionLinkLabelSize;
  Color? backActionLinkLabelColor;
  void setBackActionLinkLabel(String? v) { backActionLinkLabel = v; }
  void setBackActionLinkLabelSize(double? v) { backActionLinkLabelSize = v!; }
  void setBackActionLinkLabelColor(Color? v) { backActionLinkLabelColor = v; }

  String? label;
  double? labelSize;
  Color? labelColor;
  void setLabel(String? v) { label = v; }
  void setLabelSize(double? v) { labelSize = v; }
  void setLabelColor(Color? v) { labelColor = v; }

  double? actionIconSize, actionLabelSize, actionLinkLabelSize;
  Color? actionIconColor, actionIconBackgroundColor, actionLabelColor, actionLinkLabelColor;
  void setActionIconSize(double? v) { actionIconSize = v; }
  void setActionIconColor(Color? v) { actionIconColor = v; }
  void setActionIconBackgroundColor(Color? v) { actionIconBackgroundColor = v; }
  void setActionLabelSize(double? v) { actionLabelSize = v; }
  void setActionLabelColor(Color? v) { actionLabelColor = v; }
  void setActionLinkLabelSize(double? v) { actionLinkLabelSize = v; }
  void setActionLinkLabelColor(Color? v) { actionLinkLabelColor = v; }
  List<Map>? actions = List<Map>.empty(growable: true);
  void addAction({
    VoidCallback? action,
    IconData? icon,
    String? label,
    String? linkLabel,
    String? networkImage,
    String? assetImage,
    Uint8List? memoryImage
  }) {
    actions!.add({
      'action':       action,
      'icon':         icon,
      'label':        label,
      'linkLabel':    linkLabel,
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
    IconData? icon,
    String? label,
    String? networkImage,
    String? assetImage,
    Uint8List? memoryImage,
    VoidCallback? action
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