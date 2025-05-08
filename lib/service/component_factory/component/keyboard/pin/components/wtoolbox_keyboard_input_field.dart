import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WTKeyboardInputField extends StatefulWidget {

  Color? backgroundColor, borderColor, textColor;
  double? width, height;
  EdgeInsets? padding, margin;
  TextEditingController? textEditingController;

  WTKeyboardInputField({
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.textEditingController,
  });

  @override
  State<WTKeyboardInputField> createState() => WTKeyboardInputFieldState();

}

class WTKeyboardInputFieldState extends State<WTKeyboardInputField> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      margin: widget.margin,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: const Border(
          bottom: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      child: TextFormField(
        enabled: false,
        controller: widget.textEditingController,
        obscureText: false,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: widget.textColor
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          focusColor: Colors.blue.shade300,
          isDense: true,
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

}
