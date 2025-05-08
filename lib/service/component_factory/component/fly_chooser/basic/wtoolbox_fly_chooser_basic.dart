import 'package:flutter/material.dart';
import '../../wtoolbox_component_builder.dart';
import '../wtoolbox_fly_chooser.dart';

class WTFlyChooserBasic extends WTFlyChooser {

  Widget? createHeaderWidget() {
    if(linkLabel == null && linkAction == null) { return WTComponentBuilder.emptyComponent(); }

    Widget? scrolledPointerWidget = WTComponentBuilder.emptyComponent()!;
    scrolledPointerWidget = Container(
      width: 50.0,
      height: 3.0,
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 10.0),
      alignment: Alignment.center,
      color: Colors.grey.shade300,
      child: WTComponentBuilder.emptyComponent(),
    );

    Widget? linkLabelWidget = WTComponentBuilder.emptyComponent()!;
    if(linkLabel != null) {
      linkLabelWidget = Container(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        color: Colors.transparent,
        child: WTComponentBuilder.createText(
          text: linkLabel,
          color: linkLabelColor,
          size: linkLabelSize,
          fontWeight: FontWeight.bold
        )!,
      );
    }

    Widget? linkActionIconWidget = WTComponentBuilder.emptyComponent()!;
    if(linkIcon != null) {
      linkActionIconWidget = Container(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        color: Colors.transparent,
        child: GestureDetector(
          onTap: linkAction != null
            ? () { linkAction!(); }
            : () { Navigator.pop(buildContext!); },
          onDoubleTap: () {}, 
          onSecondaryTap: () {}, 
          child: WTComponentBuilder.createIcon(
            iconData: linkIcon!,
            color: linkIconColor,
            size: linkIconSize,
          )!,
        ),
      );
    }

    return Container(
      width: width,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /// scrolled pointer
          scrolledPointerWidget,

          /// linkLabel && linkAction
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                linkLabelWidget,
                linkActionIconWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget? createBodyWidget() {
    Widget? componentsWidget = WTComponentBuilder.emptyComponent();
    if(components != null || components!.isEmpty == false) {
      componentsWidget = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ...components!,
        ],
      ); 
    }

    return Container(
      width: width,
      color: backgroundColor,
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Wrap(
        children: <Widget>[
          componentsWidget!,
        ],
      ),
    );
  }

  Future? createModal() async {
    showDialog(
      context: buildContext!,
      builder: (BuildContext context) {
        isExpanded = MediaQuery.of(context).viewInsets != EdgeInsets.zero ? true : false;

        buildContext  = context;
        linkLabelSize = width! * 0.045;
        linkIconSize  = width! * 0.07;

        return DraggableScrollableSheet(
          key: getUniqueKey(),
          initialChildSize: isExpanded == true ? 0.94 : 0.50,
          minChildSize: 0.2,
          maxChildSize: 0.95,
          builder: (_, controller) {
            return AlertDialog(
              alignment: Alignment.bottomCenter,
              backgroundColor: Colors.transparent,
              iconPadding: const EdgeInsets.all(0.0),
              contentPadding: const EdgeInsets.all(0.0),
              buttonPadding: const EdgeInsets.all(0.0),
              actionsPadding: const EdgeInsets.all(0.0),
              insetPadding: const EdgeInsets.all(0.0),
              content: Container(
                key: getUniqueKey()!,
                width: width,
                padding: const EdgeInsets.all(0.0),
                margin: const EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20)
                  ),
                ),
                child: ListView(
                  controller: controller,
                  children: <Widget>[
                    createHeaderWidget()!, /// header
                    createBodyWidget()!,   /// body
                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }

  @override
  Future? build() async {
    await createModal();
  }

}