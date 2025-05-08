import 'dart:convert';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import 'package:wtoolbox/3rd_party/lib_uuid.dart';
import '../../../entity/account/account.dart';
import '../wtoolbox_queue_service.dart';
import '../../connector/wtoolbox_connector_service.dart';
import '../../../helper/logger/wtoolbox_logger.dart';
import '../../../observable/wtoolbox_observable.dart';
import '../../../entity/queue/queue.dart';
import '../../../repository/queue/in_queue/in_queue_repository.dart';
import '../../../repository/queue/out_queue/out_queue_repository.dart';

class WTQueueServiceImpl extends WTQueueService {

  @override
  Future<void> checkForUnSendMessages({ Account? account }) async {
    final Map<String, String> headers = <String, String>{};
    headers['token']    = '';
    headers['deviceId'] = '';
    headers['user']     = '';

    List<Queue> list = await Get.find<OutQueueRepository>().getAll();

    for(Queue q in list) {
      if(!q.headers!.containsKey('requestId')) { q.headers!['requestId'] = uuid.v4(); }
      q.headers!['transportId'] = q.id.toString();
      q.headers!.addAll(headers);

      Get.find<WTConnectorService>(tag: 'wt_connector').connected == true
        ? Get.find<WTConnectorService>(tag: 'wt_connector').send(headers: q.headers, body: q.body)
        : WTLogger.write('QueueService.checkForUnSendMessages() wt_connector.error: Internet connection error.');
    }
  }

  @override
  Future<void> send({ Map<String, String>? headers, Map<String, dynamic>? body, Account? account }) async {
    Map<String, String>? wsHeaders = <String, String>{};
    wsHeaders = {
      'token':    '',
      'deviceId': '',
      'user':     '',
    };
    if(headers!.isNotEmpty && !headers.containsKey('requestId')) { wsHeaders['requestId'] = uuid.v4(); }
    wsHeaders.addAll(headers);

    Queue? q = Queue().fromJson(headers, jsonEncode(body));
    await Get.find<OutQueueRepository>().insert(q);
    wsHeaders['transportId'] = q!.id.toString();

    Get.find<WTConnectorService>(tag: 'wt_connector').connected == true
      ? Get.find<WTConnectorService>(tag: 'wt_connector').send(headers: wsHeaders, body: q.body)
      : WTLogger.write('QueueService.checkForUnSendMessages() wt_connector.error: Internet connection error.');
  }

  @override
  Future<void> receive({ Map<String, String>? headers, String? body, Account? account }) async {
    if(body!.isNotEmpty) {
      if(body.contains('transportId')) {
        bool? deleted = await Get.find<OutQueueRepository>().deleteById(int.parse(json.decode(body)['transportId']));
        if(deleted) { WTLogger.write('QueueService.receive(): OutQueue message received successfully.'); }
      }

      if(!body.contains('transportId')) {
        Queue q = Queue.fromJson(headers, body);
        bool? created = await Get.find<InQueueRepository>().insert(q);
        if(created) { Get.find<WTObservable>().notifySubscriber({ 'application': q.application, 'queue': q }); }
      }
    }
  }

}