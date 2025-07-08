abstract class WTNotifier {

  // notifier title
  String? _title;
  void setTitle(String s) { _title = s; }
  String? getTitle() { return _title; }

  // notify notifer when notifer receives new message
  void notify(Map<String, dynamic>? message);

}
