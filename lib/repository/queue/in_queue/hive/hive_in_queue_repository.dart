import 'package:wtoolbox/3rd_party/lib_hive.dart';
import '../../../../helper/logger/wtoolbox_logger.dart';
import '../../../../entity/queue/queue.dart';
import '../in_queue_repository.dart';

class HiveInQueueRepository extends InQueueRepository {

  Box? dbBox;
  final String dbCollectionName = 'wt_in_queue_collection';

  @override
  Future<bool> initConnection(int? accountKey) async {
    String? dbBoxName = 'account_${accountKey.toString()}_$dbCollectionName';

    return await Hive
      .openBox(dbBoxName)
      .then((v) {
       WTLogger.write('HiveInQueueRepository.openBox(name: ${v.name}, isOpen: ${v.isOpen})');
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
          WTLogger.write('HiveInQueueRepository.closeBox(name: ${dbBox!.name}, isOpen: ${dbBox!.isOpen})');
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
  Future<bool> deleteAllByAppName({ String? applicationName, bool? isRead }) async {
    try {
      Iterable<dynamic> keys = dbBox!.values
        .where((e) => e['application'] == applicationName && e['read'] == isRead)
        .map<dynamic>((e) => e['key']);

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
      Queue? qE = Queue().fromJson(dbBox!.values.firstWhere((e) => e['id'] == id))!;

      return await dbBox!
        .delete(qE.key!)
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<List<Queue>> getAll() async {
    try{
      return dbBox!.values
        .map((e) => Queue().fromJson(e)!)
        .toList();
    }catch (e) {
      return List<Queue>.empty(growable: true);
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
  Future<int> getLast() async {
    try {
      return dbBox!.values.last['id'];
    }catch (e) {
      return 0;
    }
  }

  @override
  Future<List<Queue>> getAllByAppName({ String? applicationName, bool? isRead }) async {
    try {
      return dbBox!.values
        .where((e) => e['read'] == isRead && e['application'] == applicationName)
        .map((e) => Queue().fromJson(e)!)
        .toList();
    }catch (e) {
      return List<Queue>.empty(growable: true);
    }
  }

}