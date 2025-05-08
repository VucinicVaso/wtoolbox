import '../../wtoobox_repository.dart';
import '../../../entity/queue/queue.dart';

abstract class OutQueueRepository extends WTRepository<Queue> {

  // update queue by queue id to read = true
  Future<bool> updateById(int? queueId);

  // delete all queues, optional param read (if read == true = delete all read, else if read == false delete all unread, else delete all)
  Future<bool> deleteAllRead({ bool? read });

  // delete queue by queue db id
  Future<bool> deleteById(int? id);

  // get one queue by queue db id
  Future<Queue> getById(int? id);

}