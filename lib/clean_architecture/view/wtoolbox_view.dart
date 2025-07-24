import 'package:flutter/material.dart';
import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/widget_factory/factory/wtoolbox_widget_factory.dart';

//ignore: must_be_immutable
abstract class WTView<T> extends StatelessWidget {

  WTView({ super.key }) {
    initWidgetBuilder();
  }

  T? controller;
  void setController(T? wtController) { controller = wtController; }

  WTWidgetFactory? widgetBuilder;
  void initWidgetBuilder() { widgetBuilder = Get.find<WTWidgetFactory>(); }

}