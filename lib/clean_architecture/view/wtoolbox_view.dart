import 'package:flutter/material.dart';
import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/ui_factory/factory/wt_ui_factory.dart';

//ignore: must_be_immutable
abstract class WTView<T> extends StatelessWidget {

  WTView({ super.key }) {
    initUIFactory();
  }

  T? controller;
  void setController(T? wtController) { controller = wtController; }

  WTUIFactory? uiFactory;
  void initUIFactory() { uiFactory = Get.find<WTUIFactory>(); }

}