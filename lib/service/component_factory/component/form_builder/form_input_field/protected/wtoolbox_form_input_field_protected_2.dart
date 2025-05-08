import 'package:flutter/material.dart';
import '../wtoolbox_form_input_field.dart';
import '../wtoolbox_form_input_field_builder.dart';
import '../../../wtoolbox_component_builder.dart';

class WTFormInputFieldProtected2 extends WTFormInputField with WTFormInputFieldBuilder {

  @override
  Widget? build() {
    return ProtectedTextInputField(
      key:                  getUniqueKey(),
      focusNode:            focusNode,
      secondaryFocusNode:   secondaryFocusNode,
      padding:              padding,
      margin:               margin,
      isEnabled:            isEnabled,
      textInputType:        textInputType,
      textAlign:            textAlign,
      autoValidateMode:     autoValidateMode,
      validator:            validator,
      controller:           controller,
      backgroundColor:      backgroundColor,
      borderColor:          borderColor,
      inputTextSize:        inputTextSize,
      inputTextColor:       inputTextColor,
      label:                label,
      labelSize:            labelSize,
      labelColor:           labelColor,
      hintLabel:            hintLabel,
      hintLabelSize:        hintLabelSize,
      hintLabelColor:       hintLabelColor,
      border:               getBorder(),
      enabledBorder:        getBorder(),
      focusedBorder:        getFocusedBorder(),
      focusedErrorBorder:   getErrorBorder(),
      errorBorder:          getBorder(),
      errorTextSize:        errorTextSize,
      errorTextColor:       errorTextColor,
      prefix:               prefix,
      prefixSize:           prefixSize,
      prefixColor:          prefixColor,
      prefixAction:         prefixAction,
      suffix:               suffix,
      suffixColor:          suffixColor,
      suffixSize:           suffixSize,
      suffixAction:         suffixAction,
      createInputFieldIcon: createInputFieldIcon,
      textStyle:            textStyle,
    );
  }

}

// ignore: must_be_immutable
class ProtectedTextInputField extends StatefulWidget {

  FocusNode? focusNode, secondaryFocusNode;
  AutovalidateMode? autoValidateMode;
  bool? isEnabled;
  TextAlign? textAlign;
  TextEditingController? controller;
  EdgeInsets? padding, margin;
  String? label, hintLabel;
  IconData? prefix, suffix;
  TextInputType? textInputType;
  InputBorder? border, enabledBorder, focusedBorder, focusedErrorBorder, errorBorder;
  double? inputTextSize, errorTextSize, labelSize, hintLabelSize, prefixSize, suffixSize;
  Color? backgroundColor, borderColor, inputTextColor, errorTextColor, labelColor, hintLabelColor, prefixColor, suffixColor;
  Function? validator, prefixAction, suffixAction, textStyle, createInputFieldIcon;

  ProtectedTextInputField({
    super.key,
    this.focusNode,
    this.secondaryFocusNode,
    this.autoValidateMode,
    this.padding,
    this.margin,
    this.isEnabled,
    this.textInputType,
    this.controller,
    this.backgroundColor,
    this.borderColor,
    this.textAlign,
    this.label,
    this.labelSize,
    this.labelColor,
    this.hintLabel,
    this.hintLabelSize,
    this.hintLabelColor,
    this.validator,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.errorTextSize,
    this.errorTextColor,
    this.errorBorder,
    this.inputTextSize,
    this.inputTextColor,
    this.prefix,
    this.prefixSize,
    this.prefixColor,
    this.prefixAction,
    this.suffix,
    this.suffixSize,
    this.suffixColor,
    this.suffixAction,
    this.textStyle,
    this.createInputFieldIcon,
  });

  @override
  State<ProtectedTextInputField> createState() => ProtectedTextInputFieldState();

}

class ProtectedTextInputFieldState extends State<ProtectedTextInputField> with WTFormInputFieldBuilder {

  @override
  void initState() {
    super.initState();
  }

  bool? isTextHidden = true;
  void setIsTextHidden() { setState(() { isTextHidden = isTextHidden == true ? false : true; }); }

