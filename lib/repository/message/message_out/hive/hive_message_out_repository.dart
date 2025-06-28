import 'package:wtoolbox/external/lib_hive.dart';
import 'package:wtoolbox/logger/wtoolbox_logger.dart';
import 'package:wtoolbox/entity/message/message.dart';
import '../message_out_repository.dart';

class HiveMessageOutRepository extends MessageOutRepository {

  Box? dbBox;
  final String dbCollectionName = 'wt_mesage_out_collection';

  @override
  Future<bool> init(int? accountKey) async {
    String? dbBoxName = 'account_${accountKey.toString()}_$dbCollectionName';

    return await Hive
      .openBox(dbBoxName)
      .then((v) {
        WTLogger.write('HiveMessageOutRepository.openBox(name: ${v.name}, isOpen: ${v.isOpen})');
        if(!v.isOpen) { return false; }
        dbBox = v;
        return true;
    });
  }

  @override
  Future<void> close() async {
    if(dbBox!.isOpen) {
      await dbBox!
        .close()
        .then((v) async {
          WTLogger.write('HiveMessageOutRepository.closeBox(name: ${dbBox!.name}, isOpen: ${dbBox!.isOpen})');
          dbBox = null;
        });
    }
  }

  @override
  Future<bool> isEmpty() async { return dbBox!.isEmpty; }

  @override
  Future<bool> insert(Message? entity) async {
    try {
      entity!
        ..setKey(dbBox!.keys.isNotEmpty ? dbBox!.keys.last + 1 : 1)
        ..setDate(DateTime.now().toIso8601String());

      return await dbBox!
        .put(entity.key, entity.toJson())
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<bool> update(Message? entity) async {
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
      Message? entity = Message().fromJson(dbBox!.values.firstWhere((e) => e['id'] == queueId))!;
      entity.setRead(true);

      return await dbBox!
        .put(entity.key!, entity.toJson())
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<bool> delete(Message? entity) async {
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
      Message entity = Message().fromJson(dbBox!.values.firstWhere((e) => e['id'] == id))!;

      return await dbBox!
        .delete(entity.key!)
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<Message> getByKey(int? key) async {
    try {
      return Message().fromJson(dbBox!.values.firstWhere((e) => e['key'] == key))!;
    }catch (e) {
      return Message().empty()!;
    }
  }

  @override
  Future<Message> getById(int? id) async {
    try {
      return Message().fromJson(dbBox!.values.firstWhere((e) => e['id'] == id))!;
    }catch (e) {
      return Message().empty()!;
    }
  }

  @override
  Future<List<Message>> getAll() async {
    try{
      return dbBox!.values
        .where((e) => e['read'] == false)
        .map((e) => Message().fromJson(e)!)
        .toList();
    }catch (e) {
      return List<Message>.empty(growable: true);
    }
  }

}