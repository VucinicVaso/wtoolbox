import 'package:flutter/material.dart';
import '../wtoolbox_widget.dart';

abstract class WTBody extends WTWidget {

  List<Widget>? widgets = List<Widget>.empty(growable: true);
  void addWidget(Widget? v) { widgets!.add(v!); }
  void addWidgets(List<Widget>? v) { widgets!.addAll(v!); }

}