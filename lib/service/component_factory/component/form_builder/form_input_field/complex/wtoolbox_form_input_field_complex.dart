import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_material_symbols.dart';
import '../wtoolbox_form_input_field.dart';
import '../wtoolbox_form_input_field_builder.dart';
import '../../../wtoolbox_component_builder.dart';

class WTFormInputFieldComplex extends WTFormInputField with WTFormInputFieldBuilder {

  @override
  Widget? build() {
    return ComplexInputField(
      key:                   getUniqueKey(),
      focusNode:             focusNode,
      secondaryFocusNode:    secondaryFocusNode,
      padding:               padding,
      margin:                margin,
      backgroundColor:       backgroundColor,
      borderColor:           borderColor,
      inputTextColor:        inputTextColor,
      inputTextSize:         inputTextSize,
      suffixSize:            suffixSize,
      buttonColor:           buttonColor,
      buttonBackgroundColor: buttonBackgroundColor,
      border:                getBorder(),
      enabledBorder:         getBorder(),
      focusedBorder:         getFocusedBorder(),
      focusedErrorBorder:    getErrorBorder(),
      errorBorder:           getBorder(),
      textAlign:             textAlign,
      textInputType:         textInputType,
      controller:            controller,
      label:                 label,
      labelColor:            labelColor,
      hintLabel:             hintLabel,
      hintLabelColor:        hintLabelColor,
      errorTextColor:        errorTextColor,
      validator:             validator,
      takeCameraImage:       takeCameraImage,
      onCameraImageTaken:    onCameraImageTaken,
      selectFilesAction:     selectFilesAction,
      onFilesSelectedAction: onFilesSelectedAction,
      submitAction:          submitAction,
    );
  }

}

// ignore: must_be_immutable
class ComplexInputField extends StatefulWidget {

  FocusNode? focusNode, secondaryFocusNode;
  AutovalidateMode? autoValidateMode;
  EdgeInsets? padding, margin;
  Color? backgroundColor, borderColor, inputTextColor, labelColor, hintLabelColor, buttonColor, buttonBackgroundColor, errorTextColor;
  double? inputTextSize, suffixSize;
  InputBorder? border, enabledBorder, focusedBorder, focusedErrorBorder, errorBorder;
  TextAlign? textAlign;
  TextInputType? textInputType;
  TextEditingController? controller;
  String? label, hintLabel;
  Function? validator, takeCameraImage, onCameraImageTaken, selectFilesAction, onFilesSelectedAction, submitAction;

  ComplexInputField({
    super.key,
    this.focusNode,
    this.secondaryFocusNode,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.inputTextColor,
    this.inputTextSize,
    this.suffixSize,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.errorBorder,
    this.textAlign,
    this.textInputType,
    this.controller,
    this.buttonColor,
    this.buttonBackgroundColor,
    this.label,
    this.labelColor,
    this.hintLabel,
    this.hintLabelColor,
    this.errorTextColor,
    this.autoValidateMode,
    this.validator,
    this.takeCameraImage,
    this.onCameraImageTaken,
    this.selectFilesAction,
    this.onFilesSelectedAction,
    this.submitAction,
  });

  @override
  State<ComplexInputField> createState() => ComplexInputFieldState();

}

