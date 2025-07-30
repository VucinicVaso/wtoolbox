import 'wtoolbox_message_broker.dart';

abstract class WTMessageBrokerService {

  // list of brokers
  List<WTMessageBroker>? brokers = List<WTMessageBroker>.empty(growable: true);

  // subscribe application message broker
  void subscribe(WTMessageBroker? broker);

  // unsubscribe application message broker
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