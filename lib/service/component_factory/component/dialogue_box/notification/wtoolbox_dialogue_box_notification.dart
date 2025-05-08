import 'dart:async';
import 'package:flutter/material.dart';
import '../wtoolbox_dialogue_box.dart';
import '../../wtoolbox_component_builder.dart';

class WTDialogueBoxNotification extends WTDialogueBox {

  Widget? labelWidget() {
    if(label == null) { return WTComponentBuilder.emptyComponent(); }

    return WTComponentBuilder.createText(
      text: label,
      color: labelColor,
      size: labelSize,
      fontWeight: FontWeight.bold,
      textAlign: TextAlign.center
    );
  }

  @override
  Future? build() {
    Timer timer;
    timer = Timer(duration!, () => close!());

    return showModalBottomSheet(
      context: buildContext!,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      elevation: 0.1,
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            labelSize = constraints.maxWidth * 0.04;

            return Container(
              padding: const EdgeInsets.fromLTRB(17.5, 17.5, 17.5, 17.5),
              margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: backgroundColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: borderColor!,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: labelWidget(),
            );
          }
        );
      },
    ).then((v) => timer.cancel());
  }

}
