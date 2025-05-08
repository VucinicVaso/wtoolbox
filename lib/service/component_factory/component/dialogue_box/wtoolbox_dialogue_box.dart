import 'package:flutter/material.dart';

abstract class WTDialogueBox {

  VoidCallback? close;
  void setCloseAction(VoidCallback? v) { close = v; }

  BuildContext? buildContext;
  void setBuildContext(BuildContext? v) { buildContext = v; }

  Duration? duration = const Duration(seconds: 5);
  void setDuration(Duration? v) { duration = v; }

  double? width, height;
  void setWidth(double? v) { width = v; }
  void setHeight(double? v) { height = v; }

  Map<String, dynamic>? warningColors = <String, dynamic>{};
  void setWarningColors(Map<String, dynamic>? v) { warningColors = v; }
  void basic() {
    backgroundColor = warningColors!['basic']['backgroundColor'];
    borderColor     = warningColors!['basic']['borderColor'];
    labelColor      = warningColors!['basic']['labelColor'];
  }
  void info() {
    backgroundColor = warningColors!['info']['backgroundColor'];
    borderColor     = warningColors!['info']['borderColor'];
    labelColor      = warningColors!['info']['labelColor'];
  }
  void success() {
    backgroundColor = warningColors!['success']['backgroundColor'];
    borderColor     = warningColors!['success']['borderColor'];
    labelColor      = warningColors!['success']['labelColor'];
  }
  void danger() {
    backgroundColor = warningColors!['danger']['backgroundColor'];
    borderColor     = warningColors!['danger']['borderColor'];
    labelColor      = warningColors!['danger']['labelColor'];
  }
  void warning() {
    backgroundColor = warningColors!['warning']['backgroundColor'];
    borderColor     = warningColors!['warning']['borderColor'];
    labelColor      = warningColors!['warning']['labelColor'];
  }

  Color? backgroundColor, borderColor;
  void setBackgroundColor(Color? v) { backgroundColor = v; }
  void setBorderColor(Color? v) { borderColor = v; }

  IconData? icon;
  double? iconSize;
  Color? iconColor, iconBackgroundColor;
  void setIcon(IconData? v) { icon = v; }
  void setIconSize(double? v) { iconSize = v; }
  void setIconColor(Color? v) { iconColor = v; }
  void setIconBackgroundColor(Color? v) { iconBackgroundColor = v; }

  String? title, label, description;
  Color? titleColor, labelColor, descriptionColor;
  double? titleSize, labelSize, descriptionSize;
  void setTitle(String? v) { title = v; }
  void setTitleColor(Color? v) { titleColor = v; }
  void setTitleSize(double? v) { titleSize = v; }
  void setLabel(String? v) { label = v; }
  void setLabelColor(Color? v) { labelColor = v; }
  void setLabelSize(double? v) { titleSize = v; }
  void setDescription(String? v) { description = v; }
  void setDescriptionColor(Color? v) { descriptionColor = v; }
  void setDescriptionSize(double? v) { descriptionSize = v; }

  String? saveButtonLabel, cancelButtonLabel;
  VoidCallback? saveButtonAction, cancelButtonAction;
  double? saveButtonLabelSize, cancelButtonLabelSize;
  Color? saveButtonLabelColor, saveButtonBackgroundColor, cancelButtonLabelColor, cancelButtonBackgroundColor;
  void setSaveButtonLabel(String? v) { saveButtonLabel = v; }
  void setSaveButtonAction(VoidCallback? v) { saveButtonAction = v; }
  void setSaveButtonLabelSize(double? v) { saveButtonLabelSize = v; }
  void setSaveButtonLabelColor(Color? v) { saveButtonLabelColor = v; }
  void setSaveButtonBackgroundColor(Color? v) { saveButtonBackgroundColor = v; }
  void setCancelButtonLabel(String? v) { cancelButtonLabel = v; }
  void setCancelButtonAction(VoidCallback? v) { cancelButtonAction = v; }
  void setCancelButtonLabelSize(double? v) { cancelButtonLabelSize = v; }
  void setCancelButtonLabelColor(Color? v) { cancelButtonLabelColor = v; }
  void setCancelButtonBackgroundColor(Color? v) { cancelButtonBackgroundColor = v; }

  Future? build();

}