  Widget? createLabelWidget() {
    if(widget.label == null) { return WTComponentBuilder.emptyComponent()!; }

    String label = widget.label!.length > 10 ? '${widget.label!.substring(0, 10)}...' : widget.label!;

    return createLabelContainer(
      label: label,
      labelColor: widget.labelColor,
      fontSize: widget.labelSize,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 7.5, 0.0),
    );
  }

  Widget? createHintLabelWidget() {
    if(widget.hintLabel == null) { return WTComponentBuilder.emptyComponent()!; }

    return createLabelContainer(
      fontWeight: FontWeight.normal,
      label: widget.hintLabel,
      labelColor: widget.hintLabelColor,
      fontSize: widget.hintLabelSize,
      margin: const EdgeInsets.fromLTRB(0.0, 7.5, 0.0, 0.0),
    );
  }

  Widget? createPrefixWidget() {
    if(widget.prefix == null) { return WTComponentBuilder.emptyComponent()!; }

    return Container(
      height: widget.prefixSize,
      width: widget.prefixSize,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 7.5, 0.0),
      child: createInputFieldIcon(
        icon: widget.prefix,
        action: widget.prefixAction,
        color: widget.labelColor,
        size: widget.prefixSize,
      ),
    );
  }

  Widget? createSuffixWidget() {
    if(widget.suffix == null) { return WTComponentBuilder.emptyComponent()!; }

    return Container(
      height: widget.suffixSize,
      width: widget.suffixSize,
      margin: const EdgeInsets.fromLTRB(7.5, 0.0, 0.0, 0.0),
      child: createInputFieldIcon(
        icon: widget.suffix,
        action: widget.suffixAction,
        color: widget.suffixColor,
        size: widget.suffixSize,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: widget.key,
      builder: (context, constraints) {
        double width         = constraints.maxWidth;
        widget.padding       = widget.padding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        widget.margin        = widget.margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        widget.labelSize     = width * 0.0425;
        widget.prefixSize    = width * 0.0475;
        widget.inputTextSize = width * 0.0425;
        widget.hintLabelSize = width * 0.0425;
        widget.suffixSize    = width * 0.0475;

        return Container(
          width: width,
          padding: widget.padding,
          margin: widget.margin,
          alignment: Alignment.centerLeft,
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /// label, prefix, input field, suffix
              Container(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                decoration: createContainerDecoration(
                  backgroundColor: widget.backgroundColor,
                  borderColor: widget.borderColor
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                        margin: const EdgeInsets.all(0.0),
                        decoration: createContainerDecoration(
                          backgroundColor: widget.backgroundColor,
                          borderColor: widget.borderColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            /// label
                            createLabelWidget()!,

                            /// prefix
                            createPrefixWidget()!,

                            /// input field
                            Expanded(
                              child: TextFormField(
                                focusNode: widget.focusNode,
                                onFieldSubmitted: (_) {
                                  if(widget.secondaryFocusNode != null) {
                                    FocusScope.of(context).requestFocus(widget.secondaryFocusNode);
                                  }
                                },
                                enabled: widget.isEnabled,
                                obscureText: isTextHidden!,
                                controller: widget.controller,
                                textAlign: widget.textAlign!,
                                autovalidateMode: widget.autoValidateMode,
                                style: TextStyle(
                                  color: widget.inputTextColor,
                                  fontSize: widget.inputTextSize,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                  border: widget.border,
                                  enabledBorder: widget.enabledBorder,
                                  focusedBorder: widget.focusedBorder,
                                  focusColor: Colors.blue.shade300,
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: widget.errorTextColor!, width: 0.5),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: widget.errorTextColor!, width: 0.5),
                                  ),
                                  errorStyle: TextStyle(
                                    fontSize: widget.errorTextSize,
                                    color: widget.errorTextColor,
                                  ),
                                ),
                                keyboardType: widget.textInputType,
                                validator: (v) => widget.validator != null ? widget.validator!(v) : null,
                              ),
                            ),

                            /// suffix
                            createSuffixWidget()!,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// hintLabel
              createHintLabelWidget()!,
            ],
          ),
        );
      });
  }

}