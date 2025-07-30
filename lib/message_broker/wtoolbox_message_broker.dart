abstract class WTMessageBroker {

  // broker title
  String? _title;
  void setTitle(String v) { _title = v; }
  String? getTitle() { return _title; }

  // notify broker when it receives new message
  void notify(Map<String, dynamic>? message);

  // send unsend messages
  Future<void> sendPending();

}
