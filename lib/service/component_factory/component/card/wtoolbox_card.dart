import 'dart:io';
import 'dart:typed_data';
import 'package:wtoolbox/3rd_party/lib_fontaws.dart';
import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTCard extends WTComponent {

  bool? expandable = false;
  void setExpandable(bool? v) { expandable = v; }

  bool? borderEnabled = true;
  void enableBorder(bool? v) { borderEnabled = v; }

  bool? underlineEnabled = false;
  void enableUnderline(bool? v) { underlineEnabled = v; }

  VoidCallback? action;
  void setAction(VoidCallback? v) { action = v; }

  String? htmlContent;
  void setHtmlContent(String? v) { htmlContent = v; }

  String? assetImage;
  String? networkImage;
  Uint8List? memoryImage;
  void setAssetImage(String? v) { assetImage = v; }
  void setNetworkImage(String? v) { networkImage = v; }
  void setMemoryImage(Uint8List? v) { memoryImage = v; }

  File? svgFile;
  Uint8List? svgMemory;
  String? svgString, svgNetwork, svgAsset;
  void setSvgFromFile(File? v) { svgFile = v; }
  void setSvgFromMemory(Uint8List? v) { svgMemory = v; }
  void setSvgFromAssets(String? v) { svgAsset = v; }
  void setSvgFromNetwork(String? v) { svgNetwork = v; }
  void setSvgFromString(String? v) { svgString = v; }

  IconData? icon, decorationIcon;
  double? iconSize, decorationIconSize;
  Color? iconColor, iconBackgroundColor, iconBorderColor, decorationIconColor, decorationIconBackgroundColor, decorationIconBorderColor;
  void setIconData(String? type, String? data) {
    if(type == 'fontAwesome') { icon = FaIcon(faIconNameMapping[data]).icon; }
  }
  void setIcon(IconData? v) { icon = v; }
  void setIconSize(double? v) { iconSize = v; }
  void setIconColor(Color? v) { iconColor = v; }
  void setIconBackgroundColor(Color? v) { iconBackgroundColor = v; }
  void setIconBorderColor(Color? v) { iconBorderColor = v; }
  void setDecorationIcon(IconData? v) { decorationIcon = v; }
  void setDecorationIconSize(double? v) { decorationIconSize = v; }
  void setDecorationIconColor(Color? v) { decorationIconColor = v; }
  void setDecorationIconBackgroundColor(Color? v) { decorationIconBackgroundColor = v; }
  void setDecorationIconBorderColor(Color? v) { decorationIconBorderColor = v; }

  String? title, subtitle, heading, description;
  double? titleSize, subtitleSize, headingSize, descriptionSize;
  Color? titleColor, titleBackgroundColor, titleBorderColor,
        subtitleColor, subtitleBackgroundColor, subtitleBorderColor,
        headingColor, headingBackgroundColor, headingBorderColor,
        descriptionColor, descriptionLabelBackgroundColor, descriptionLabelBorderColor;
  void setTitle(String? v) { title = v; }
  void setTitleSize(double? v) { titleSize = v; }
  void setTitleColor(Color? v) { titleColor = v; }
  void setTitleBackgroundColor(Color? v) { titleBackgroundColor = v; }
  void setTitleBorderColor(Color? v) { titleBorderColor = v; }
  void setSubtitle(String? v) { subtitle = v; }
  void setSubtitleSize(double? v) { subtitleSize = v; }
  void setSubtitleColor(Color? v) { subtitleColor = v; }
  void setSubtitleBackgroundColor(Color? v) { subtitleBackgroundColor = v; }
  void setSubtitleBorderColor(Color? v) { subtitleBorderColor = v; }
  void setHeading(String? v) { heading = v; }
  void setHeadingSize(double? v) { headingSize = v; }
  void setHeadingColor(Color? v) { headingColor = v; }
  void setHeadingBackgroundColor(Color? v) { headingBackgroundColor = v; }
  void setHeadingBorderColor(Color? v) { headingBorderColor = v; }
  void setDescription(String? v) { description = v; }
  void setDescriptionSize(double? v) { descriptionSize = v; }
  void setDescriptionColor(Color? v) { descriptionColor = v; }
  void setDescriptionBackgroundColor(Color? v) { descriptionLabelBackgroundColor = v; }
  void setDescriptionBorderColor(Color? v) { descriptionLabelBorderColor = v; }

  IconData? actionIcon, actionDecorationIcon;
  double? actionIconSize, actionDecorationIconSize;
  Color? actionIconColor, actionIconBackgroundColor, actionIconBorderColor,
         actionDecorationIconColor, actionDecorationIconBackgroundColor, actionDecorationIconBorderColor;
  void setActionIcon(IconData? v) { actionIcon = v; }
  void setActionIconSize(double? v) { actionIconSize = v; }
  void setActionIconColor(Color? v) { actionIconColor = v; }
  void setActionIconBackgroundColor(Color? v) { actionIconBackgroundColor = v; }
  void setActionIconBorderColor(Color? v) { actionIconBorderColor = v; }
  void setActionDecorationIcon(IconData? v) { actionDecorationIcon = v; }
  void setActionDecorationIconSize(double? v) { actionDecorationIconSize = v; }
  void setActionDecorationIconColor(Color? v) { actionDecorationIconColor = v; }
  void setActionDecorationIconBackgroundColor(Color? v) { actionDecorationIconBackgroundColor = v; }
  void setActionDecorationIconBorderColor(Color? v) { actionDecorationIconBorderColor = v; }

  String? actionLabel, actionSubLabel;
  double? actionLabelSize, actionSubLabelSize;
  Color? actionLabelColor, actionLabelBackgroundColor, actionLabelBorderColor,
         actionSubLabelColor, actionSubLabelBackgroundColor, actionSubLabelBorderColor;
  void setActionLabel(String? v) { actionLabel = v; }
  void setActionLabelSize(double? v) { actionLabelSize = v; }
  void setActionLabelColor(Color? v) { actionLabelColor = v; }
  void setActionLabelBackgroundColor(Color? v) { actionLabelBackgroundColor = v; }
  void setActionLabelBorderColor(Color? v) { actionLabelBorderColor = v; }
  void setActionSubLabel(String? v) { actionSubLabel = v; }
  void setActionSubLabelSize(double? v) { actionSubLabelSize = v; }
  void setActionSubLabelColor(Color? v) { actionSubLabelColor = v; }
  void setActionSubLabelBackgroundColor(Color? v) { actionSubLabelBackgroundColor = v; }
  void setActionSubLabelBorderColor(Color? v) { actionSubLabelBorderColor = v; }

  List<Widget>? components = List<Widget>.empty(growable: true);
  void addComponent(Widget? v) { components!.add(v!); }
  void addComponents(List<Widget>? v) { components!.addAll(v!); }

  double? badgeSize;
  void setBadgeSize(double? v) { badgeSize = v; }
  List<Map<String, dynamic>>? badges = List<Map<String, dynamic>>.empty(growable: true);
  void addBadge({ String? label, Color? color }) { badges!.add({ 'label': label, 'color': color }); }
  void addBadges(List<Map<String, dynamic>>? v) { badges!.addAll(v!); }

}