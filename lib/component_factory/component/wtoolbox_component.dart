import 'package:flutter/material.dart';

abstract class WTComponent {

  UniqueKey? getUniqueKey() { return UniqueKey(); }

  BuildContext? buildContext;
  void setBuildContext(BuildContext? v) { buildContext = v; }

  double? width, height;
  void setWidth(double? v) { width = v; }
  void setHeight(double? v) { height = v; }

  Alignment? alignment;
  void setAlignment(Alignment? v) { alignment = v; }

  MainAxisAlignment? mainAxisAlignment;
  CrossAxisAlignment? crossAxisAlignment;
  void setMainAxisAlignment(MainAxisAlignment? v) { mainAxisAlignment = v; }
  void setCrossAxisAlignment(CrossAxisAlignment? v) { crossAxisAlignment = v; }

  EdgeInsets? padding, margin;
  void setPadding({ double? left = 0.0, double? top = 0.0, double? right = 0.0, double? bottom = 0.0 }) {
    padding = EdgeInsets.fromLTRB(left!, top!, right!, bottom!);
  }
  void setMargin({ double? left = 0.0, double? top = 0.0, double? right = 0.0, double? bottom = 0.0 }) {
    margin = EdgeInsets.fromLTRB(left!, top!, right!, bottom!);
  }

  Color? backgroundColor, borderColor, shadeColor;
  void setBackgroundColor(Color? v) { backgroundColor = v; }
  void setBorderColor(Color? v) { borderColor = v; }
  void setShadeColor(Color? v) { shadeColor = v; }

  Widget? build();

}