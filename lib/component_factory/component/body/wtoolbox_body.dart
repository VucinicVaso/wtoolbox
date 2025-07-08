import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTBody extends WTComponent {

  List<Widget>? components = List<Widget>.empty(growable: true);
  void addComponent(Widget? v) { components!.add(v!); }
  void addComponents(List<Widget>? v) { components!.addAll(v!); }

}