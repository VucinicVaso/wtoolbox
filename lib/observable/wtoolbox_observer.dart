abstract class WTObserver {

  // observer name
  String? _name;
  void setName(String s) { _name = s; }
  String? getName() { return _name; }

  // notify observer when webSocket receives new message
  void notify(Map<String, dynamic>? message);

}
