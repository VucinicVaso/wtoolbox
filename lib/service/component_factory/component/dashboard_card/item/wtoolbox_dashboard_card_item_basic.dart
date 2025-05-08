import 'package:flutter/material.dart';
import '../wtoolbox_dashboard_card.dart';
import '../../wtoolbox_component_builder.dart';

class WTDashboardCardItemBasic extends WTDashboardCard {

  /// icon, title
  Widget? createHeader() {
    if(title!.isEmpty && iconData == null) { return WTComponentBuilder.emptyComponent(); }

    double containerWidth  = width! * 0.95;
    double containerHeight = width! * 0.15;

    titleSize = title!.length <= 24 ? width! * 0.05 : width! * 0.035;
    iconSize  = width! * 0.05;

    Widget? iconWidget = iconData != null
      ? WTComponentBuilder.createIcon(
          iconData: iconData,
          size:     iconSize,
          color:    iconColor
        )
      : WTComponentBuilder.emptyComponent();

    Widget? spaceWidget = iconData != null && title != null
      ? WTComponentBuilder.sizedComponent(width: 10.0)!
      : WTComponentBuilder.emptyComponent()!;

    Widget? textWidget = title!.isNotEmpty
      ? Flexible(
          child: WTComponentBuilder.createText(
            text:       title,
            color:      titleColor,
            size:       titleSize,
            textAlign:  TextAlign.start,
            fontWeight: FontWeight.bold
          )!,
        )
      : WTComponentBuilder.emptyComponent();

    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
      margin: const EdgeInsets.all(0.0),
      alignment: Alignment.centerLeft,
      width: containerWidth,
      height: containerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          iconWidget!,
          spaceWidget,
          textWidget!,
        ],
      ),
    );
  }

  /// itemCardList
  Widget? createBody() {
    double containerWidth = width! * 0.95;

    List<Widget>? widgets = List<Widget>.empty(growable: true);

    if(itemCardList!.isNotEmpty) {
      for(int i = 0; i < itemCardList!.length; i++) {
        Map<String, dynamic>? m = itemCardList![i];
        m['labelSize'] = width! * 0.04;

        Widget? w = GestureDetector(
          onTap: m.containsKey('route') ? m['route'] : () {},
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(0.0),
            decoration: itemCardList![i] != itemCardList!.last
              ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.grey)
                  )
                )
              : BoxDecoration(
                  border: Border.all(color: Colors.transparent, width: 0.0)
                ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /// LeftTop, RightTop
                ItemHelper.createLeftAndRightTopWidget(m)!,
                m.containsKey('leftCenter') || m.containsKey('rightCenter') ? const SizedBox(height: 5.0) : const SizedBox.shrink(),

                /// LeftCenter, RightCenter
                ItemHelper.createLeftAndRightCenterWidget(m)!,
                m.containsKey('leftBottom') || m.containsKey('rightBottom') ? const SizedBox(height: 5.0) : const SizedBox.shrink(),

                /// LeftBottom, RightBottom
                ItemHelper.createLeftAndRightBottomWidget(m)!,
              ],
            ),
          ),
        );

        widgets.add(w);
      }
    }

    return Expanded(
      child: Container(
        width: containerWidth,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...widgets,
            ],
          ),
        ),
      ),
    );
  }

  /// button
  Widget? createFooter() {
    if(buttonLabel!.isEmpty && buttonIcon == null) { return WTComponentBuilder.emptyComponent(); }

    double containerWidth  = width! * 0.95;
    double containerHeight = width! * 0.2;
    buttonLabelSize        = width! * 0.045;
    buttonIconSize         = width! * 0.05;

    Widget? textWidget = buttonLabel!.isNotEmpty
      ? WTComponentBuilder.createText(
          text:      buttonLabel,
          color:     buttonLabelColor,
          size:      buttonLabelSize,
          textAlign: TextAlign.center
        )
      : WTComponentBuilder.emptyComponent();

    Widget? spaceWidget = buttonLabel != null && buttonIcon != null
      ? WTComponentBuilder.sizedComponent(width: 10.0)!
      : WTComponentBuilder.emptyComponent()!;

    Widget? iconWidget = buttonIcon != null
      ? WTComponentBuilder.createIcon(
          iconData: buttonIcon,
          size:     buttonIconSize,
          color:    buttonIconColor
        )
      : WTComponentBuilder.emptyComponent();

    Widget? buttonWidget = GestureDetector(
      onTap: buttonAction!,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            textWidget!,
            spaceWidget,
            iconWidget!,
          ],
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      alignment: Alignment.center,
      width: containerWidth,
      height: containerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buttonWidget,
        ],
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width   = constraints.maxWidth;
        height  = constraints.maxWidth;
        padding = padding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        margin  = margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

        return Container(
          key: getUniqueKey(),
          padding: padding,
          margin: margin,
          width: width,
          height: height,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: backgroundColor!,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            border: Border.all(
              width: 1,
              color: borderColor!
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: shadeColor!,
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              createHeader()!, /// icon, title
              createBody()!,   /// itemCardList
              createFooter()!, /// button
            ],
          ),
        );
      }
    );
  }

}

