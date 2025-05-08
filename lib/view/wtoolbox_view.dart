import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import 'package:wtoolbox/controller/wtoolbox_controller.dart';
import '../service/component_factory/factory/wtoolbox_component_factory_service.dart';
import '../service/component_factory/variant/impl1/wtoolbox_component_variant.dart';

//ignore: must_be_immutable
abstract class WTView<T> extends StatelessWidget {

  WTView({ super.key }) {
    setComponentFactory();
  }

  T? controller;
  void setController(T? wtController) { controller = wtController; }

  WTComponentFactoryService? componentFactory;
  void setComponentFactory() {
    componentFactory = Get.find<WTComponentFactoryService>(); 
    componentFactory!.initComponentConfiguration();
  }

  Future<void>? flyChooser({
    String? linkLabel = '',
    Function? linkAction,
    List<Widget>? components,
    bool? expanded = false,
  }) async {
    var c = controller as WTController;

    var component = Get.find<WTComponentFactoryService>().createFlyChooser(WTFlyChooserVariant.basic)!
      ..setLinkLabel(linkLabel)
      ..setLinkAction(linkAction != null ? () { linkAction(); } : () { c.closeWindow(); })
      ..expanded(expanded)
      ..addComponents(components);
    
    return await component.build()!;
  }

  Widget? flyMenu({
    String? linkLabel = '',
    String? linkDescription = '',
    List<Widget>? mainArea,
    List<Map<String, dynamic>>? actions,
  }) {
    var c = controller as WTController;
    
    List<Widget>? mainAreaWidgets = List<Widget>.empty(growable: true);
    if(mainArea != null && mainArea.isEmpty == false) { mainAreaWidgets.addAll(mainArea); }

    List<Map<String, dynamic>>? actionsWidgets = List<Map<String, dynamic>>.empty(growable: true);
    if(actions != null && actions.isEmpty == false) { actionsWidgets.addAll(actions); }

    var flyMenu = Get.find<WTComponentFactoryService>().createFlyMenu(WTFlyMenuVariant.basic)!
      ..setMessageValueNotifier(c.messageNotifier)
      ..showMainArea(true)
      ..showAwaitArea(false)
      ..showMessageArea(false)
      ..setLinkAction(() {
        c.clearMessages();
        c.closeWindow();
      })
      ..setLinkLabel(linkLabel)
      ..setLinkDescription(linkDescription)
      ..addComponents(mainAreaWidgets)
      ..addActions(actionsWidgets);
    return flyMenu.build();
  }

}