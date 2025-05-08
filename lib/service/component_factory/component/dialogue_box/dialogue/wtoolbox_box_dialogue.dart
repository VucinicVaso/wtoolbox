import 'dart:async';
import 'package:flutter/material.dart';
import '../wtoolbox_dialogue_box.dart';
import '../../wtoolbox_component_builder.dart';

class WTDialogueBoxImpl extends WTDialogueBox {

  Widget? createIconWidget() {
    if(icon == null) { return WTComponentBuilder.emptyComponent()!; }

    return Container(
      width: iconSize,
      height: iconSize,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: iconBackgroundColor,
      ),
      child: WTComponentBuilder.createIcon(
        iconData: icon,
        size: iconSize! * 0.55,
        color: iconColor
      ),
    );
  }

  Widget? createTitleWidget() {
    if(title == null) { return WTComponentBuilder.emptyComponent()!; }

    return WTComponentBuilder.createText(
      text: title!,
      color: titleColor!,
      size: titleSize,
      fontWeight: FontWeight.bold,
      textAlign: TextAlign.left
    )!;
  }

  Widget? createDescriptionWidget() {
    if(description == null) { return WTComponentBuilder.emptyComponent()!; }

    return WTComponentBuilder.createText(
      text: description!,
      color: descriptionColor!,
      size: descriptionSize,
      textAlign: TextAlign.left
    )!;
  }

  Widget? createSubmitButtonsWidget() {
    if(cancelButtonLabel == null && saveButtonLabel == null) {
      return WTComponentBuilder.emptyComponent()!;
    }

    Widget? cancelButtonWidget = WTComponentBuilder.emptyComponent()!;
    if(cancelButtonLabel != null) {
      cancelButtonWidget = DialogButton(
        labelAction: () {
          cancelButtonAction!();
          close!();
        },
        label: cancelButtonLabel,
        labelSize: cancelButtonLabelSize,
        labelColor: cancelButtonLabelColor,
        backgroundColor: cancelButtonBackgroundColor,
      );
    }

    Widget? saveButtonWidget = WTComponentBuilder.emptyComponent()!;
    if(saveButtonLabel != null) {
      saveButtonWidget = DialogButton(
        labelAction: () {
          saveButtonAction!();
          close!();
        },
        label: saveButtonLabel,
        labelSize: saveButtonLabelSize,
        labelColor: saveButtonLabelColor,
        backgroundColor: saveButtonBackgroundColor,
      );
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 15.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: cancelButtonLabel == null || saveButtonLabel == null
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          cancelButtonWidget, /// cancelButton
          saveButtonWidget,   /// saveButton
        ],
      ),
    );
  }

  @override
  Future? build() {
    return showDialog(
      context: buildContext!,
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            width                 = constraints.maxWidth;
            height                = width! * 0.65;
            iconSize              = width! * 0.1;
            titleSize             = width! * 0.05;
            descriptionSize       = width! * 0.04;
            cancelButtonLabelSize = width! * 0.045;
            saveButtonLabelSize   = width! * 0.045;

            return AlertDialog(
              backgroundColor: Colors.transparent,
              iconPadding: const EdgeInsets.all(0.0),
              contentPadding: const EdgeInsets.all(0.0),
              buttonPadding: const EdgeInsets.all(0.0),
              actionsPadding: const EdgeInsets.all(0.0),
              content: Container(
                width: width!,
                height: height,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(0.0),
                margin: const EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  color: borderColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    /// icon, title, description
                    Expanded(
                      child: Container(
                        width: width,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5.0),
                        margin: cancelButtonLabel == null && saveButtonLabel == null
                          ? const EdgeInsets.all(0.0)
                          : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: cancelButtonLabel == null && saveButtonLabel == null
                            ? const BorderRadius.all(Radius.circular(20.0))
                            : const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[

                            /// icon
                            createIconWidget()!,

                            /// title, description
                            Container(
                              color: backgroundColor,
                              width: width! * 0.6,
                              padding: const EdgeInsets.all(5.0),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  createTitleWidget()!,

                                  title != null && description != null ? const SizedBox(height: 10.0) : WTComponentBuilder.emptyComponent()!,

                                  createDescriptionWidget()!,
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                    /// cancelButton, saveButton
                    createSubmitButtonsWidget()!,

                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }

}

// ignore: must_be_immutable
class DialogButton extends StatelessWidget {

  DialogButton({
    super.key,
    this.labelAction,
    this.label,
    this.labelSize,
    this.labelColor,
    this.backgroundColor,
  });

  VoidCallback? labelAction;
  String? label;
  double? labelSize;
  Color? labelColor, backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: labelAction,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Text(
          label!,
          style: TextStyle(
            color: labelColor,
            fontSize: labelSize,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

}