class ItemHelper {

  static Widget? createTextMain({
    String? text,
    Color? textColor,
    double? textSize,
    TextAlign? textAlign,
    FontWeight? fontWeight
  }) {
    return Expanded(
      child: Container(
        child: WTComponentBuilder.createText(
          text:       text,
          color:      textColor,
          size:       textSize,
          textAlign:  textAlign,
          fontWeight: fontWeight
        ),
      ),
    );
  }

  static Widget? createTextRegular({
    String? text,
    Color? textColor,
    double? textSize,
    TextAlign? textAlign,
    FontWeight? fontWeight
  }) {
    return Expanded(
      child: Container(
        child: WTComponentBuilder.createText(
          text:       text,
          color:      textColor,
          size:       textSize,
          textAlign:  textAlign,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  static Widget? createBadge({
    String? text,
    Color? textColor,
    double? textSize,
    Color? badgeColor
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
      margin: const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: WTComponentBuilder.createText(
        text:      text!,
        color:     textColor,
        size:      textSize,
        textAlign: TextAlign.center
      )!,
    );
  }

  static Widget? createLeftAndRightTopWidget(Map<String, dynamic>? map) {
    if(!map!.containsKey('leftTop') && !map.containsKey('rightTop')) { return WTComponentBuilder.emptyComponent()!; }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        /// LeftTop
        map.containsKey('leftTop')
          ? map['leftTop']!['uiComponent'] == 'textMain'
            ? createTextMain(
                text:       map['leftTop']!['dataValue'],
                textColor:  map['leftTop']!['uiColor'],
                textSize:   map['labelSize'],
                textAlign:  TextAlign.start,
                fontWeight: FontWeight.bold
              )!
            : map['leftTop']!['uiComponent'] == 'textRegular'
            ? createTextRegular(
                text:       map['leftTop']!['dataValue'],
                textColor:  map['leftTop']!['uiColor'],
                textSize:   map['labelSize'],
                textAlign:  TextAlign.start,
                fontWeight: FontWeight.bold
              )!
            : WTComponentBuilder.emptyComponent()!
          : WTComponentBuilder.emptyComponent()!,

        /// RightTop
        map.containsKey('rightTop')
          ? map['rightTop']!['uiComponent'] == 'textMain'
            ? createTextMain(
                text:       map['RightTop']!['dataValue'],
                textColor:  map['RightTop']!['uiColor'],
                textSize:   map['labelSize'],
                textAlign:  TextAlign.end,
                fontWeight: FontWeight.bold
              )!
            : map['rightTop']!['uiComponent'] == 'textRegular'
              ? createTextRegular(
                  text:       map['rightTop']!['dataValue'],
                  textColor:  map['rightTop']!['uiColor'],
                  textSize:   map['labelSize'],
                  textAlign:  TextAlign.end,
                  fontWeight: FontWeight.bold
                )!
              : WTComponentBuilder.emptyComponent()!
          : WTComponentBuilder.emptyComponent()!
      ],
    );
  }

  static Widget? createLeftAndRightCenterWidget(Map<String, dynamic>? map) {
    if(!map!.containsKey('leftCenter') && !map.containsKey('rightCenter')) { return WTComponentBuilder.emptyComponent()!; }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        /// LeftCenter
        map.containsKey('leftCenter')
          ? map['leftCenter']!['uiComponent'] == 'textMain'
            ? createTextMain(
                text:       map['leftCenter']!['dataValue'],
                textColor:  map['leftCenter']!['uiColor'],
                textSize:   map['labelSize'],
                textAlign:  TextAlign.start,
                fontWeight: FontWeight.bold
              )!
            : map['leftCenter']!['uiComponent'] == 'textRegular'
              ? createTextRegular(
                  text:       map['leftCenter']!['dataValue'],
                  textColor:  map['leftCenter']!['uiColor'],
                  textSize:   map['labelSize'],
                  textAlign:  TextAlign.start,
                  fontWeight: FontWeight.bold
                )!
              : WTComponentBuilder.emptyComponent()!
          : WTComponentBuilder.emptyComponent()!,

        /// RightCenter
        map.containsKey('rightCenter')
          ? map['rightCenter']!['uiComponent'] == 'textMain'
            ? createTextMain(
                text:       map['rightCenter']!['dataValue'],
                textColor:  map['rightCenter']!['uiColor'],
                textSize:   map['labelSize'],
                textAlign:  TextAlign.end,
                fontWeight: FontWeight.bold
              )!
            : map['rightCenter']!['uiComponent'] == 'textRegular'
              ? createTextRegular(
                  text:       map['rightCenter']!['dataValue'],
                  textColor:  map['rightCenter']!['uiColor'],
                  textSize:   map['labelSize'],
                  textAlign:  TextAlign.end,
                  fontWeight: FontWeight.bold
                )!
            : WTComponentBuilder.emptyComponent()!
          : WTComponentBuilder.emptyComponent()!
      ],
    );
  }

