import 'package:flutter/material.dart';
import '../wt_ui_body.dart';

class WTUIBodyImpl extends WTUIBody {

  void isKeyboardOpen() {
    if(buildContext != null) {
      final keyboardOpen = MediaQuery.of(buildContext!).viewInsets.bottom > 0.0;
      if(keyboardOpen) { FocusScope.of(buildContext!).unfocus(); }
    }
  }

  @override
  Widget? build() {
    return SafeArea(
      key: getUniqueKey(),
      child: GestureDetector(
        onTap: () => isKeyboardOpen(),
        child: Container(
          color: backgroundColor,
          width: width,
          height: height,
          child: SizedBox.expand(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ...widgets!.map((w) => w.build()!),
              ],
            ),
          ),
        ),
      ),
    );
  }

}