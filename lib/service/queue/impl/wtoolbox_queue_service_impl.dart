import 'dart:convert';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import 'package:wtoolbox/3rd_party/lib_uuid.dart';
import '../wtoolbox_queue_service.dart';
import '../../connector/wtoolbox_connector_service.dart';
import '../../../helper/logger/wtoolbox_logger.dart';
import '../../../observable/wtoolbox_observable.dart';
import '../../../entity/queue/queue.dart';
import '../../../repository/queue/in_queue/in_queue_repository.dart';
import '../../../repository/queue/out_queue/out_queue_repository.dart';

class WTQueueServiceImpl extends WTQueueService {

  @override
  Future<void> checkForUnSendMessages() async {
    List<Queue> list = await Get.find<OutQueueRepository>().getAll();

    if(list.isNotEmpty) {
      for(Queue q in list) {
        if(!q.headers!.containsKey('requestId')) { q.headers!['requestId'] = uuid.v4(); }
        q.headers!['transportId'] = q.id.toString();

        Get.find<WTConnectorService>().connected == true
          ? Get.find<WTConnectorService>().send(headers: q.headers, body: q.body)
          : WTLogger.write('QueueService.checkForUnSendMessages() wt_connector.error: Internet connection error.');
      }
    }
  }

  @override
  Future<void> send({ Map<String, String>? headers, Map<String, dynamic>? body }) async {
    Map<String, String>? wsHeaders = <String, String>{};
    if(headers!.isNotEmpty && !headers.containsKey('requestId')) { wsHeaders['requestId'] = uuid.v4(); }
    wsHeaders.addAll(headers);

    Queue? q = Queue(headers: headers, body: jsonEncode(body));
    await Get.find<OutQueueRepository>().insert(q);
    wsHeaders['transportId'] = q.id.toString();

    Get.find<WTConnectorService>().connected == true
      ? Get.find<WTConnectorService>().send(headers: wsHeaders, body: q.body)
      : WTLogger.write('QueueService.checkForUnSendMessages() wt_connector.error: Internet connection error.');
  }

  @override
  Future<void> receive({ Map<String, String>? headers, String? body }) async {
    if(body!.isNotEmpty) {
      if(body.contains('transportId')) {
        bool? deleted = await Get.find<OutQueueRepository>().deleteById(int.parse(json.decode(body)['transportId']));
        if(deleted) { WTLogger.write('QueueService.receive(): OutQueue message received successfully.'); }
      }

      if(!body.contains('transportId')) {
        Queue? q = Queue(headers: headers, body: jsonEncode(body));
        bool? created = await Get.find<InQueueRepository>().insert(q);
        if(created) { Get.find<WTObservable>().notifySubscriber({ 'application': q.application, 'queue': q }); }
      }
    }
  }

}