class ComplexInputFieldState extends State<ComplexInputField> with WTFormInputFieldBuilder {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    submitting = false;
    files!.clear();
    super.dispose();
  }

  bool? submitting = false;
  void isSubmitting(bool? value) { setState(() { submitting = value; }); }

  List<Map>? files = List<Map>.empty(growable: true);
  Future<void> selectFiles() async {
    isSubmitting(true);
    List<Map>? selectedFiles = await widget.selectFilesAction!();
    if(selectedFiles!.isNotEmpty) {
      for(var f in selectedFiles) { files!.add(f); }
      isSubmitting(false);
    }else {
      isSubmitting(false);
    }
  }
  Future<void> takeCameraImage() async {
    isSubmitting(true);
    Map? xFile = await widget.takeCameraImage!();
    if(xFile != null) {
      files!.add(xFile);
      isSubmitting(false);
    }else {
      isSubmitting(false);
    }
  }

  Future<void> submit() async {
    isSubmitting(true);
    await widget.onFilesSelectedAction!(files);
    files!.clear();
    isSubmitting(false);
    await widget.submitAction!();
  }

  /// label && hintLabel
  Widget? labelAndHintLabelWidget() {
    if(widget.label == null && widget.hintLabel == null) { return WTComponentBuilder.emptyComponent(); }

    Widget? labelWidget = WTComponentBuilder.emptyComponent();
    if(widget.label != null) {
      labelWidget = createLabelContainer(
        label: widget.label,
        labelColor: widget.labelColor,
        fontSize: widget.inputTextSize,
      )!;
    }

    Widget? hintLabelWidget = WTComponentBuilder.emptyComponent();
    if(widget.hintLabel != null) {
      hintLabelWidget = createLabelContainer(
        fontWeight: FontWeight.normal,
        fontSize: widget.inputTextSize,
        label: '${widget.hintLabel} (${files!.length})',
        labelColor: widget.hintLabelColor
      )!;
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          labelWidget!,     /// label
          hintLabelWidget!, /// hintLabel
        ],
      ),
    );
  }

  /// input field && upload (file/camera) buttons
  Widget? inputFieldAndButtonsWidget() {
    Widget? inputWidget = Expanded(
      child: TextFormField(
        focusNode: widget.focusNode,
        onFieldSubmitted: (_) {
          if(widget.secondaryFocusNode != null) {
            FocusScope.of(context).requestFocus(widget.secondaryFocusNode);
          }
        },
        enabled: true,
        controller: widget.controller,
        autovalidateMode: widget.autoValidateMode,
        obscureText: false,
        textAlign: widget.textAlign!,
        style: TextStyle(
          color: widget.inputTextColor,
          fontSize: widget.inputTextSize,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          border: widget.border!,
          enabledBorder: widget.border!,
          focusedBorder: widget.focusedBorder!,
          errorBorder: widget.errorBorder!,
          focusedErrorBorder: widget.errorBorder!,
          errorStyle: TextStyle(
            color: widget.errorTextColor,
          ),
        ),
        keyboardType: widget.textInputType,
        validator: (v) => widget.validator != null ? widget.validator!(v) : null,
      ),
    );

    Widget? buttonsWidget = Row(
      children: <Widget>[
        /// files action
        createInputFieldIcon(
          icon: Symbols.upload_file_rounded,
          action: () async => await selectFiles(),
          color: widget.labelColor,
          size: widget.suffixSize
        )!,
        const SizedBox(width: 15.0),

        /// camera action
        createInputFieldIcon(
          icon: Symbols.photo_camera,
          action: () async => await takeCameraImage(),
          color: widget.labelColor,
          size: widget.suffixSize
        )!,
        const SizedBox(width: 10.0),

        /// submit action
        submitting!
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(widget.buttonColor!),
              strokeWidth: 3.0,
            )
          : GestureDetector(
              onTap: () async => await submit(),
              child: Container(
                padding: const EdgeInsets.all(3.0),
                margin: const EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 3.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: widget.buttonBackgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: WTComponentBuilder.createIcon(
                    iconData: Symbols.send,
                    size: widget.suffixSize,
                    color: widget.buttonColor
                  ),
                ),
              ),
            )
      ],
    );

    return Container(
      decoration: createContainerDecoration(
        backgroundColor: widget.backgroundColor,
        borderColor: widget.borderColor
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /// input field
          inputWidget,

          /// files && camera buttons && submit action button
          buttonsWidget,
        ],
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
        widget.inputTextSize = width * 0.0425;
        widget.suffixSize    = width * 0.06;

        return Container(
          key: widget.key,
          padding: widget.padding,
          margin: widget.margin,
          alignment: Alignment.centerLeft,
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              labelAndHintLabelWidget()!,    /// label && hintLabel
              inputFieldAndButtonsWidget()!, /// input field && file/camera buttons
            ],
          ),
        );
      }
    );
  }

}