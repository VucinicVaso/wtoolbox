import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_fonts.dart';

abstract class WTComponent {

  UniqueKey? getUniqueKey() { return UniqueKey(); }

  BuildContext? buildContext;
  void setBuildContext(BuildContext? v) { buildContext = v; }

  Alignment? alignment;
  void setAlignment(Alignment? v) { alignment = v; }

  String? googleFonts;
  void setGoogleFonts(String? v) { if(v != null) { googleFonts = v; } }

  TextStyle? textStyle({ Color? textColor, double? fontSize, FontWeight? fontWeight = FontWeight.normal }) {
    if(googleFonts != null || googleFonts == '') {
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

  double? width, height;
  void setWidth(double? v) { width = v; }
  void setHeight(double? v) { height = v; }

  MainAxisAlignment? mainAxisAlignment;
  CrossAxisAlignment? crossAxisAlignment;
  void setMainAxisAlignment(MainAxisAlignment? v) { mainAxisAlignment = v; }
  void setCrossAxisAlignment(CrossAxisAlignment? v) { crossAxisAlignment = v; }

  Color? backgroundColor, borderColor, shadeColor;
  void setBackgroundColor(Color? v) { backgroundColor = v; }
  void setBorderColor(Color? v) { borderColor = v; }
  void setShadeColor(Color? v) { shadeColor = v; }

  EdgeInsets? padding, margin;
  void setPadding({
    Map<String, dynamic>? map,
    EdgeInsets? edgeInsets,
    double? left   = 0.0,
    double? top    = 0.0,
    double? right  = 0.0,
    double? bottom = 0.0
  }) {
    if(map != null && map.isNotEmpty) { 
      padding = EdgeInsets.fromLTRB(map['left'], map['top'], map['right'], map['bottom']); 
    }
    else if(edgeInsets != null) { 
      padding = edgeInsets; 
    }
    else { 
      padding = EdgeInsets.fromLTRB(left!, top!, right!, bottom!); 
    }
  }
  void setMargin({
    Map<String, dynamic>? map,
    EdgeInsets? edgeInsets,
    double? left   = 0.0,
    double? top    = 0.0,
    double? right  = 0.0,
    double? bottom = 0.0
  }) {
    if(map != null && map.isNotEmpty) {
      margin = EdgeInsets.fromLTRB(map['left'], map['top'], map['right'], map['bottom']);
    }
    else if(edgeInsets != null) {
      margin = edgeInsets;
    }
    else {
      margin = EdgeInsets.fromLTRB(left!, top!, right!, bottom!);
    }
  }

  EdgeInsets? innerPadding, innerMargin;
  void setInnerPadding({
    Map<String, dynamic>? map,
    EdgeInsets? edgeInsets,
    double? left   = 0.0,
    double? top    = 0.0,
    double? right  = 0.0,
    double? bottom = 0.0
  }) {
    if(map != null && map.isNotEmpty) { 
      innerPadding = EdgeInsets.fromLTRB(map['left'], map['top'], map['right'], map['bottom']); 
    }
    else if(edgeInsets != null) { 
      innerPadding = edgeInsets; 
    }
    else { 
      innerPadding = EdgeInsets.fromLTRB(left!, top!, right!, bottom!); 
    }
  }
  void setInnerMargin({
    Map<String, dynamic>? map,
    EdgeInsets? edgeInsets,
    double? left   = 0.0,
    double? top    = 0.0,
    double? right  = 0.0,
    double? bottom = 0.0
  }) {
    if(map != null && map.isNotEmpty) {
      innerMargin = EdgeInsets.fromLTRB(map['left'], map['top'], map['right'], map['bottom']); 
    }
    else if(edgeInsets != null) {
      innerMargin = edgeInsets; 
    }
    else { 
      innerMargin = EdgeInsets.fromLTRB(left!, top!, right!, bottom!); 
    }
  }

  Widget? build();

}