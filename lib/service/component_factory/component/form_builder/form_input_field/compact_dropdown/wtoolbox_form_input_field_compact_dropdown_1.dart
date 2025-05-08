import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../wtoolbox_component_builder.dart';
import '../wtoolbox_form_input_field.dart';
import '../wtoolbox_form_input_field_builder.dart';

class WTFormInputFieldCompactDropdown1 extends WTFormInputField {

  InputBorder? generateBorder() {
    if(regularBorderEnabled!) {
      return UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500, width: 1.0)
      );
    }

    if(styledBorderEnabled!) {
      return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
        borderRadius: BorderRadius.circular(4.0),
      );
    }

    return const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0.0));
  }

  InputBorder? generateFocusedBorder() {
    return const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0.0));
  }

  InputBorder? generateDisabledBorder() {
    return const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0.0));
  }

  @override
  Widget? build() {
    return CompactTextInputField(
      key:                getUniqueKey(),
      buildContext:       buildContext,
      focusNode:          focusNode,
      secondaryFocusNode: secondaryFocusNode,
      width:              width,
      height:             height,
      padding:            padding,
      margin:             margin,
      getBorder:          generateBorder(),
      getFocusedBorder:   generateFocusedBorder(),
      getErrorBorder:     generateBorder(),
      getDisabledBorder:  generateDisabledBorder(),
      backgroundColor:    backgroundColor,
      borderColor:        borderColor,
      prefix:             prefix,
      prefixAction:       prefixAction,
      prefixSize:         prefixSize,
      prefixColor:        prefixColor,
      label:              label,
      labelSize:          labelSize,
      labelColor:         labelColor,
      asterixRequired:    asterixRequired,
      asterixColor:       asterixColor,
      inputTextColor:     inputTextColor,
      inputTextSize:      inputTextSize,
      errorTextColor:     errorTextColor,
      isEnabled:          isEnabled,
      textAlign:          textAlign,
      autoValidateMode:   autoValidateMode,
      textCapitalization: textCapitalization,
      textInputType:      textInputType,
      controller:         controller,
      validator:          validator,
      suffix:             suffix,
      suffixAction:       suffixAction,
      suffixSize:         suffixSize,
      suffixColor:        suffixColor,
      separatorEnabled:   separatorEnabled,
      separatorColor:     separatorColor,
      separatorSize:      separatorSize,
      items:              dropdownItems,
    );
  }

}

// ignore: must_be_immutable
class CompactTextInputField extends StatefulWidget {

  FocusNode? focusNode, secondaryFocusNode;
  BuildContext? buildContext;
  EdgeInsets? padding, margin;
  Color? backgroundColor, borderColor, prefixColor,
      labelColor, suffixColor, inputTextColor,
      errorTextColor, separatorColor, asterixColor;
  String? label;
  IconData? prefix, suffix;
  double? width, height, prefixSize, labelSize, suffixSize, inputTextSize, separatorSize;
  Function? prefixAction, suffixAction, validator;
  bool? isEnabled, separatorEnabled, asterixRequired;
  TextEditingController? controller;
  TextAlign? textAlign;
  AutovalidateMode? autoValidateMode;
  TextCapitalization? textCapitalization;
  TextInputType? textInputType;
  InputBorder? getBorder, getFocusedBorder, getErrorBorder, getDisabledBorder;
  List<Map<String, dynamic>>? items;

  CompactTextInputField({
    super.key,
    this.buildContext,
    this.focusNode,
    this.secondaryFocusNode,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.prefix,
    this.prefixAction,
    this.prefixSize,
    this.prefixColor,
    this.label,
    this.labelSize,
    this.labelColor,
    this.asterixRequired,
    this.asterixColor,
    this.inputTextColor,
    this.inputTextSize,
    this.errorTextColor,
    this.isEnabled,
    this.textAlign,
    this.autoValidateMode,
    this.textCapitalization,
    this.textInputType,
    this.getBorder,
    this.getFocusedBorder,
    this.getErrorBorder,
    this.getDisabledBorder,
    this.controller,
    this.validator,
    this.suffix,
    this.suffixAction,
    this.suffixSize,
    this.suffixColor,
    this.separatorEnabled,
    this.separatorColor,
    this.separatorSize,
    this.items,
  });

  @override
  State<CompactTextInputField> createState() => CompactTextInputFieldState();

}

class CompactTextInputFieldState extends State<CompactTextInputField> with WTFormInputFieldBuilder {

  @override
  void initState() {
    if(widget.items!.isNotEmpty) { setItems(widget.items!); }
    super.initState();
  }

