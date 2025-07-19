abstract class WTNotifier {

  // notifier title
  String? _title;
  void setTitle(String v) { _title = v; }
  String? getTitle() { return _title; }

  // notify notifer when notifer receives new message
  void notify(Map<String, dynamic>? message);

  // send unsend messages
  Future<void> sendPending();

}
