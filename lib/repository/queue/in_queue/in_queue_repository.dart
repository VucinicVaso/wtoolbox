import '../../wtoobox_repository.dart';
import '../../../entity/queue/queue.dart';

abstract class InQueueRepository extends WTRepository<Queue>  {

  // delete all queues by application name, optional param read (if read == true = delete all read, else if read == false delete all unread, else delete all)
  Future<bool> deleteAllByAppName({ String? applicationName, bool? isRead });

  // delete queue by db id
  Future<bool> deleteById(int? id);

  // get one queue by db id
  Future<Queue> getById(int? id);

  // get last in queue db id
  Future<int> getLast();

  // get all unread queues by application name && isRead (if isRead = true (get all read), else if isRead = false (get all unread), else get all (read and unread))
  Future<List<Queue>> getAllByAppName({ String? applicationName, bool? isRead });

}