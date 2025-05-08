import 'package:flutter/material.dart';

abstract class WTFlyChooser {

  UniqueKey? getUniqueKey() { return UniqueKey(); }

  BuildContext? buildContext;
  void setBuildContext(BuildContext? v) { buildContext = v; }

  Future? build();

  bool? isExpanded = false;
  void expanded(bool? v) { isExpanded = v; }

  Color? backgroundColor;
  void setBackgroundColor(Color? v) { backgroundColor = v; }

  String? googleFonts;
  void setGoogleFonts(String? v) { googleFonts = v; }

  double? width, height;
  void setWidth(double? v) { width = v; }
  void setHeight(double? v) { height = v; }

  EdgeInsets? padding, margin;
  void setPadding({
    Map<String, dynamic>? map,
    EdgeInsets? edgeInsets,
    double? left = 0.0,
    double? top = 0.0,
    double? right = 0.0,
    double? bottom = 0.0
  }) {
    if(map != null && map.isNotEmpty) { padding = EdgeInsets.fromLTRB(map['left'], map['top'], map['right'], map['bottom']); }
    else if(edgeInsets != null) { padding = edgeInsets; }
    else { padding = EdgeInsets.fromLTRB(left!, top!, right!, bottom!); }
  }
  void setMargin({
    Map<String, dynamic>? map,
    EdgeInsets? edgeInsets,
    double? left = 0.0,
    double? top = 0.0,
    double? right = 0.0,
    double? bottom = 0.0
  }) {
    if(map != null && map.isNotEmpty) { margin = EdgeInsets.fromLTRB(map['left'], map['top'], map['right'], map['bottom']); }
    else if(edgeInsets != null) { margin = edgeInsets; }
    else { margin = EdgeInsets.fromLTRB(left!, top!, right!, bottom!); }
  }

  VoidCallback? linkAction;
  IconData? linkIcon;
  String? linkLabel;
  double? linkLabelSize, linkIconSize;
  Color? linkLabelColor, linkIconColor;
  void setLinkAction(VoidCallback? v) { linkAction = v; }
  void setLinkIcon(IconData? v) { linkIcon = v; }
  void setLinkIconSize(double? v) { linkIconSize = v; }
  void setLinkIconColor(Color? v) { linkIconColor = v; }
  void setLinkLabel(String? v) { linkLabel = v; }
  void setLinkLabelSize(double? v) { linkLabelSize = v; }
  void setLinkLabelColor(Color? v) { linkLabelColor = v; }

  List<Widget>? components = List<Widget>.empty(growable: true);
  void addComponent(Widget? v) { components!.add(v!); }
  void addComponents(List<Widget>? v) { components!.addAll(v!); }

}