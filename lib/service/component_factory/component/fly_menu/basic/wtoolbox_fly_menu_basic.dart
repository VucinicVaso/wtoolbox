import 'package:flutter/material.dart';
import '../wtoolbox_fly_menu.dart';
import '../../wtoolbox_component_builder.dart';

class WTFlyMenuBasic extends WTFlyMenu {

  Widget? createHeaderWidget() {
    if(linkAction == null && linkLabel == null && linkDescription == null) { return WTComponentBuilder.emptyComponent(); }

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
    if(linkLabel != '') {
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
          onTap: () {
            showAwaitArea(false);
            showMessageArea(false);
            showMainArea(true);
            if(linkAction != null) { linkAction!(); }
          },
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

    Widget? linkDescriptionWidget = WTComponentBuilder.emptyComponent()!;
    if(linkDescription != '') {
      linkDescriptionWidget = Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        color: Colors.transparent,
        child: WTComponentBuilder.createText(
          text: linkDescription,
          color: linkDescriptionColor,
          size: linkDescriptionSize,
          fontWeight: FontWeight.normal
        )!,
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
          topRight: Radius.circular(20)
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

          /// linkDescription
          linkDescriptionWidget,
        ],
      ),
    );
  }

  Widget? mainAreaActionsWidget() {
    if(actions == null || actions!.isEmpty) { return WTComponentBuilder.emptyComponent(); }

    List<Widget>? list = List<Widget>.empty(growable: true);
    for(var a in actions!) {
      /// icon
      Widget? iconWidget = WTComponentBuilder.emptyComponent();
      if(a.containsKey('icon')) {
        iconWidget = Container(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          margin: const EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
          alignment: Alignment.center,
          color: actionIconBackgroundColor,
          child: WTComponentBuilder.createIcon(
            iconData: a['icon'],
            size: actionIconSize,
            color: actionIconColor
          ),
        );
      }

      /// label
      Widget? labelWidget = Expanded(child: WTComponentBuilder.emptyComponent()!);
      if(a.containsKey('label')) {
        labelWidget = Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            margin: const EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
            alignment: Alignment.centerLeft,
            color: Colors.transparent,
            child: WTComponentBuilder.createText(
              text: a['label'],
              textAlign: TextAlign.left,
              textStyle: textStyle(
                textColor: actionLabelColor,
                fontSize: a['label']!.length > 30 ? actionLabelSize! * 0.8 : actionLabelSize,
                fontWeight: FontWeight.normal
              ),
            )!,
          ),
        );
      }

      Widget w = GestureDetector(
        key: getUniqueKey(),
        onTap: () {
          showMainArea(false);
          if(a['action']!= null) { a['action']!(); }
          showAwaitArea(true);
        },
        child: Container(
          width:     width,
          color:     Colors.transparent,
          alignment: Alignment.center,
          padding:   const EdgeInsets.fromLTRB(5.0, 2.5, 5.0, 2.5),
          margin:    const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 15.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              iconWidget!, /// icon,
              labelWidget, /// label
            ],
          ),
        ),
      );

      list.add(w);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ...list,
      ],
    );
  }

  Widget? mainAreaComponentsWidget() {
    if(components == null || components!.isEmpty) { return WTComponentBuilder.emptyComponent(); }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ...components!,
      ],
    );
  }

  Widget? mainAreaWidget() {
    if(!mainAreaShow!) { return WTComponentBuilder.emptyComponent(); }

    return Container(
      color: Colors.transparent,
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          mainAreaActionsWidget()!,
          mainAreaComponentsWidget()!,
        ],
      ),
    );
  }

  Widget? awaitAreaWidget() {
    if(!awaitAreaShow!) { return WTComponentBuilder.emptyComponent(); }

    return Container(
      width: width,
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      margin: const EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 25.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /// icon
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
            child: CircularProgressIndicator(
              color: awaitIconColor,
              backgroundColor: awaitIconBackgroundColor,
            ),
          ),

          /// label
          Container(
            child: WTComponentBuilder.createText(
              text: awaitLabel,
              textAlign: TextAlign.center,
              textStyle: textStyle(
                textColor: awaitLabelColor,
                fontSize: awaitLabelSize,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget? messageAreaWidget(List<Map<String, dynamic>>? data) {
    if(data!.isEmpty) { return WTComponentBuilder.emptyComponent(); }

    List<Widget>? list = List<Widget>.empty(growable: true);
    for(var m in data) {
      list.add(
        GestureDetector(
          onTap: () => m['action'],
          child: Container(
            width: width,
            color: Colors.transparent,
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(5.0, 2.5, 5.0, 2.5),
            margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /// icon
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  margin: const EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
                  alignment: Alignment.center,
                  child: m.containsKey('type') 
                    ? m['type'] == 'ERROR' 
                      ? WTComponentBuilder.createIcon(
                          iconData: messageDangerIcon,
                          color: messageDangerColor,
                          size: messageIconSize
                        )
                      : m['type'] == 'SUCCESS'
                        ? WTComponentBuilder.createIcon(
                            iconData: messageSuccessIcon,
                            color: messageSuccessColor,
                            size: messageIconSize
                          )
                        : WTComponentBuilder.createIcon(
                            iconData: messageInfoIcon,
                            color: messageInfoColor,
                            size: messageIconSize,
                          )
                    : WTComponentBuilder.createIcon(
                        iconData: messageInfoIcon,
                        color: messageInfoColor,
                        size: messageIconSize,
                      ),
                ),

                /// label
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                    margin: const EdgeInsets.fromLTRB(2.5, 2.5, 2.5, 2.5),
                    child: WTComponentBuilder.createText(
                      text: m['label'],
                      textStyle: textStyle(
                        textColor: messageLabelColor,
                        fontSize: m['label'].length > 45 ? messageLabelSize! * 0.8 : messageLabelSize,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...list,
        ],
      ),
    );
  }

  Widget? createBodyWidget(List<Map<String, dynamic>>? data) {
    return Container(
      width: width,
      color: backgroundColor,
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Wrap(
        children: <Widget>[
          data!.isNotEmpty
            ? FutureBuilder(
                future: Future.delayed(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                    ? awaitAreaWidget()!        /// await area
                    : messageAreaWidget(data)!; /// message area
                },
              )
            : mainAreaWidget()!,                /// main area
        ],
      ),
    );
  }

  Future? createModal() async {
    showMainArea(true);
    showAwaitArea(false);
    showMessageArea(false);

    showDialog(
      context: buildContext!,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          key: getUniqueKey(),
          initialChildSize: 0.50,
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
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20)
                  ),
                ),
                padding: const EdgeInsets.all(0.0),
                margin: const EdgeInsets.all(0.0),
                child: ValueListenableBuilder<List<Map<String, dynamic>>>(
                  valueListenable: messageValueNotifier!,
                  builder: (context, value, child) {
                    return ListView(
                      controller: controller,
                      children: <Widget>[
                        createHeaderWidget()!,    /// header
                        createBodyWidget(value)!, /// body
                      ],
                    );
                  }
                ),
              ),
            );
          }
        );
      }
    );
  }

  @override
  Widget? build() {
    linkIconSize        = width! * 0.07;
    linkLabelSize       = width! * 0.045;
    linkDescriptionSize = width! * 0.035;
    actionIconSize      = width! * 0.065;
    actionLabelSize     = width! * 0.045;
    awaitLabelSize      = width! * 0.045;
    messageIconSize     = width! * 0.065;
    messageLabelSize    = width! * 0.045;

    return FloatingActionButton(
      heroTag: getUniqueKey(),
      backgroundColor: iconBackgroundColor,
      onPressed: () async => await createModal(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0)
      ),
      child: WTComponentBuilder.createIcon(
        iconData: icon,
        size: iconSize,
        color: iconColor,
      )!,
    );
  }

}
