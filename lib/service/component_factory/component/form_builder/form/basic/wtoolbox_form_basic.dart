import 'package:flutter/material.dart';
import '../../../wtoolbox_component_builder.dart';
import '../bmp_field.dart';
import '../wtoolbox_form.dart';

class WTFormBasic extends WTForm {

  @override
  Widget? build() {
    return BasicFormStatefulWidget(
      key:                             getUniqueKey(),
      formKey:                         formKey,
      autovalidateMode:                autoValidateMode,
      width:                           width,
      padding:                         padding,
      margin:                          margin,
      alignment:                       alignment,
      backgroundColor:                 backgroundColor,
      mainAxisAlignment:               mainAxisAlignment,
      crossAxisAlignment:              crossAxisAlignment,
      scrollController:                scrollController,
      hiddenFields:                    hiddenFields,
      fields:                          fields,
      moreOrLessButtonsVisibility:     fieldsVisibility,
      lessFieldsButtonLabel:           lessFieldsButtonLabel,
      lessFieldsButtonLabelColor:      lessFieldsButtonLabelColor,
      lessFieldsButtonBackgroundColor: lessFieldsButtonBackgroundColor,
      lessFieldsButtonLabelSize:       lessFieldsButtonLabelSize,
      moreFieldsButtonLabel:           moreFieldsButtonLabel,
      moreFieldsButtonLabelColor:      moreFieldsButtonLabelColor,
      moreFieldsButtonBackgroundColor: moreFieldsButtonBackgroundColor,
      moreFieldsButtonLabelSize:       moreFieldsButtonLabelSize,
    );
  }

}

// ignore: must_be_immutable
class BasicFormStatefulWidget extends StatefulWidget {

  BasicFormStatefulWidget({
    super.key,
    this.formKey,
    this.autovalidateMode,
    this.width,
    this.padding,
    this.margin,
    this.alignment,
    this.backgroundColor,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.scrollController,

    this.hiddenFields,
    this.fields,
    this.moreOrLessButtonsVisibility,

    this.lessFieldsButtonLabel,
    this.lessFieldsButtonLabelColor,
    this.lessFieldsButtonBackgroundColor,
    this.lessFieldsButtonLabelSize,

    this.moreFieldsButtonLabel,
    this.moreFieldsButtonLabelColor,
    this.moreFieldsButtonBackgroundColor,
    this.moreFieldsButtonLabelSize,
  });

  Key? formKey;
  AutovalidateMode? autovalidateMode;
  double? width;
  EdgeInsets? padding, margin;
  Alignment? alignment;
  Color? backgroundColor;
  ScrollController? scrollController;
  bool? moreOrLessButtonsVisibility;
  List<String>? hiddenFields = List<String>.empty(growable: true);
  Map<String, BmpField>? fields = <String, BmpField>{};
  MainAxisAlignment? mainAxisAlignment;
  CrossAxisAlignment? crossAxisAlignment;
  String? lessFieldsButtonLabel, moreFieldsButtonLabel;
  Color? lessFieldsButtonLabelColor, lessFieldsButtonBackgroundColor, moreFieldsButtonLabelColor, moreFieldsButtonBackgroundColor;
  double? lessFieldsButtonLabelSize, moreFieldsButtonLabelSize;

  @override
  State<BasicFormStatefulWidget> createState() => BasicFormState();

}

class BasicFormState extends State<BasicFormStatefulWidget> {

  @override
  void initState() {
    setFields();
    super.initState();
  }

  @override
  void dispose() {
    if(widget.scrollController != null) {
      widget.scrollController!.dispose();
    }

    if(widget.fields != null) {
      widget.fields!.forEach((k, f) {
        if(f.inputField != null) {
          f.focusNode!.dispose();
          f.inputField!.focusNode!.dispose();
        }
      });
    }

    super.dispose();
  }

  List<BmpField>? fieldsList = List<BmpField>.empty(growable: true);
  bool? moreOrLessButtonsVisibility = false, lessFieldsButtonShow = false, moreFieldsButtonShow = false;

