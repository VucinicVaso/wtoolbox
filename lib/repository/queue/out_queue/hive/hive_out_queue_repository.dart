import 'package:wtoolbox/3rd_party/lib_hive.dart';
import '../../../../helper/logger/wtoolbox_logger.dart';
import '../../../../entity/queue/queue.dart';
import '../out_queue_repository.dart';

class HiveOutQueueRepository extends OutQueueRepository {

  Box? dbBox;
  final String dbCollectionName = 'wt_out_queue_collection';

  @override
  Future<bool> initConnection(int? accountKey) async {
    String? dbBoxName = 'account_${accountKey.toString()}_$dbCollectionName';

    return await Hive
      .openBox(dbBoxName)
      .then((v) {
        WTLogger.write('HiveOutQueueRepository.openBox(name: ${v.name}, isOpen: ${v.isOpen})');
        if(!v.isOpen) { return false; }
        dbBox = v;
        return true;
    });
  }

  @override
  Future<void> closeConnection() async {
    if(dbBox!.isOpen) {
      await dbBox!
        .close()
        .then((v) async {
          WTLogger.write('HiveOutQueueRepository.closeBox(name: ${dbBox!.name}, isOpen: ${dbBox!.isOpen})');
          dbBox = null;
        });
    }
  }

  @override
  Future<bool> isEmpty() async { return dbBox!.isEmpty; }

  @override
  Future<bool> insert(Queue? entity) async {
    try {
      entity!.setKey(dbBox!.keys.isNotEmpty ? dbBox!.keys.last + 1 : 1);

      return await dbBox!
        .put(entity.key, entity.toJson())
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<bool> update(Queue? entity) async {
    try {
      entity!.setRead(true);

      return await dbBox!
        .put(entity.key!, entity.toJson())
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateById(int? queueId) async {
    try {
      Queue? qE = Queue().fromJson(dbBox!.values.firstWhere((e) => e['id'] == queueId))!;
      qE.setRead(true);

      return await dbBox!
        .put(qE.key!, qE.toJson())
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<bool> delete(Queue? entity) async {
    try {
      return await dbBox!
        .delete(entity!.key!)
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteAll() async {
    try{
      return await dbBox!
        .deleteAll(dbBox!.keys)
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteAllRead({ bool? read }) async {
    try {
      Iterable<dynamic> keys = dbBox!.values.where((e) => e['read'] == read!).map<int>((e) => e['key']);

      return await dbBox!
        .deleteAll(keys)
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteById(int? id) async {
    try {
      Queue qE = Queue().fromJson(dbBox!.values.firstWhere((e) => e['id'] == id))!;

      return await dbBox!
        .delete(qE.key!)
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<Queue> getByKey(int? key) async {
    try {
      return Queue().fromJson(dbBox!.values.firstWhere((e) => e['key'] == key))!;
    }catch (e) {
      return Queue().empty()!;
    }
  }

  @override
  Future<Queue> getById(int? id) async {
    try {
      return Queue().fromJson(dbBox!.values.firstWhere((e) => e['id'] == id))!;
    }catch (e) {
      return Queue().empty()!;
    }
  }

  @override
  Future<List<Queue>> getAll() async {
    try{
      return dbBox!.values
        .where((e) => e['read'] == false)
        .map((e) => Queue().fromJson(e)!)
        .toList();
    }catch (e) {
      return List<Queue>.empty(growable: true);
    }
  }

}