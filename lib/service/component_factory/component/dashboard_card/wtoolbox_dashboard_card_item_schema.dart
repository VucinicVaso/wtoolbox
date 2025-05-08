import 'dart:ui';

class WTDashboardCardItemSchema {

  WTDashboardCardItemSchema({
    this.dataName,
    this.dataValue,
    this.uiComponent,
    this.uiColor
  });

  Map<String, dynamic> toMap() {
    return {
      'dataName':    dataName,
      'dataValue':   dataValue,
      'uiComponent': uiComponent,
      'uiColor':     uiColor,
    };
  }

  WTDashboardCardItemSchema.fromMap(Map<dynamic, dynamic>? m) {
    dataName    = m!['dataName'];
    dataValue   = m['dataValue'];
    uiComponent = m['uiComponent'];
    uiColor     = m['uiColor'];
  }

  String? dataName;
  void setDataName(String? v) { dataName = v; }

  String? dataValue;
  void setDataValue(String? v) { dataValue = v; }

  String? uiComponent;
  void setUiComponent(String? v) { uiComponent = v; }

  Color? uiColor;
  void setUiColor(Color? v) { uiColor = v; }

}