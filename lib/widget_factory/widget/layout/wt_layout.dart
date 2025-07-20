import '../wt_widget.dart';

abstract class WTLayout extends WTWidget {

  bool? scrollable = false;
  void setScrollable() { scrollable = true; }

  bool? expandable = false;
  void setExpandable() { expandable = true; }

  // 0 padding and margin
  void flat() {
    setPadding(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0);
    setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0);
  }

  List<WTWidget>? components = List<WTWidget>.empty(growable: true);
  void addComponent(WTWidget? v) { components!.add(v!); }
  void addComponents(List<WTWidget>? v) { components!.addAll(v!); }

}