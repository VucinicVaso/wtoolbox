import 'dart:convert';
import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/logger/wtoolbox_logger.dart';
import 'package:wtoolbox/socket/wtoolbox_socket.dart';
import '../wtoolbox_message_broker.dart';
import '../wtoolbox_message_broker_service.dart';

class WTMessageBrokerServiceImpl extends WTMessageBrokerService {

  @override
  void subscribe(WTMessageBroker? broker) {
    if(brokers!.where((o) => o.getTitle() == broker!.getTitle()).isEmpty) {
      brokers!.add(broker!);
    }
  }

  @override
  void unsubscribe(String? title) {
    if(brokers!.where((o) => o.getTitle() == title).isNotEmpty) {
      brokers!.removeWhere((o) => o.getTitle() == title);
    }
  }

  @override
  void notifyBroker(Map<String, dynamic>? message) async {
    if(brokers!.where((o) => o.getTitle() == message!['header']['application']).isNotEmpty) {
      final broker = brokers!.firstWhere((o) => o.getTitle() == message!['header']['application']);
      broker.notify(message);
    }
  }

  @override
  Future<void> sendPending(List<Map<String, dynamic>>? messages) async {
    if(messages!.isEmpty) {
      WTLogger.write('WTMessageBrokerService.sendPending() 0 messages to send.');
    }

    if(messages.isNotEmpty) {
      if(Get.find<WTSocket>().connected == false) {
        WTLogger.write('WTMessageBrokerService.sendPending() error: WTSocket connection error.');
      }
      if(Get.find<WTSocket>().connected == true) {
        var socket = Get.find<WTSocket>();
        for(var m in messages) {
          socket.send(headers: m['headers'], body: m['body']);
        }
      }
    }
  }

  @override
  Future<void> send({ Map<String, String>? headers, Map<String, dynamic>? body }) async {
    Get.find<WTSocket>().connected == true
      ? Get.find<WTSocket>().send(headers: headers, body: jsonEncode(body))
      : WTLogger.write('WTMessageBrokerService.send() error: WTSocket connection error.');
  }

  @override
  Future<void> receive({ Map<String, String>? headers, String? body }) async {
    notifyBroker({ 'headers': headers, 'body': body });
  }

}