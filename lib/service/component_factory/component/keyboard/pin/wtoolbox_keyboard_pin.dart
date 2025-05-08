import 'package:flutter/material.dart';
import '../wtoolbox_keyboard.dart';
import 'components/wtoolbox_keyboard_input_field.dart';
import 'components/wtoolbox_keyboard_button.dart';
import 'components/wtoolbox_keyboard_button_container.dart';

class WTKeyboardPin extends WTKeyboard {
  
  @override
  Widget? build() {
    return PinKeyboardState(
      key: getUniqueKey(),
      width:                 width,
      height:                height,
      padding:               padding,
      margin:                margin,
      backgroundColor:       backgroundColor,
      labelColor:            labelColor,
      labelBorderColor:      labelBorderColor,
      labelBackgroundColor:  labelBackgroundColor,
      buttonSize:            buttonSize,
      buttonLabelSize:       buttonLabelSize,
      buttonLabelColor:      buttonLabelColor,
      buttonBorderColor:     buttonBorderColor,
      buttonBackgroundColor: buttonBackgroundColor,
      primaryAction:         primaryAction,
      secondaryAction:       secondaryAction,
    );
  }

}

// ignore: must_be_immutable
class PinKeyboardState extends StatefulWidget {

  double? width, height;
  EdgeInsets? padding, margin;
  double? buttonSize, buttonLabelSize;
  Color? backgroundColor, labelColor, labelBorderColor, labelBackgroundColor, buttonLabelColor, buttonBorderColor, buttonBackgroundColor;
  Function? primaryAction, secondaryAction;

  PinKeyboardState({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.labelColor,
    this.labelBorderColor,
    this.labelBackgroundColor,
    this.buttonSize,
    this.buttonLabelSize,
    this.buttonLabelColor,
    this.buttonBorderColor,
    this.buttonBackgroundColor,
    this.primaryAction,
    this.secondaryAction,
  });

  @override
  State<PinKeyboardState> createState() => PinKeyboardStateless();

}

