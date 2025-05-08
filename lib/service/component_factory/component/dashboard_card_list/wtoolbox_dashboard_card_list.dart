import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTDashboardCardList extends WTComponent {

  String? title;
  double? titleSize;
  Color? titleColor, titleBackgroundColor, titleBorderColor;
  void setTitle(String? v) { title = v; }
  void setTitleSize(double? v) { titleSize = v; }
  void setTitleColor(Color? v) { titleColor = v; }
  void setTitleBackgroundColor(Color? v) { titleBackgroundColor = v; }
  void setTitleBorderColor(Color? v) { titleBorderColor = v; }

  List<Widget>? cards = List<Widget>.empty(growable: true);
  void addCard(Widget? v) { cards!.add(v!); }
  void addCards(List<Widget>? v) { cards!.addAll(v!); }

}