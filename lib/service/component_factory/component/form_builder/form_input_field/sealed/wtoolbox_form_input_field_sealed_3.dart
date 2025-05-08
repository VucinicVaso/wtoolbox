import 'package:flutter/material.dart';
import '../../../wtoolbox_component_builder.dart';
import '../wtoolbox_form_input_field.dart';
import '../wtoolbox_form_input_field_builder.dart';

class WTFormInputFieldSealed3 extends WTFormInputField with WTFormInputFieldBuilder {

  Widget? createLabelWidget() {
    if(label == null) { return WTComponentBuilder.emptyComponent()!; }

    label = label!.length > 10 ? '${label!.substring(0, 10)}...' : label!;

    return createLabelContainer(
      alignment: Alignment.centerRight,
      label: label,
      labelColor: labelColor,
      fontSize: labelSize,
      margin: const EdgeInsets.fromLTRB(7.5, 0.0, 0.0, 0.0)
    );
  }

  Widget? createHintLabelWidget() {
    if(hintLabel == null) { return WTComponentBuilder.emptyComponent()!; }

    return createLabelContainer(
      fontWeight: FontWeight.normal,
      fontSize: hintLabelSize,
      label: hintLabel,
      labelColor: hintLabelColor,
      margin: const EdgeInsets.fromLTRB(0.0, 7.5, 0.0, 0.0)
    );
  }

  Widget? createPrefixWidget() {
    if(prefix == null) { return WTComponentBuilder.emptyComponent()!; }

    return Container(
      height: prefixSize,
      width: prefixSize,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 7.5, 0.0),
      child: createInputFieldIcon(
        icon: prefix,
        action: prefixAction,
        color: prefixColor,
        size: prefixSize
      ),
    );
  }

  Widget? createSuffixWidget() {
    if(suffix == null) { return WTComponentBuilder.emptyComponent()!; }

    return Container(
      height: suffixSize,
      width: suffixSize,
      margin: const EdgeInsets.fromLTRB(7.5, 0.0, 0.0, 0.0),
      child: createInputFieldIcon(
        icon: suffix,
        action: suffixAction,
        color: suffixColor,
        size: suffixSize
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
              /// prefix, input field, suffix, label
              Container(
                decoration: createContainerDecoration(
                  backgroundColor: backgroundColor,
                  borderColor: borderColor
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
                        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        decoration: createContainerDecoration(
                          backgroundColor: backgroundColor,
                          borderColor: borderColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            /// prefix
                            createPrefixWidget()!,

                            /// input field
                            Expanded(
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
                                style: TextStyle(
                                  color: inputTextColor,
                                  fontSize: inputTextSize,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
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
                                ),
                                keyboardType: textInputType,
                                validator: (v) => validator != null ? validator!(v) : null,
                              ),
                            ),

                            /// suffix
                            createSuffixWidget()!,

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
