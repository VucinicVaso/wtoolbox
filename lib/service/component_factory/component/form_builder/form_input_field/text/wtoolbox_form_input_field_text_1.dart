import 'package:flutter/material.dart';
import '../wtoolbox_form_input_field.dart';
import '../wtoolbox_form_input_field_builder.dart';
import '../../../wtoolbox_component_builder.dart';

class WTFormInputFieldText1 extends WTFormInputField with WTFormInputFieldBuilder {

  Widget? createLabelWidget() {
    if(label == null) { return WTComponentBuilder.emptyComponent()!; }

    return createLabelContainer(
      label: label,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 7.5),
      textStyle: textStyle(
        fontSize: labelSize,
        textColor: labelColor,
        fontWeight: FontWeight.bold
      ),
    )!;
  }

  Widget? createHintLabelWidget() {
    if(hintLabel == null) { return WTComponentBuilder.emptyComponent()!; }

    return createLabelContainer(
      label: hintLabel,
      margin: const EdgeInsets.fromLTRB(0.0, 7.5, 0.0, 0.0),
      textStyle: textStyle(
        fontSize: hintLabelSize,
        textColor: hintLabelColor,
      ),
    )!;
  }

  Widget? createPrefixWidget() {
    if(prefix == null) { return WTComponentBuilder.emptyComponent()!; }

    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 7.5, 0.0),
      child: createInputFieldIcon(
        icon: prefix,
        color: prefixColor,
        size: prefixSize,
        action: prefixAction,
      ),
    );
  }

  Widget? createSuffixWidget() {
    if(suffix == null) { return WTComponentBuilder.emptyComponent()!; }

    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(7.5, 0.0, 0.0, 0.0),
      child: createInputFieldIcon(
        icon: suffix,
        color: suffixColor,
        size: suffixSize,
        action: suffixAction,
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width         = constraints.maxWidth;
        padding       = padding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        margin        = margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        labelSize     = width! * 0.04;
        hintLabelSize = width! * 0.035;
        prefixSize    = width! * 0.045;
        inputTextSize = width! * 0.045;
        suffixSize    = width! * 0.045;

        return Container(
          width: width,
          padding: padding,
          margin: margin,
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
                  focusNode: focusNode,
                  onFieldSubmitted: (_) {
                    if(secondaryFocusNode != null) {
                      FocusScope.of(context).requestFocus(secondaryFocusNode);
                    }
                  },
                  enabled: isEnabled,
                  controller: controller,
                  obscureText: false,
                  textAlign: textAlign!,
                  autovalidateMode: autoValidateMode,
                  style: textStyle(
                    fontSize: inputTextSize,
                    textColor: inputTextColor,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:  backgroundColor,
                    contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    border: getBorder(),
                    enabledBorder: getBorder(),
                    focusedBorder: getFocusedBorder(),
                    errorBorder: getErrorBorder(),
                    focusedErrorBorder: getErrorBorder(),
                    errorStyle: textStyle(
                      fontSize: errorTextSize,
                      textColor: errorTextColor,
                    ),
                    prefix: createPrefixWidget()!,
                    suffix: createSuffixWidget()!,
                  ),
                  textCapitalization: textCapitalization!,
                  keyboardType: textInputType,
                  validator: (v) => validator != null ? validator!(v) : null,
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