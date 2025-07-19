import 'dart:convert';
import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/logger/wtoolbox_logger.dart';
import 'package:wtoolbox/socket/wtoolbox_socket.dart';
import '../wtoolbox_notifier.dart';
import '../wtoolbox_notifier_service.dart';

class WTNotifierServiceImpl extends WTNotifierService {

  @override
  void subscribe(WTNotifier? notifier) {
    if(notifiers!.where((o) => o.getTitle() == notifier!.getTitle()).isEmpty) {
      notifiers!.add(notifier!);
    }
  }

  @override
  void unsubscribe(String? title) {
    if(notifiers!.where((o) => o.getTitle() == title).isNotEmpty) {
      notifiers!.removeWhere((o) => o.getTitle() == title);
    }
  }

  @override
  void notifySubscriber(Map<String, dynamic>? message) async {
    if(notifiers!.where((o) => o.getTitle() == message!['header']['application']).isNotEmpty) {
      final notifier = notifiers!.firstWhere((o) => o.getTitle() == message!['header']['application']);
      notifier.notify(message);
    }
  }

  @override
  Future<void> sendPending(List<Map<String, dynamic>>? messages) async {
    if(messages!.isEmpty) {
      WTLogger.write('WTNotifierService.sendPending() 0 messages to send.');
    }

    if(messages.isNotEmpty) {
      if(Get.find<WTSocket>().connected == false) {
        WTLogger.write('WTNotifierService.sendPending() error: Internet connection error.');
      }
      if(Get.find<WTSocket>().connected == true) {
        for(var m in messages) {
          Get.find<WTSocket>().send(headers: m['headers'], body: m['body']);
        }
      }
    }
  }

  @override
  Future<void> send({ Map<String, String>? headers, Map<String, dynamic>? body }) async {
    Get.find<WTSocket>().connected == true
      ? Get.find<WTSocket>().send(headers: headers, body: jsonEncode(body))
      : WTLogger.write('WTNotifierService.send() error: Internet connection error.');
  }

  @override
  Future<void> receive({ Map<String, String>? headers, String? body }) async {
    notifySubscriber({ 'headers': headers, 'body': body });
  }

}