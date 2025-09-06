import '../wt_ui_component.dart';

abstract class WTUIBody extends WTUIComponent {

  List<WTUIComponent>? widgets = List<WTUIComponent>.empty(growable: true);
  void addWidget(WTUIComponent? v) { widgets!.add(v!); }
  void addWidgets(List<WTUIComponent>? v) { widgets!.addAll(v!); }

}