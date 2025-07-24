import 'package:flutter/material.dart';
import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/application_lifecycle/wtoolbox_application_lifecycle.dart';
import '../wt_scaffold.dart';
import '../../header/wt_header.dart';
import '../../body/wt_body.dart';
import '../../floating_menu/wt_floating_menu.dart';
import '../../footer/wt_footer.dart';

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
      floatingMenu:    floatingMenu,
      footer:          footer,
    );
  }

}

// ignore: must_be_immutable
class ComponentWidget extends StatefulWidget {

  GlobalKey? globalKey;
  bool? unfocused;
  Color? backgroundColor;
  WTHeader? header;
  WTBody? body;
  WTFloatingMenu? floatingMenu;
  WTFooter? footer;
  VoidCallback? onSwipeAction;

  ComponentWidget({
    super.key,
    this.globalKey,
    this.unfocused,
    this.backgroundColor,
    this.onSwipeAction,
    this.header,
    this.body,
    this.floatingMenu,
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
    Get.find<WTApplicationLifecycle>().didAppLifecycleStateChanged(state);
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
      child: LayoutBuilder(
        builder: (context, contraints) {
          double? width  = contraints.maxWidth;
          double? height = contraints.maxHeight;
          
          widget.header?.setWidth(width);
          widget.body?..setWidth(width)..setHeight(height);
          widget.floatingMenu?..setWidth(width)..setHeight(height);       
          widget.footer?..setWidth(width)..setHeight(height);
          
          return Scaffold(
            key: widget.globalKey,
            backgroundColor: widget.backgroundColor,
            appBar: widget.header?.build(),
            body: widget.body?.build(),
            floatingActionButton: widget.floatingMenu?.build(),
            bottomNavigationBar: widget.footer?.build(),
          );
        }
      ),
    );
  }

}