  static Widget? createLeftAndRightBottomWidget(Map<String, dynamic>? map) {
    if(!map!.containsKey('leftBottom') && !map.containsKey('rightBottom')) { return WTComponentBuilder.emptyComponent()!; }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        /// LeftBottom
        map.containsKey('leftBottom')
          ? map['leftBottom']!['uiComponent'] == 'badge'
            ? createBadge(
                text:       map['leftBottom']!['dataValue'],
                textSize:   map['labelSize'],
                textColor:  Colors.white,
                badgeColor: map['leftBottom']!['uiColor']
              )!
            : WTComponentBuilder.emptyComponent()!
          : WTComponentBuilder.emptyComponent()!,

        /// RightBottom
        map.containsKey('rightBottom')
          ? map['rightBottom']!['uiComponent'] == 'textMain'
            ? createTextMain(
                text:       map['rightBottom']!['dataValue'],
                textColor:  map['RightBottom']!['uiColor'],
                textSize:   map['labelSize'],
                textAlign:  TextAlign.end,
                fontWeight: FontWeight.bold
              )!
            : map['rightBottom']!['uiComponent'] == 'textRegular'
              ? createTextRegular(
                  text:       map['rightBottom']!['dataValue'],
                  textColor:  map['rightBottom']!['uiColor'],
                  textSize:   map['labelSize'],
                  textAlign:  TextAlign.end,
                  fontWeight: FontWeight.bold
                )!
              : WTComponentBuilder.emptyComponent()!
          : WTComponentBuilder.emptyComponent()!
      ],
    );
  }

}