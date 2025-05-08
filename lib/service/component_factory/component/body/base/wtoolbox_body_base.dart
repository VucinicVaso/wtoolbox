import 'package:flutter/material.dart';
import '../wtoolbox_body.dart';

class WTBodyBase extends WTBody {

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
          width: width,
          padding: padding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          margin: margin  ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          color: backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ...components!,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}