class PinKeyboardStateless extends State<PinKeyboardState> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pinCode = '';
    pinCodeList = ['', '', '', ''];
    pinIndex = 0;
    pinOneController!.clear();
    pinTwoController!.clear();
    pinThreeController!.clear();
    pinFourController!.clear();
    super.dispose();
  }

  List<String>? pinCodeList = <String>['', '', '', ''];

  String? pinCode = '';
  void setPinCode(String? value) { setState(() { pinCode = value!; }); }

  int pinIndex = 0;
  TextEditingController? pinOneController   = TextEditingController();
  TextEditingController? pinTwoController   = TextEditingController();
  TextEditingController? pinThreeController = TextEditingController();
  TextEditingController? pinFourController  = TextEditingController();

  void setPin(int pinIndex, String text) {
    if(pinIndex == 1) { setState(() { pinOneController!.text = text; }); }
    if(pinIndex == 2) { setState(() { pinTwoController!.text = text; }); }
    if(pinIndex == 3) { setState(() { pinThreeController!.text = text; }); }
    if(pinIndex == 4) { setState(() { pinFourController!.text = text; }); }
  }

  void pinIndexSetup(String text) {
    if(pinIndex == 0) {
      setState(() { pinIndex = 1; });
    }else if(pinIndex < 4) {
      setState(() { pinIndex++; });
    }
    setPin(pinIndex, text);

    setState(() { pinCodeList![pinIndex - 1] = text; });
    if(pinIndex == 4) { setPinCode(pinCodeList!.join()); }
  }

  void clearPin() {
    if(pinIndex == 0) {
      setState(() { pinIndex = 0; });
    }else if(pinIndex == 4) {
      setPin(pinIndex, '');
      setPinCode('');
      setState(() { pinCodeList![pinIndex - 1] = ''; });
      setState(() { pinIndex--; });
    }else {
      setPin(pinIndex, '');
      setPinCode('');
      setState(() { pinCodeList![pinIndex - 1] = ''; });
      setPin(pinIndex, '');
      setState(() { pinIndex--; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          widget.width      = constraints.maxWidth;
          widget.buttonSize = constraints.maxWidth * 0.125;

          return Container(
            width: widget.width,
            color: widget.backgroundColor,
            padding: widget.padding,
            margin: widget.margin,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: widget.backgroundColor,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        /// input fields (pinOneController, pinTwoController, pinThreeController, pinFourController)
                        Container(
                          color: widget.backgroundColor,
                          padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[

                              /// pinOneController
                              WTKeyboardInputField(
                                textColor: widget.labelColor,
                                borderColor: widget.labelBorderColor,
                                backgroundColor:widget.labelBackgroundColor,
                                width: widget.buttonSize,
                                height: widget.buttonSize,
                                textEditingController: pinOneController,
                              ),

                              /// pinTwoController
                              WTKeyboardInputField(
                                textColor: widget.labelColor,
                                borderColor: widget.labelBorderColor,
                                backgroundColor: widget.labelBackgroundColor,
                                width: widget.buttonSize,
                                height: widget.buttonSize,
                                textEditingController: pinTwoController,
                              ),

                              /// pinThreeController
                              WTKeyboardInputField(
                                textColor: widget.labelColor,
                                borderColor: widget.labelBorderColor,
                                backgroundColor: widget.labelBackgroundColor,
                                width: widget.buttonSize,
                                height: widget.buttonSize, 
                                textEditingController: pinThreeController,
                              ),

                              /// pinFourController
                              WTKeyboardInputField(
                                textColor: widget.labelColor,
                                borderColor: widget.labelBorderColor,
                                backgroundColor: widget.labelBackgroundColor,
                                width: widget.buttonSize, 
                                height: widget.buttonSize, 
                                textEditingController: pinFourController,
                              ),

                            ],
                          ),
                        ),

                        /// space between
                        const SizedBox(height: 30.0),

                        /// keyboards (0-9, submitAction, deleteAction...)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[

                            /// 0, 1, 2
                            WTKeyboardButtonContainer(
                              padding: const EdgeInsets.all(0.0),
                              margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 25.0),
                              widgets: <Widget>[
                                WTKeyboardButton(
                                  width: widget.buttonSize,
                                  height: widget.buttonSize,
                                  padding: const EdgeInsets.all(0.0),
                                  margin: const EdgeInsets.all(0.0),
                                  backgroundColor: widget.buttonBackgroundColor,
                                  label: '1',
                                  labelSize: widget.buttonSize! * 0.70,
                                  labelColor: widget.buttonLabelColor,
                                  action: () => pinIndexSetup('1'),
                                ),
                                WTKeyboardButton(
                                  width: widget.buttonSize,
                                  height: widget.buttonSize,
                                  padding: const EdgeInsets.all(0.0),
                                  margin: const EdgeInsets.all(0.0),
                                  backgroundColor: widget.buttonBackgroundColor,
                                  label: '2',
                                  labelSize: widget.buttonSize! * 0.70,
                                  labelColor: widget.buttonLabelColor,
                                  action: () => pinIndexSetup('2'),
                                ),
                                WTKeyboardButton(
                                  width: widget.buttonSize,
                                  height: widget.buttonSize,
                                  padding: const EdgeInsets.all(0.0),
                                  margin: const EdgeInsets.all(0.0),
                                  backgroundColor: widget.buttonBackgroundColor,
                                  label: '3',
                                  labelSize: widget.buttonSize! * 0.70,
                                  labelColor: widget.buttonLabelColor,
                                  action: () => pinIndexSetup('3'),
                                ),
                              ],
                            ),

                            /// 4, 5, 6
                            WTKeyboardButtonContainer(
                              padding: const EdgeInsets.all(0.0),
                              margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 25.0),
                              widgets: <Widget>[
                                WTKeyboardButton(
                                  width: widget.buttonSize,
                                  height: widget.buttonSize,
                                  padding: const EdgeInsets.all(0.0),
                                  margin: const EdgeInsets.all(0.0),
                                  backgroundColor: widget.buttonBackgroundColor,
                                  label: '4',
                                  labelSize: widget.buttonSize! * 0.70,
                                  labelColor: widget.buttonLabelColor,
                                  action: () => pinIndexSetup('4'),
                                ),
                                WTKeyboardButton(
                                  width: widget.buttonSize,
                                  height: widget.buttonSize,
                                  padding: const EdgeInsets.all(0.0),
                                  margin: const EdgeInsets.all(0.0),
                                  backgroundColor: widget.buttonBackgroundColor,
                                  label: '5',
                                  labelSize: widget.buttonSize! * 0.70,
                                  labelColor: widget.buttonLabelColor,
                                  action: () => pinIndexSetup('5'),
                                ),
                                WTKeyboardButton(
                                  width: widget.buttonSize,
                                  height: widget.buttonSize,
                                  padding: const EdgeInsets.all(0.0),
                                  margin: const EdgeInsets.all(0.0),
                                  backgroundColor: widget.buttonBackgroundColor,
                                  label: '6',
                                  labelSize: widget.buttonSize! * 0.70,
                                  labelColor: widget.buttonLabelColor,
                                  action: () => pinIndexSetup('6'),
                                ),
                              ],
                            ),

                            /// 7, 8, 9
                            WTKeyboardButtonContainer(
                              padding: const EdgeInsets.all(0.0),
                              margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 25.0),
                              widgets: <Widget>[
                                WTKeyboardButton(
                                  width: widget.buttonSize,
                                  height: widget.buttonSize,
                                  padding: const EdgeInsets.all(0.0),
                                  margin: const EdgeInsets.all(0.0),
                                  backgroundColor: widget.buttonBackgroundColor,
                                  label: '7',
                                  labelSize: widget.buttonSize! * 0.70,
                                  labelColor: widget.buttonLabelColor,
                                  action: () => pinIndexSetup('7'),
                                ),
                                WTKeyboardButton(
                                  width: widget.buttonSize,
                                  height: widget.buttonSize,
                                  padding: const EdgeInsets.all(0.0),
                                  margin: const EdgeInsets.all(0.0),
                                  backgroundColor: widget.buttonBackgroundColor,
                                  label: '8',
                                  labelSize: widget.buttonSize! * 0.70,
                                  labelColor: widget.buttonLabelColor,
                                  action: () => pinIndexSetup('8'),
                                ),
                                WTKeyboardButton(
                                  width:  widget.buttonSize,
                                  height:  widget.buttonSize,
                                  padding: const EdgeInsets.all(0.0),
                                  margin: const EdgeInsets.all(0.0),
                                  backgroundColor: widget.buttonBackgroundColor,
                                  label: '9',
                                  labelSize: widget.buttonSize! * 0.70,
                                  labelColor: widget.buttonLabelColor,
                                  action: () => pinIndexSetup('9'),
                                ),
                              ],
                            ),

                            /// submitAction, 0, cancelAction
                            WTKeyboardButtonContainer(
                              padding: const EdgeInsets.all(0.0),
                              margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                              widgets: <Widget>[

                                pinCodeList!.isNotEmpty && !pinCodeList!.contains('')
                                    ? WTKeyboardButton(
                                  width: widget.buttonSize,
                                  height: widget.buttonSize,
                                  padding: const EdgeInsets.all(0.0),
                                  margin: const EdgeInsets.all(0.0),
                                  backgroundColor: widget.buttonBackgroundColor,
                                  icon: Icons.check,
                                  iconSize: widget.buttonSize! * 0.70,
                                  labelColor: widget.buttonLabelColor,
                                  action: () => widget.primaryAction!(pinCode),
                                )
                                    : SizedBox(width: widget.buttonSize, height: widget.buttonSize),

                                WTKeyboardButton(
                                  width: widget.buttonSize,
                                  height: widget.buttonSize,
                                  padding: const EdgeInsets.all(0.0),
                                  margin: const EdgeInsets.all(0.0),
                                  backgroundColor: widget.buttonBackgroundColor,
                                  label: '0',
                                  labelSize: widget.buttonSize! * 0.70,
                                  labelColor: widget.buttonLabelColor,
                                  action: () => pinIndexSetup('0'),
                                ),

                                WTKeyboardButton(
                                  width: widget.buttonSize,
                                  height: widget.buttonSize,
                                  padding: const EdgeInsets.all(0.0),
                                  margin: const EdgeInsets.all(0.0),
                                  backgroundColor: widget.buttonBackgroundColor,
                                  icon: Icons.cancel_presentation,
                                  iconSize: widget.buttonSize! * 0.70,
                                  iconColor: widget.buttonLabelColor,
                                  action: () => clearPin(),
                                ),

                              ],
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}

