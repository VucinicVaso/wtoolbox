import 'package:flutter/material.dart';
import '../../wtoolbox_component_builder.dart';
import '../wtoolbox_input_button.dart';

class WTCheckBoxBasic extends WTInputButton {

  @override
  Widget? build() {
    return CheckboxWidget(
      key:               getUniqueKey(),
      textStyle:         textStyle,
      action:            action,
      backgroundColor:   backgroundColor,
      padding:           padding,
      margin:            margin,
      isChecked:         checked,
      activeIcon:        activeIcon,
      activeIconColor:   activeIconColor,
      activeIconSize:    activeIconSize,
      inactiveIcon:      inactiveIcon,
      inactiveIconColor: inactiveIconColor,
      inactiveIconSize:  inactiveIconSize,
      label:             label,
      labelColor:        labelColor,
      labelSize:         labelSize,
    );
  }

}

// ignore: must_be_immutable
class CheckboxWidget extends StatefulWidget {

  Function? textStyle;
  Function? action;
  EdgeInsets? padding, margin;
  bool? isChecked;
  String? label;
  IconData? activeIcon, inactiveIcon;
  Color? activeIconColor, inactiveIconColor, backgroundColor, labelColor;
  double? activeIconSize, inactiveIconSize, labelSize;

  CheckboxWidget({
    super.key,
    this.textStyle,
    this.action,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.isChecked,
    this.activeIcon,
    this.activeIconColor,
    this.activeIconSize,
    this.inactiveIcon,
    this.inactiveIconColor,
    this.inactiveIconSize,
    this.label,
    this.labelColor,
    this.labelSize,
  });

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();

}

class _CheckboxWidgetState extends State<CheckboxWidget> {

  EdgeInsets? padding, margin;
  bool? isChecked = false;
  String? label;
  IconData? activeIcon, inactiveIcon;
  Color? activeIconColor, inactiveIconColor, backgroundColor, labelColor;
  double? activeIconSize, inactiveIconSize, labelSize;

  @override
  void initState() {
    setInitialData();
    super.initState();
  }

  void setInitialData() {
    setState(() {
      backgroundColor   = widget.backgroundColor;
      padding           = widget.padding;
      margin            = widget.margin;
      isChecked         = widget.isChecked;
      label             = widget.label;
      labelSize         = widget.labelSize;
      labelColor        = widget.labelColor;
      activeIcon        = widget.activeIcon;
      activeIconSize    = widget.activeIconSize;
      activeIconColor   = widget.activeIconColor;
      inactiveIcon      = widget.inactiveIcon;
      inactiveIconColor = widget.inactiveIconColor;
      inactiveIconSize  = widget.inactiveIconSize;
    });
  }

  void check() {
    setState(() { isChecked = isChecked == false ? true : false; });
    widget.action!();
  }

  Widget? createCheckbox() {
    Widget? icon = isChecked!
      ? WTComponentBuilder.createIcon(iconData: activeIcon, size: activeIconSize, color: activeIconColor)!
      : WTComponentBuilder.createIcon(iconData: inactiveIcon, size: inactiveIconSize, color: inactiveIconColor)!;

    return GestureDetector(
      onTap: () => check(),
      child: icon,
    );
  }

  Widget? createLabel() {
    if(label == null) { return WTComponentBuilder.emptyComponent(); }

    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
        child: Text(
          label!,
          style: widget.textStyle!(
            textColor: labelColor,
            fontSize: labelSize,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double? width    = constraints.maxWidth;
        activeIconSize   = width * 0.1;
        inactiveIconSize = width * 0.1;
        labelSize        = width * 0.045;

        return Container(
          key: widget.key,
          width: width,
          padding: padding,
          margin: margin,
          color: backgroundColor,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              createCheckbox()!,
              createLabel()!,
            ],
          ),
        );
      }
    );
  }

}