  List<Map<String, dynamic>>? items = List<Map<String, dynamic>>.empty(growable: true);
  void setItem(Map<String, dynamic>? map) {
    setState(() { widget.controller!.text = jsonEncode(map); });

    if(widget.secondaryFocusNode != null) {
      FocusScope.of(context).requestFocus(widget.secondaryFocusNode);
    }
  }
  void setItems(List<Map<String, dynamic>>? list) {
    setState(() {
      items = list;
      widget.controller!.text = jsonEncode(items!.firstWhere((e) => e['selected'] == true));
    });
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
        color: widget.prefixColor,
        size: widget.prefixSize,
      ),
    );
  }

  Widget? createLabelWidget() {
    if(widget.label == null) { return WTComponentBuilder.emptyComponent()!; }

    if(widget.asterixRequired!) {
      List<InlineSpan>? textSpan = List<InlineSpan>.empty(growable: true);
      textSpan.add(
        TextSpan(
          text: widget.label!,
          style: TextStyle(
            color: widget.labelColor,
            fontWeight: FontWeight.normal,
            fontSize: widget.labelSize,
          ),
        )
      );

      textSpan.add(
        TextSpan(
          text: " *",
          style: TextStyle(
            color: widget.asterixColor,
            fontWeight: FontWeight.normal,
            fontSize: widget.labelSize! * 0.9,
          ),
        )
      );

      return Flexible(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 7.5, 0.0),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  children: textSpan
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Flexible(
      child: createLabelContainer(
        label: widget.label,
        labelColor: widget.labelColor,
        fontSize: widget.labelSize,
        fontWeight: FontWeight.normal,
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 7.5, 0.0),
      )!,
    );
  }

  Widget? createInputFieldWidget() {
    return Expanded(
      child: Container(
        alignment: Alignment.centerRight,
        child: DropdownButton<Map<String, dynamic>>(
          key: UniqueKey(),
          focusNode: widget.focusNode,
          isExpanded: true,
          dropdownColor: widget.backgroundColor,
          alignment: Alignment.centerRight,
          value: items!.firstWhere((e) => e['key'] == jsonDecode(widget.controller!.text)['key']),
          icon: Container(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            margin: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
            child: WTComponentBuilder.createIcon(
              iconData: widget.suffix,
              size: widget.suffixSize,
              color: widget.suffixColor
            ),
          ),
          onChanged: (Map<String, dynamic>? m) => setItem(m),
          underline: const SizedBox.shrink(),
          items: items!.map<DropdownMenuItem<Map<String, dynamic>>>((Map<String, dynamic>? i) =>
            DropdownMenuItem<Map<String, dynamic>>(
              value: i,
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                color: Colors.transparent,
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    i!.containsKey('image')
                      ? Container(
                          alignment: Alignment.center,
                          width:     40.0,
                          height:    40.0,
                          padding:   const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          margin:    const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                          child:     Image.asset(i['image'])
                        )
                      : WTComponentBuilder.emptyComponent()!,

                    WTComponentBuilder.createText(
                      text: i['label'],
                      color: widget.inputTextColor,
                      size: widget.inputTextSize,
                      textAlign: TextAlign.right,
                    )!,
                  ],
                ),
              ),
            )
          ).toList(),
        ),
      ),
    );
  }

  Widget? createSuffixWidget() {
    if(widget.suffix == null) { return WTComponentBuilder.emptyComponent()!; }

    return Container(
      height: widget.suffixSize,
      width:  widget.suffixSize,
      margin: const EdgeInsets.fromLTRB(7.5, 0.0, 0.0, 0.0),
      child: createInputFieldIcon(
        icon:   widget.suffix,
        action: widget.suffixAction,
        color:  widget.suffixColor,
        size:   widget.suffixSize,
      ),
    );
  }

  Widget? createSeparatorWidget() {
    if(!widget.separatorEnabled!) {  return WTComponentBuilder.emptyComponent()!;  }

    return Container(
      margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
      width:  double.infinity,
      height: widget.separatorSize,
      color:  widget.separatorColor,
      child: const SizedBox.shrink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width         = widget.width!;
    widget.prefixSize    = width * 0.055;
    widget.labelSize     = width * 0.0425;
    widget.suffixSize    = width * 0.055;
    widget.inputTextSize = width * 0.0425;
    widget.separatorSize = 1.0;
    widget.padding       = const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0);
    widget.margin        = const EdgeInsets.fromLTRB(1.0, 0.0, 1.0, 1.0);

    return Container(
      key: widget.key,
      padding: widget.padding,
      margin: widget.margin,
      width: width,
      alignment: Alignment.centerLeft,
      decoration: createContainerDecoration(
        backgroundColor: widget.backgroundColor,
        borderColor: widget.borderColor,
        borderRadius: const BorderRadius.all(Radius.zero),
      ),
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          // prefix, label, input field, suffix
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              createPrefixWidget()!,     // prefix

              createLabelWidget()!,      // label

              createInputFieldWidget()!, // input field, suffix
            ],
          ),

          // separator
          createSeparatorWidget()!,
        ],
      ),
    );
  }

}