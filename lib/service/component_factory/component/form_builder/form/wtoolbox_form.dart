import 'package:flutter/material.dart';
import '../../wtoolbox_component.dart';
import 'bmp_field.dart';
import '../form_input_field/wtoolbox_form_input_field.dart';

abstract class WTForm extends WTComponent {

  Key? formKey;
  void setFormKey(Key? v) { formKey = v; }

  ScrollController? scrollController;
  void setScrollController() { scrollController = ScrollController(); }

  AutovalidateMode? autoValidateMode;
  void setAutoValidation(AutovalidateMode? v) { autoValidateMode = v; }
  void autoValidateAlways() { autoValidateMode = AutovalidateMode.always; }
  void autoValidateDisabled() { autoValidateMode = AutovalidateMode.disabled; }
  void autoValidateOnUserInteraction() { autoValidateMode = AutovalidateMode.onUserInteraction; }

  Map<String, BmpField>? fields = <String, BmpField>{};
  void addField({ String? key, int? order, WTFormInputField? inputField, WTComponent? component }) {
    BmpField field = BmpField()
      ..setKey(key)
      ..setOrder(order)
      ..setFocusNode()
      ..showField();
    if(inputField != null) { field.setInputField(inputField); }
    if(component != null) { field.setComponent(component); }
    fields![key!] = field;
  }
  void addFields(List<BmpField> list) {
    for (var field in list) { fields![field.key!] = field; }
  }
  void removeField(String key) {
    fields!.remove(key);
  }
  BmpField? getField(String key) {
    return fields![key];
  }

  bool? fieldsVisibility = false;
  List<String>? hiddenFields = List<String>.empty(growable: true);
  void toggleFieldsVisibility(List<String>? list) {
    fieldsVisibility = true;
    hiddenFields!.addAll(list!);
  }

  String? lessFieldsButtonLabel, moreFieldsButtonLabel;
  Color? lessFieldsButtonLabelColor, lessFieldsButtonBackgroundColor, moreFieldsButtonLabelColor, moreFieldsButtonBackgroundColor;
  double? lessFieldsButtonLabelSize, moreFieldsButtonLabelSize;
  void setLessFieldsButtonLabel(String? v) { lessFieldsButtonLabel = v; }
  void setLessFieldsButtonLabelSize(double? v) { lessFieldsButtonLabelSize = v; }
  void setLessFieldsButtonLabelColor(Color? v) { lessFieldsButtonLabelColor = v; }
  void setLessFieldsButtonBackgroundColor(Color? v) { lessFieldsButtonBackgroundColor = v; }
  void setMoreFieldsButtonLabel(String? v) { moreFieldsButtonLabel = v; }
  void setMoreFieldsButtonLabelSize(double? v) { moreFieldsButtonLabelSize = v; }
  void setMoreFieldsButtonLabelColor(Color? v) { moreFieldsButtonLabelColor = v; }
  void setMoreFieldsButtonBackgroundColor(Color? v) { moreFieldsButtonBackgroundColor = v; }

  List<Widget>? inputFields = List<Widget>.empty(growable: true);
  void addInputField(Widget? v) { inputFields!.add(v!); }
  void addInputFields(List<Widget>? v) { inputFields!.addAll(v!); }

}