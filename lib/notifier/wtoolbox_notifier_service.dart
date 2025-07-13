import 'wtoolbox_notifier.dart';

abstract class WTNotifierService {

  // list of notifiers
  List<WTNotifier>? notifiers = List<WTNotifier>.empty(growable: true);

  // subscribe application notifier
  void subscribe(WTNotifier? notifier);

  // unsubscribe message notifier
  void unsubscribe(String? title);

  // notify application subscriber when it receives new message
  void notifySubscriber(Map<String, dynamic>? message);

  // send unsend messages
  Future<void> sendPending(List<Map<String, dynamic>>? messages);

  // send message
  Future<void> send({ Map<String, String>? headers, Map<String, dynamic>? body });

  // receive message
  Future<void> receive({ Map<String, String>? headers, String? body });
}