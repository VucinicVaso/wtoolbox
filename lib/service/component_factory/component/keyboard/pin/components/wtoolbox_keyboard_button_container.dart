import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WTKeyboardButtonContainer extends StatelessWidget {

  EdgeInsets? padding, margin;
  List<Widget>? widgets = List<Widget>.empty(growable: true);

  WTKeyboardButtonContainer({
    super.key,
    this.padding,
    this.margin,
    this.widgets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ...widgets!,
        ],
      ),
    );
  }

}