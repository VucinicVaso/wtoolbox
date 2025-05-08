import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTKeyboard extends WTComponent {

  Function? primaryAction, secondaryAction;
  void setPrimaryAction(Function? v) { primaryAction = v; }
  void setSecondaryAction(Function? v) { secondaryAction = v; }

  Color? labelColor, labelBorderColor, labelBackgroundColor;
  void setLabelColor(Color? v) { labelColor = v; }
  void setLabelBorderColor(Color? v) { labelBorderColor = v; }
  void setLabelBackgroundColor(Color? v) { labelBackgroundColor = v; }

  double? buttonSize, buttonLabelSize;
  Color? buttonLabelColor, buttonBorderColor, buttonBackgroundColor;
  void setButtonSize(double? v) { buttonSize = v; }
  void setButtonLabelSize(double? v) { buttonLabelSize = v; }
  void setButtonLabelColor(Color? v) { buttonLabelColor = v; }
  void setButtonBorderColor(Color? v) { buttonBorderColor = v; }
  void setButtonBackgroundColor(Color? v) { buttonBackgroundColor = v; }

}