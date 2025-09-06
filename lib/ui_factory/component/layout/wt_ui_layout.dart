import '../wt_ui_component.dart';

abstract class WTUILayout extends WTUIComponent {

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

  List<WTUIComponent>? components = List<WTUIComponent>.empty(growable: true);
  void addWidget(WTUIComponent? v) { components!.add(v!); }
  void addWidgets(List<WTUIComponent>? v) { components!.addAll(v!); }

}