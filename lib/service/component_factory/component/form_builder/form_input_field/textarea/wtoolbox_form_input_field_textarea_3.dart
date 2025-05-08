import 'package:flutter/material.dart';
import '../wtoolbox_form_input_field.dart';
import '../wtoolbox_form_input_field_builder.dart';
import '../../../wtoolbox_component_builder.dart';

class WTFormInputFieldTextarea3 extends WTFormInputField with WTFormInputFieldBuilder {

  Widget? createLabelWidget() {
    if(label == null) { return WTComponentBuilder.emptyComponent(); }

    label = label!.length > 10 ? '${label!.substring(0, 10)}...' : label!;

    return createLabelContainer(
      alignment: Alignment.centerRight,
      label: label,
      labelColor: labelColor,
      fontSize: labelSize,
      margin: const EdgeInsets.fromLTRB(5.0, 0.0, 10.0, 0.0)
    )!;
  }

  Widget? createHintLabelWidget() {
    if(hintLabel == null) { return WTComponentBuilder.emptyComponent(); }

    return createLabelContainer(
      fontWeight: FontWeight.normal,
      label: hintLabel,
      labelColor: hintLabelColor,
      fontSize: hintLabelSize,
      margin: const EdgeInsets.fromLTRB(0.0, 7.5, 0.0, 0.0),
    )!;
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width         = constraints.maxWidth;
        padding       = padding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        margin        = margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        labelSize     = width! * 0.0425;
        prefixSize    = width! * 0.0475;
        inputTextSize = width! * 0.0425;
        hintLabelSize = width! * 0.0425;
        suffixSize    = width! * 0.0475;

        return Container(
          width: width,
          padding: padding,
          margin: margin,
          alignment: Alignment.centerLeft,
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /// input field && label
              Container(
                decoration: createContainerDecoration(
                  backgroundColor: backgroundColor,
                  borderColor: borderColor
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(0.0),
                margin: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /// input field
                    Expanded(
                      child: Container(
                        decoration: createContainerDecoration(
                          backgroundColor: backgroundColor,
                          borderColor: borderColor
                        ),
                        child: TextFormField(
                          focusNode: focusNode,
                          onFieldSubmitted: (_) {
                            if(secondaryFocusNode != null) {
                              FocusScope.of(context).requestFocus(secondaryFocusNode);
                            }
                          },
                          enabled: isEnabled,
                          controller: controller,
                          obscureText: false,
                          autovalidateMode: autoValidateMode,
                          textAlign: TextAlign.start,
                          maxLines: 5,
                          style: TextStyle(
                            color: inputTextColor,
                            fontSize: inputTextSize,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            border: getBorder(),
                            enabledBorder: getBorder(),
                            focusedBorder: getFocusedBorder(),
                            focusColor: Colors.blue.shade300,
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: errorTextColor!, width: 0.5),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: errorTextColor!, width: 0.5),
                            ),
                            errorStyle: TextStyle(
                              color: errorTextColor,
                            ),
                            isDense: true,
                          ),
                          keyboardType: textInputType,
                          validator: (v) => validator != null ? validator!(v) : null,
                        ),
                      ),
                    ),

                    /// label
                    createLabelWidget()!,
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