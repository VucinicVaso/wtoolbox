import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTDatePicker extends WTComponent {

  Color? buttonColor;
  void setButtonColor(Color? v) { buttonColor = v; }

  DateTime? minDate = DateTime(1925, 1), maxDate = DateTime(2101);
  void setMinDate(DateTime? v) { minDate = v; }
  void setMaxDate(DateTime? v) { maxDate = v; }

  TextEditingController? controller;
  void setController(TextEditingController? v) { controller = v; }

  Function? dateSelectedAction;
  void onDateSelectedAction(Function? v) { dateSelectedAction = v; }

}