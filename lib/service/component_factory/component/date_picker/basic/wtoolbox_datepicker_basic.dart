import 'package:flutter/material.dart';
import '../../../../../3rd_party/lib_datepicker.dart';
import '../../../../../3rd_party/lib_intl.dart';
import '../wtoolbox_datepicker.dart';

class WTDatePickerBasic extends WTDatePicker {

  @override
  Widget? build() {
    return DatePickerStatefulWidget(
      key:                UniqueKey(),
      buildContext:       buildContext,
      width:              width,
      height:             height,
      padding:            padding,
      margin:             margin,
      backgroundColor:    backgroundColor,
      buttonColor:        buttonColor,
      minDate:            minDate,
      maxDate:            maxDate,
      controller:         controller,
      dateSelectedAction: dateSelectedAction,
    );
  }

}

// ignore: must_be_immutable
class DatePickerStatefulWidget extends StatefulWidget {

  BuildContext? buildContext;
  Color? backgroundColor, buttonColor;
  double? width, height;
  EdgeInsets? padding, margin;
  DateTime? minDate, maxDate;
  TextEditingController? controller;
  Function? dateSelectedAction;

  DatePickerStatefulWidget({
    super.key,
    this.buildContext,
    this.backgroundColor,
    this.buttonColor,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.minDate,
    this.maxDate,
    this.controller,
    this.dateSelectedAction,
  });

  @override
  State<DatePickerStatefulWidget> createState() => DatePickerState();
}

class DatePickerState extends State<DatePickerStatefulWidget> {

  @override
  void initState() {
    super.initState();
  }

  Widget? createDatePickerWidget() {
    var dd = widget.controller!.text != '' ? DateFormat('dd-MM-yyyy').parse(widget.controller!.text) : DateTime.now();

    return DatePicker(
      padding: const EdgeInsets.all(6.0),
      minDate: widget.minDate!,
      maxDate: widget.maxDate!,
      initialDate: dd,
      selectedDate: dd,
      slidersColor: widget.buttonColor,
      leadingDateTextStyle: TextStyle(
        fontSize: 16.0,
        color: widget.buttonColor,
      ),
      currentDateTextStyle: TextStyle(
        color: widget.buttonColor,
      ),
      currentDateDecoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: widget.buttonColor!,
          width: 1.0,
        ),
      ),
      selectedCellDecoration: BoxDecoration(
        color: widget.buttonColor!,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
      ),
      onDateSelected: (value) {
        String dDate = DateFormat('dd-MM-yyyy').format(value);
        setState(() { widget.controller!.text = dDate; });
        if(widget.dateSelectedAction != null) { widget.dateSelectedAction!(); }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: widget.key,
      builder: (context, constraints) {
        widget.buildContext = context;
        widget.width        = constraints.maxWidth;
        widget.height       = constraints.maxWidth * 0.75;
        widget.padding      = widget.padding == null ? widget.padding : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        widget.margin       = widget.margin == null ? widget.margin : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

        return Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          margin: widget.margin,
          color: widget.backgroundColor,
          alignment: Alignment.center,
          child: createDatePickerWidget()!,
        );
      }
    );
  }

}