import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTSignature extends WTComponent {

  TextEditingController? textEditingController;
  void setTextEditingController(TextEditingController? v) { textEditingController = v; }

  Color? penColor;
  double? penStrokeWidth;
  void setPenColor(Color? v) { penColor = v; }
  void setPenStrokeWidth(double? v) { penStrokeWidth = v; }

  Function? doneAction;
  Color? doneButtonColor, doneButtonLabelColor;
  double? doneButtonLabelSize;
  String? doneButtonLabel;
  void setDoneAction(Function? v) { doneAction = v; }
  void setDoneButtonColor(Color? v) { doneButtonColor = v; }
  void setDoneButtonLabelColor(Color? v) { doneButtonLabelColor = v; }
  void setDoneButtonLabelSize(double? v) { doneButtonLabelSize = v; }
  void setDoneButtonLabel(String? v) { doneButtonLabel = v; }

  Function? clearAction;
  Color? clearButtonColor, clearButtonLabelColor;
  double? clearButtonLabelSize;
  String? clearButtonLabel;
  void setClearAction(Function? v) { clearAction = v; }
  void setClearButtonColor(Color? v) { clearButtonColor = v; }
  void setClearButtonLabelColor(Color? v) { clearButtonLabelColor = v; }
  void setClearButtonLabelSize(double? v) { clearButtonLabelSize = v; }
  void setClearButtonLabel(String? v) { clearButtonLabel = v; }

}