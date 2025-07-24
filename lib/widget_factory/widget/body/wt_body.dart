import '../wt_widget.dart';

abstract class WTBody extends WTWidget {

  List<WTWidget>? widgets = List<WTWidget>.empty(growable: true);
  void addWidget(WTWidget? v) { widgets!.add(v!); }
  void addWidgets(List<WTWidget>? v) { widgets!.addAll(v!); }

}