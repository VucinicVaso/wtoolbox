import 'package:flutter/material.dart';
import '../wtoolbox_card_list.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardListOverview extends WTCardList {

  BoxDecoration? createBoxDecoration() {
    return BoxDecoration(
      color: backgroundColor!,
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      border: Border.all(width: 1, color: borderColor!),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: shadeColor!,
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  Widget? createHeader() {
    if(title == null) { return WTComponentBuilder.emptyComponent(); }

    return Flexible(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        width: width,
        child: WTComponentBuilder.createText(
          text: title,
          textAlign: TextAlign.left,
          textStyle: textStyle(
            textColor: titleColor,
            fontSize: titleSize,
            fontWeight: FontWeight.bold
          ),
        )!,
      ),
    );
  }

  Widget? bodyTitleWidget(Map? item) {
    if(item!['title'] == null) { return WTComponentBuilder.emptyComponent(); }

    return WTComponentBuilder.createText(
      text: item['title'],
      textStyle: textStyle(
        textColor: item['titleColor'],
        fontSize: item['titleSize'],
        fontWeight: FontWeight.bold
      ),
    )!;
  }

  Widget? bodySubtitleWidget(Map? item) {
    if(item!['subtitle'] == null) { return WTComponentBuilder.emptyComponent(); }

    return WTComponentBuilder.createText(
      text: item['subtitle'],
      textStyle: textStyle(
        textColor: item['subtitleColor'],
        fontSize: item['subtitleSize']
      ),
    )!;
  }

  Widget? bodyHeadingWidget(Map? item) {
    if(item!['heading'] == null) { return WTComponentBuilder.emptyComponent(); }

    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.all(0.0),
      child: WTComponentBuilder.createText(
        text:  item['heading'],
        textStyle: textStyle(
          textColor: item['headingColor'],
          fontSize: item['headingSize'],
          fontWeight: FontWeight.bold
        ),
      )!,
    );
  }

  /// components || items
  Widget? createBody() {
    List<Widget>? list = List<Widget>.empty(growable: true);

    if(components!.isNotEmpty) { list.addAll(components!); }

    if(items!.isNotEmpty) {
      double itemIconSize     = width! * 0.65;
      double itemTitleSize    = width! * 0.4;
      double itemSubtitleSize = width! * 0.4;
      double itemHeadingSize  = width! * 0.4;

      for(var item in items!) {
        item['itemIconSize']     = itemIconSize;
        item['itemTitleSize']    = itemTitleSize;
        item['itemSubtitleSize'] = itemSubtitleSize;
        item['itemHeadingSize']  = itemHeadingSize;

        Widget w = GestureDetector(
          onTap: item['action'] ?? () {},
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /// icon
                Container(
                  padding: const EdgeInsets.all(5.0),
                  child: WTComponentBuilder.createIcon(
                    iconData: Icons.circle,
                    color: item['iconColor'],
                    size: item['iconSize']
                  ),
                ),

                /// title, subtitle
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(0.0),
                    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        bodyTitleWidget(item)!,      /// title
                        const SizedBox(height: 5.0),
                        bodySubtitleWidget(item)!,   /// subtitle
                      ],
                    ),
                  ),
                ),

                /// heading
                bodyHeadingWidget(item)!,
              ],
            ),
          ),
        );

        list.add(w);
      }
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      width: double.infinity,
      height: width! * 0.55,
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...list,
          ],
        ),
      ),
    );
  }

  /// buttonLabel
  Widget? createFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(0.0),
      margin: const EdgeInsets.all(0.0),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: action ?? () {},
        child: Container(
          padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          margin: const EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
          decoration: BoxDecoration(
            color: buttonBackgroundColor!,
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
            border: Border.all(width: 1, color: buttonBackgroundColor!),
          ),
          child: WTComponentBuilder.createText(
            text:      buttonLabel,
            textAlign: TextAlign.center,
            textStyle: textStyle(textColor: buttonLabelColor, fontSize: buttonLabelSize),
          ),
        ),
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width            = constraints.maxWidth;
        height           = constraints.maxWidth;
        titleSize        = width! * 0.05;
        buttonLabelSize  = width! * 0.05;

        return Container(
          padding: padding,
          margin: margin,
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: createBoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              createHeader()!, /// title
              createBody()!,   /// components || items
              createFooter()!, /// buttonLabel
            ],
          ),
        );
      },
    );
  }

}