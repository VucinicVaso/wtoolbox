import 'package:flutter/material.dart';
import '../../wtoolbox_component.dart';
import '../form_input_field/wtoolbox_form_input_field.dart';

class BmpField {

  String? key;
  void setKey(String? v) { key = v; }

  int? order;
  void setOrder(int? v) { order = v; }

  bool? show = true;
  void hideField() { show = false; }
  void showField() { show = true; }

  FocusNode? focusNode;
  void setFocusNode() { focusNode = FocusNode(); }

  WTComponent? component;
  void setComponent(WTComponent? v) { component = v; }
  WTFormInputField? inputField;
  void setInputField(WTFormInputField? v) { inputField = v; }

  Widget? build() {
    if(inputField != null) { return inputField!.build(); }
    if(component != null) { return component!.build(); }
    return const SizedBox.shrink();
  }

}