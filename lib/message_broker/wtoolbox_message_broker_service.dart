import 'wtoolbox_message_broker.dart';

abstract class WTMessageBrokerService {

  // list of notifiers
  List<WTMessageBroker>? brokers = List<WTMessageBroker>.empty(growable: true);

  // subscribe application broker
  void subscribe(WTMessageBroker? broker);

  // unsubscribe message brokers
  void unsubscribe(String? title);

  // notify application message broker when it receives new message
  void notifyBroker(Map<String, dynamic>? message);

  // send unsend messages
  Future<void> sendPending(List<Map<String, dynamic>>? messages);

  // send message
  Future<void> send({ Map<String, String>? headers, Map<String, dynamic>? body });

  // receive message
  Future<void> receive({ Map<String, String>? headers, String? body });
}