  void setFields() {
    List<BmpField>? list = List<BmpField>.empty(growable: true);
    list = widget.fields!.values.toList()..sort((a, b) => (a.order ?? 1000).compareTo(b.order ?? 1000));

    for(var field in list) {
      if(field.inputField != null && field.order != list.last.order!) {
        var secondField = list.firstWhere((f) => f.inputField != null && f.order! > field.order!, orElse: () => BmpField());
        if(secondField.inputField != null) {
          field.inputField!.setSecondaryFocusNode(secondField.inputField!.focusNode);
        }
      }
    }

    if(widget.moreOrLessButtonsVisibility!) {
      for(var field in list) {
        for(var key in widget.hiddenFields!) {
          if(field.key == key) { field.hideField(); }
        }
      }

      setState(() {
        lessFieldsButtonShow = false;
        moreFieldsButtonShow = true;
      });
    }

    setState(() {
      moreOrLessButtonsVisibility = widget.moreOrLessButtonsVisibility;
      fieldsList = list;
    });
  }

  void showWithLessFieldsButton() {
    List<BmpField>? lessFields = List<BmpField>.empty(growable: true);
    if(fieldsList!.isNotEmpty && widget.hiddenFields!.isNotEmpty) {
      lessFields = fieldsList!;
      for(var field in lessFields) {
        for(var key in widget.hiddenFields!) {
          if(field.key == key) { field.hideField(); }
        }
      }
    }

    setState(() {
      lessFieldsButtonShow = false;
      moreFieldsButtonShow = true;
      fieldsList = lessFields;
    });
  }

  void showWithMoreFieldsButton() {
    List<BmpField> moreFields = List<BmpField>.empty(growable: true);
    if(fieldsList!.isNotEmpty && widget.hiddenFields!.isNotEmpty) {
      moreFields = fieldsList!;

      for(var field in moreFields) {
        for(var key in widget.hiddenFields!) {
          if(field.key == key) { field.showField(); }
        }
      }
    }

    setState(() {
      lessFieldsButtonShow = true;
      moreFieldsButtonShow = false;
      fieldsList = moreFields;
    });

  }

  Widget? createButton({
    String? label,
    double? labelSize,
    Color? labelColor,
    Color? labelBackgroundColor,
    VoidCallback? action
  }) {
    return GestureDetector(
      onTap: action ?? () {},
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          margin: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: labelBackgroundColor,
          ),
          child: WTComponentBuilder.createText(
            text: label,
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              color: labelColor,
              fontSize: labelSize,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget? generateFields() {
    List<Builder> wrappedFields = List<Builder>.empty(growable: true);

    if(fieldsList!.isNotEmpty) {
      wrappedFields = fieldsList!
        .where((l) => l.show == true)
        .map((field) {
          return Builder(
            builder: (context) {
              return Focus(
                focusNode: field.focusNode,
                onFocusChange: (hasFocus) {
                  if(hasFocus) {
                    Scrollable.ensureVisible(
                      context,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: field.build()!,
              );
            }
          );
        })
        .toList();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: widget.mainAxisAlignment!,
      crossAxisAlignment: widget.crossAxisAlignment!,
      children: <Widget>[
        ...wrappedFields,
      ],
    );
  }

  Widget? generateMoreOrLessButtons() {
    if(!moreOrLessButtonsVisibility!) { return const SizedBox.shrink(); }

    if(lessFieldsButtonShow!) {
      return createButton(
        label: widget.lessFieldsButtonLabel,
        labelSize: widget.lessFieldsButtonLabelSize,
        labelColor: widget.lessFieldsButtonLabelColor,
        labelBackgroundColor: widget.lessFieldsButtonBackgroundColor,
        action: showWithLessFieldsButton,
      )!;
    }

    if(moreFieldsButtonShow!) {
      return createButton(
        label: widget.moreFieldsButtonLabel,
        labelSize: widget.moreFieldsButtonLabelSize,
        labelColor: widget.moreFieldsButtonLabelColor,
        labelBackgroundColor: widget.moreFieldsButtonBackgroundColor,
        action: showWithMoreFieldsButton
      )!;
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey!,
      autovalidateMode: widget.autovalidateMode,
      child: Container(
        color: widget.backgroundColor,
        width: widget.width,
        padding: widget.padding,
        margin: widget.margin,
        alignment: widget.alignment,
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: Column(
            children: <Widget>[
              generateFields()!,
              generateMoreOrLessButtons()!,
            ],
          ),
        ),
      ),
    );
  }

}