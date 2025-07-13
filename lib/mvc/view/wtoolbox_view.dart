import 'package:flutter/material.dart';
import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/widget_factory/factory/wtoolbox_widget_factory.dart';

//ignore: must_be_immutable
abstract class WTView<T> extends StatelessWidget {

  WTView({ super.key }) {
    setComponentFactory();
  }

  T? controller;
  void setController(T? wtController) { controller = wtController; }

  WTWidgetFactory? widgetFactory;
  void setComponentFactory() {
    widgetFactory = Get.find<WTWidgetFactory>()..initialize();
    if(widgetFactory!.isInitialized!) {
      widgetFactory!
        ..setDeviceWidth(Get.width)
        ..setDeviceHeight(Get.height);
    }
  }

}