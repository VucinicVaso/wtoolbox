import 'package:flutter/material.dart';
import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/application_lifecycle/wtoolbox_application_lifecycle.dart';
import '../wtoolbox_scaffold.dart';

class WTScaffoldImpl extends WTScaffold {

  @override
  Widget? build() {
    return ComponentWidget(
      key:             getUniqueKey(),
      globalKey:       globalKey,
      unfocused:       unfocused,
      backgroundColor: backgroundColor,
      onSwipeAction:   onSwipeAction,
      header:          header,
      body:            body,
      flyMenu:         flyMenu,
      footer:          footer,
    );
  }

}

// ignore: must_be_immutable
class ComponentWidget extends StatefulWidget {

  GlobalKey? globalKey;
  bool? unfocused;
  Color? backgroundColor;
  PreferredSizeWidget? header;
  Widget? body, flyMenu, footer;
  VoidCallback? onSwipeAction;

  ComponentWidget({
    super.key,
    this.globalKey,
    this.unfocused,
    this.backgroundColor,
    this.onSwipeAction,
    this.header,
    this.body,
    this.flyMenu,
    this.footer,
  });

  @override
  State<ComponentWidget> createState() => _ComponentWidgetState();

}

class _ComponentWidgetState extends State<ComponentWidget> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    Get.find<WTApplicationLifecycle>().didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    if(widget.unfocused!) {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if(!currentFocus.hasPrimaryFocus) { currentFocus.unfocus(); }
    }

    return PopScope(
      canPop: widget.onSwipeAction != null ? true : false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if(widget.onSwipeAction != null) { 
          Future.delayed(
            Duration.zero,
            () { widget.onSwipeAction!(); }
          );

          true;
        }else {
          false;
        }
      },
      child: Scaffold(
        key: widget.globalKey,
        backgroundColor: widget.backgroundColor,
        appBar: widget.header,
        body: widget.body,
        floatingActionButton: widget.flyMenu,
        bottomNavigationBar: widget.footer,
      ),
    );
  }

}