import '../wt_ui_widget.dart';

abstract class WTUIBody extends WTUIWidget {

  List<WTUIWidget>? widgets = List<WTUIWidget>.empty(growable: true);
  void addWidget(WTUIWidget? v) { widgets!.add(v!); }
  void addWidgets(List<WTUIWidget>? v) { widgets!.addAll(v!); }

}