import 'package:flutter/material.dart';
import '../wtoolbox_form.dart';

class WTFormBasic1 extends WTForm {
  @override
  Widget? build() {
    return FormStatefulWidget(
      key: getUniqueKey(),
      width: width,
      formKey: formKey!,
      autoValidateMode: autoValidateMode,
      backgroundColor: backgroundColor,
      padding: padding,
      margin: margin,
      alignment: alignment,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      inputFields: inputFields,
    );
  }
}

// ignore: must_be_immutable
class FormStatefulWidget extends StatefulWidget {

  Key? formKey;
  AutovalidateMode? autoValidateMode;
  Color? backgroundColor;
  EdgeInsets? padding, margin;
  Alignment? alignment;
  MainAxisAlignment? mainAxisAlignment;
  CrossAxisAlignment? crossAxisAlignment;
  List<Widget>? inputFields;
  double? width;

  FormStatefulWidget({
    super.key,
    this.width,
    this.formKey,
    this.autoValidateMode,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.alignment,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.inputFields,
  });

  @override
  State<FormStatefulWidget> createState() => FormStatefulWidgetState();
}

class FormStatefulWidgetState extends State<FormStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey!,
      autovalidateMode: widget.autoValidateMode,
      child: Container(
        width: widget.width,
        color: widget.backgroundColor,
        padding: widget.padding,
        margin: widget.margin,
        alignment: widget.alignment,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: widget.mainAxisAlignment!,
          crossAxisAlignment: widget.crossAxisAlignment!,
          children: <Widget>[
            ...widget.inputFields!,
          ],
        ),
      ),
    );
  }
}
