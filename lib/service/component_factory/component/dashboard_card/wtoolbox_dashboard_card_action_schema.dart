import 'package:flutter/material.dart';

enum WTDashboardActionCardIconType {
  fontAwesome,
  materialIcons
}

class WTDashboardCardActionSchema {

  WTDashboardCardActionSchema({
    this.backgroundColor,
    this.padding,
    this.margin,
    this.action,
    this.type,
    this.title,
    this.titleSize,
    this.titleColor,
    this.titleWeight,
    this.subtitle,
    this.subtitleSize,
    this.subtitleColor,
    this.subtitleWeight,
    this.iconType,
    this.iconValue,
    this.iconData,
    this.iconSize,
    this.iconColor,
    this.iconBackgroundColor,
    this.iconBorderColor,
    this.decorationIconType,
    this.decorationIconValue,
    this.decorationIconData,
    this.decorationIconSize,
    this.decorationIconColor,
    this.decorationIconBackgroundColor,
    this.decorationIconBorderColor
  });

  Map<String, dynamic> toMap() {
    return {
      'backgroundColor':               backgroundColor,
      'padding':                       padding,
      'margin':                        margin,
      'action':                        action,
      'type':                          type,
      'title':                         title,
      'titleSize':                     titleSize,
      'titleColor':                    titleColor,
      'titleWeight':                   titleWeight,
      'subtitle':                      subtitle,
      'subtitleSize':                  subtitleSize,
      'subtitleColor':                 subtitleColor,
      'subtitleWeight':                subtitleWeight,
      'iconType':                      iconType,
      'iconValue':                     iconValue,
      'iconData':                      iconData,
      'iconSize':                      iconSize,
      'iconColor':                     iconColor,
      'iconBackgroundColor':           iconBackgroundColor,
      'iconBorderColor':               iconBorderColor,
      'decorationIconType':            decorationIconType,
      'decorationIconValue':           decorationIconValue,
      'decorationIconData':            decorationIconData,
      'decorationIconSize':            decorationIconSize,
      'decorationIconColor':           decorationIconColor,
      'decorationIconBackgroundColor': decorationIconBackgroundColor,
      'decorationIconBorderColor':     decorationIconBorderColor
    };
  }

  WTDashboardCardActionSchema.fromMap(Map<dynamic, dynamic>? m) {
    backgroundColor               = m!['backgroundColor'];
    padding                       = m['padding'];
    margin                        = m['margin'];
    action                        = m['action'];
    type                          = m['type'];
    title                         = m['title'];
    titleSize                     = m['titleSize'];
    titleColor                    = m['titleColor'];
    titleWeight                   = m['titleWeight'];
    subtitle                      = m['subtitle'];
    subtitleSize                  = m['subtitleSize'];
    subtitleColor                 = m['subtitleColor'];
    subtitleWeight                = m['subtitleWeight'];
    iconType                      = m['iconType'];
    iconValue                     = m['iconValue'];
    iconData                      = m['iconData'];
    iconSize                      = m['iconSize'];
    iconColor                     = m['iconColor'];
    iconBackgroundColor           = m['iconBackgroundColor'];
    iconBorderColor               = m['iconBorderColor'];
    decorationIconType            = m['decorationIconType'];
    decorationIconValue           = m['decorationIconValue'];
    decorationIconData            = m['decorationIconData'];
    decorationIconSize            = m['decorationIconSize'];
    decorationIconColor           = m['decorationIconColor'];
    decorationIconBackgroundColor = m['decorationIconBackgroundColor'];
    decorationIconBorderColor     = m['decorationIconBorderColor'];
  }

  Color? backgroundColor;
  void setBackgroundColor(Color? v) { backgroundColor = v; }

  EdgeInsets? padding, margin;
  void setPadding(EdgeInsets? v) { padding = v; }
  void setMargin(EdgeInsets? v) { margin = v; }

  VoidCallback? action;
  void setAction(VoidCallback? v) { action = v; }

  String? type; // icon type: regular || stacked
  void setType(String? v) { type = v; }

  String? title;
  double? titleSize;
  Color? titleColor;
  FontWeight? titleWeight;
  void setTitle(String? v) { title = v; }
  void setTitleSize(double? v) { titleSize = v; }
  void setTitleColor(Color? v) { titleColor = v; }
  void setTitleWeight(FontWeight? v) { titleWeight = v; }

  String? subtitle;
  double? subtitleSize;
  Color? subtitleColor;
  FontWeight? subtitleWeight;
  void setSubtitle(String? v) { subtitle = v; }
  void setSubtitleSize(double? v) { subtitleSize = v; }
  void setSubtitleColor(Color? v) { subtitleColor = v; }
  void setSubtitleWeight(FontWeight? v) { subtitleWeight = v; }

  String? iconType; // enum WTDashboardActionCardIconType
  String? iconValue;
  IconData? iconData;
  double? iconSize;
  Color? iconColor;
  Color? iconBackgroundColor;
  Color? iconBorderColor;
  void setIconType(String? v) { iconType = v; }
  void setIconValue(String? v) { iconValue = v; }
  void setIconData(IconData? v) { iconData = v; }
  void setIconSize(double? v) { iconSize = v; }
  void setIconColor(Color? v) { iconColor = v; }
  void setIconBackgroundColor(Color? v) { iconBackgroundColor = v; }
  void setIconBorderColor(Color? v) { iconBorderColor = v; }

  String? decorationIconType; // enum WTDashboardActionCardIconType
  String? decorationIconValue;
  IconData? decorationIconData;
  double? decorationIconSize;
  Color? decorationIconColor;
  Color? decorationIconBackgroundColor;
  Color? decorationIconBorderColor;
  void setDecorationIconType(String? v) { decorationIconType = v; }
  void setDecorationIconValue(String? v) { decorationIconValue = v; }
  void setDecorationIconData(IconData? v) { decorationIconData = v; }
  void setDecorationIconSize(double? v) { decorationIconSize = v; }
  void setDecorationIconColor(Color? v) { decorationIconColor = v; }
  void setDecorationIconBackgroundColor(Color? v) { decorationIconBackgroundColor = v; }
  void setDecorationIconBorderColor(Color? v) { decorationIconBorderColor = v; }

}