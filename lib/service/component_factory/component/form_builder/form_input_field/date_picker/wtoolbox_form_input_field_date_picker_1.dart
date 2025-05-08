import 'package:flutter/material.dart';
import '../../../../../../3rd_party/lib_intl.dart';
import '../wtoolbox_form_input_field.dart';
import '../wtoolbox_form_input_field_builder.dart';
import '../../../wtoolbox_component_builder.dart';

class WTFormInputFieldDatePicker1 extends WTFormInputField with WTFormInputFieldBuilder {

  @override
  Widget? build() {
    return DatePickerInputField(
      key:                getUniqueKey(),
      buildContext:       buildContext,
      focusNode:          focusNode,
      secondaryFocusNode: secondaryFocusNode,
      controller:         controller,
      padding:            padding,
      margin:             margin,
      backgroundColor:    backgroundColor,
      borderColor:        borderColor,
      border:             getBorder(),
      focusedBorder:      getFocusedBorder(),
      isEnabled:          isEnabled,
      inputTextColor:     inputTextColor,
      inputTextSize:      inputTextSize,
      label:              label,
      labelSize:          labelSize,
      labelColor:         labelColor,
      hintLabel:          hintLabel,
      hintLabelSize:      hintLabelSize,
      hintLabelColor:     hintLabelColor,
      prefix:             prefix,
      prefixSize:         prefixSize,
      prefixColor:        prefixColor,
    );
  }

}

// ignore: must_be_immutable
class DatePickerInputField extends StatefulWidget {

  FocusNode? focusNode, secondaryFocusNode;
  BuildContext? buildContext;
  TextEditingController? controller;
  Color? backgroundColor, borderColor, inputTextColor, labelColor, hintLabelColor, prefixColor;
  double? inputTextSize, labelSize, hintLabelSize, prefixSize;
  EdgeInsets? padding, margin;
  bool? isEnabled;
  IconData? prefix;
  String? label, hintLabel;
  InputBorder? border, focusedBorder;

  DatePickerInputField({
    super.key,
    this.buildContext,
    this.focusNode,
    this.secondaryFocusNode,
    this.controller,
    this.padding,
    this.margin,
    this.isEnabled,
    this.backgroundColor,
    this.borderColor,
    this.border,
    this.focusedBorder,
    this.inputTextSize,
    this.inputTextColor,
    this.label,
    this.labelSize,
    this.labelColor,
    this.hintLabel,
    this.hintLabelSize,
    this.hintLabelColor,
    this.prefix,
    this.prefixSize,
    this.prefixColor,
  });

  @override
  State<DatePickerInputField> createState() => DatePickerInputFieldState();
}

class DatePickerInputFieldState extends State<DatePickerInputField> with WTFormInputFieldBuilder {

  @override
  void initState() {
    super.initState();
  }

  Future<void>? createDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      cancelText:       'CANCEL',
      confirmText:      'SELECT',
      fieldHintText:    '',
      fieldLabelText:   '',
      errorFormatText:  '',
      errorInvalidText: '',
      context:          widget.buildContext!,
      initialDate:      widget.controller!.text != '' ? DateFormat('dd-MM-yyyy').parse(widget.controller!.text) : DateTime.now(),
      firstDate:        DateTime(1930, 1),
      lastDate:         DateTime(2101)
    );

    if(pickedDate != null) {
      String dDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() { widget.controller!.text = dDate; });
    }
  }

  Widget? createPrefixWidget() {
    if(widget.prefix == null) { return WTComponentBuilder.emptyComponent()!; }

    return Container(
      height: widget.prefixSize,
      width: widget.prefixSize,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 7.5, 0.0),
      child: Icon(
        widget.prefix,
        color: widget.prefixColor,
        size: widget.prefixSize,
      ),
    );
  }

  Widget? createLabelWidget() {
    if(widget.label == null) { return WTComponentBuilder.emptyComponent(); }

    return createLabelContainer(
      label: widget.label,
      labelColor: widget.labelColor,
      fontSize: widget.labelSize,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 7.5),
    )!;
  }

  Widget? createHintLabelWidget() {
    if(widget.hintLabel == null) { return WTComponentBuilder.emptyComponent(); }

    return createLabelContainer(
      fontWeight: FontWeight.normal,
      label: widget.hintLabel,
      fontSize: widget.hintLabelSize,
      labelColor: widget.hintLabelColor,
      margin: const EdgeInsets.fromLTRB(0.0, 7.5, 0.0, 0.0),
    )!;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: widget.key,
      builder: (context, constraints) {
        double? width        = constraints.maxWidth;
        widget.padding       = widget.padding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        widget.margin        = widget.margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        widget.labelSize     = width * 0.04;
        widget.hintLabelSize = width * 0.035;
        widget.prefixSize    = width * 0.045;
        widget.inputTextSize = width * 0.045;

        return Container(
          key: widget.key,
          padding: widget.padding,
          margin: widget.margin,
          alignment: Alignment.centerLeft,
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// label
              createLabelWidget()!,

              /// prefix, input-field, suffix
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                color: Colors.transparent,
                child: TextFormField(
                  focusNode: widget.focusNode,
                  onFieldSubmitted: (_) {
                    if(widget.secondaryFocusNode != null) {
                      FocusScope.of(context).requestFocus(widget.secondaryFocusNode);
                    }
                  },
                  enabled: widget.isEnabled,
                  controller: widget.controller,
                  obscureText: false,
                  readOnly: true,
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.top,
                  style: TextStyle(color: widget.inputTextColor, fontSize: widget.inputTextSize),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: widget.backgroundColor,
                    contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    border: widget.border,
                    enabledBorder: widget.border,
                    focusedBorder: widget.focusedBorder,
                    prefix: createPrefixWidget()!,
                  ),
                  onTap: () async => await createDatePicker(),
                ),
              ),

              /// hintLabel
              createHintLabelWidget()!,
            ],
          ),
        );
      }
    );
  }

}