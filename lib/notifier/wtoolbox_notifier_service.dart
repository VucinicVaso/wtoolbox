import 'wtoolbox_notifier.dart';

abstract class WTNotifierService {

  // list of notifiers
  List<WTNotifier>? notifiers = List<WTNotifier>.empty(growable: true);

  void subscribe(WTNotifier? notifier);

  void unsubscribe(String? name);

  void notifySubscriber(Map<String, dynamic>? message);

  Future<void> checkForUnSendMessages();

  Future<void> send({ Map<String, String>? headers, Map<String, dynamic>? body });

  Future<void> receive({ Map<String, String>? headers, String? body });

}