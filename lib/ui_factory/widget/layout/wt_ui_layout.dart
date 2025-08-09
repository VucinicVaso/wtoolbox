import '../wt_ui_widget.dart';

abstract class WTUILayout extends WTUIWidget {

  // layout size
  bool? small, medium, large = false;
  void sm() { small = true; }
  void md() { medium = true; }
  void lg() { large = true; }

  // 0 padding and margin
  void flat() {
    setPadding(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0);
    setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0);
  }

  List<WTUIWidget>? widgets = List<WTUIWidget>.empty(growable: true);
  void addWidget(WTUIWidget? v) { widgets!.add(v!); }
  void addWidgets(List<WTUIWidget>? v) { widgets!.addAll(v!); }

}