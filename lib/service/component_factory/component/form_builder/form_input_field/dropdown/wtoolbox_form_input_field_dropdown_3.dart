import 'dart:convert';
import 'package:flutter/material.dart';
import '../wtoolbox_form_input_field.dart';
import '../wtoolbox_form_input_field_builder.dart';
import '../../../wtoolbox_component_builder.dart';

class WTFormInputFieldDropdown3 extends WTFormInputField {

  @override
  Widget? build() {
    return DropDownInputField(
      key:                getUniqueKey(),
      focusNode:          focusNode,
      secondaryFocusNode: secondaryFocusNode,
      padding:            padding,
      margin:             margin,
      backgroundColor:    backgroundColor,
      borderColor:        borderColor,
      inputTextSize:      inputTextSize,
      inputTextColor:     inputTextColor,
      label:              label,
      labelSize:          labelSize,
      labelColor:         labelColor,
      hintLabel:          hintLabel,
      hintLabelSize:      hintLabelSize,
      hintLabelColor:     hintLabelColor,
      icon:               prefix,
      iconSize:           prefixSize,
      iconColor:          prefixColor,
      controller:         controller,
      items:              dropdownItems,
    );
  }

}

// ignore: must_be_immutable
class DropDownInputField extends StatefulWidget {

  FocusNode? focusNode, secondaryFocusNode;
  Color? backgroundColor, borderColor, inputTextColor, labelColor, hintLabelColor, iconColor;
  double? inputTextSize, labelSize, hintLabelSize, iconSize;
  EdgeInsets? padding, margin;
  List<Map<String, dynamic>>? items;
  TextEditingController? controller;
  IconData? icon;
  String? label, hintLabel;

  DropDownInputField({
    super.key,
    this.focusNode,
    this.secondaryFocusNode,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.inputTextSize,
    this.inputTextColor,
    this.label,
    this.labelSize,
    this.labelColor,
    this.hintLabel,
    this.hintLabelSize,
    this.hintLabelColor,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.controller,
    this.items,
  });

  @override
  State<DropDownInputField> createState() => DropDownInputFieldState();

}

class DropDownInputFieldState extends State<DropDownInputField> with WTFormInputFieldBuilder {

  @override
  void initState() {
    if(widget.items!.isNotEmpty) { setItems(widget.items!); }
    super.initState();
  }

  Map<String, dynamic>? selectedValue = <String, dynamic>{};
  void setSelectedValue(Map<String, dynamic>? map) {
    setState(() {
      selectedValue = map;
      widget.controller!.text = jsonEncode(map);
    });

    // if(widget.secondaryFocusNode != null) {
    //   FocusScope.of(context).requestFocus(widget.secondaryFocusNode);
    // }
  }

  List<Map<String, dynamic>>? items = List<Map<String, dynamic>>.empty(growable: true);
  void setItems(List<Map<String, dynamic>>? list) {
    setState(() {
      items = list;
      selectedValue = items!.firstWhere((e) => e['selected'] == true);
      widget.controller!.text = jsonEncode(selectedValue);
    });
  }

  Widget? createLabelWidget() {
    if(widget.label == null) { return WTComponentBuilder.emptyComponent(); }

    String label = widget.label!.length > 10 ? '${widget.label!.substring(0, 10)}...' : widget.label!;

    return createLabelContainer(
      label: label,
      labelColor: widget.labelColor,
      fontSize: widget.labelSize,
      margin: const EdgeInsets.fromLTRB(7.5, 0.0, 0.0, 0.0),
    )!;
  }

  Widget? createHintLabelWidget() {
    if(widget.hintLabel == null) { return WTComponentBuilder.emptyComponent(); }

    return createLabelContainer(
      fontWeight: FontWeight.normal,
      label: widget.hintLabel,
      fontSize: widget.hintLabelSize,
      labelColor: widget.hintLabelColor,
      margin: const EdgeInsets.fromLTRB(0.0, 7.5, 0.0, 0.0)
    )!;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: widget.key,
      builder: (context, constraints) {
        double width         = constraints.maxWidth;
        widget.padding       = widget.padding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        widget.margin        = widget.margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        widget.labelSize     = width * 0.04;
        widget.hintLabelSize = width * 0.035;
        widget.iconSize      = width * 0.045;
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /// label && input field
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
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        margin: const EdgeInsets.all(0.0),
                        decoration: createContainerDecoration(
                          backgroundColor: widget.backgroundColor,
                          borderColor: widget.borderColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            /// input field
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(0.0),
                                margin: const EdgeInsets.all(0.0),
                                decoration: createContainerDecoration(
                                  backgroundColor: widget.backgroundColor,
                                  borderColor: widget.borderColor
                                ),
                                alignment: Alignment.centerLeft,
                                child: DropdownButton<Map<String, dynamic>>(
                                  key: UniqueKey(),
                                  focusNode: widget.focusNode,
                                  isExpanded: true,
                                  value: selectedValue,
                                  dropdownColor: widget.backgroundColor,
                                  icon: Container(
                                    margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                    child: WTComponentBuilder.createIcon(
                                      iconData: widget.icon,
                                      size: widget.iconSize,
                                      color: widget.iconColor
                                    ),
                                  ),
                                  onChanged: (Map<String, dynamic>? m) => setSelectedValue(m),
                                  items: items!.map<DropdownMenuItem<Map<String, dynamic>>>((Map<String, dynamic>? i) =>
                                    DropdownMenuItem<Map<String, dynamic>>(
                                      value: i,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.fromLTRB(7.5, 7.5, 7.5, 7.5),
                                        margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 7.5),
                                        color: Colors.transparent,
                                        child: WTComponentBuilder.createText(
                                          text: i!['label'],
                                          color: widget.inputTextColor,
                                          size: widget.inputTextSize,
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    )
                                  ).toList(),
                                ),
                              ),
                            ),

                            /// label
                            createLabelWidget()!,
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
      }
    );
  }

}