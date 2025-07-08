import 'package:wtoolbox/external/lib_hive.dart';
import 'package:wtoolbox/logger/wtoolbox_logger.dart';
import 'package:wtoolbox/entity/message/message.dart';
import '../message_in_repository.dart';

class HiveMessageInRepository extends MessageInRepository {

  Box? dbBox;
  final String dbCollectionName = 'wt_message_in_collection';

  @override
  Future<bool> init(int? accountKey) async {
    String? dbBoxName = 'account_${accountKey.toString()}_$dbCollectionName';

    return await Hive
      .openBox(dbBoxName)
      .then((v) {
       WTLogger.write('HiveMessageInRepository.openBox(name: ${v.name}, isOpen: ${v.isOpen})');
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
          WTLogger.write('HiveMessageInRepository.closeBox(name: ${dbBox!.name}, isOpen: ${dbBox!.isOpen})');
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
  Future<bool> deleteAllByAppName({ String? applicationName, bool? isRead }) async {
    try {
      Iterable<dynamic> keys = dbBox!.values
        .where((e) => e['headers']['application'] == applicationName)
        .where((e) => e['read'] == isRead)
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
      Message? entity = Message().fromJson(dbBox!.values.firstWhere((e) => e['id'] == id))!;

      return await dbBox!
        .delete(entity.key!)
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<List<Message>> getAll() async {
    try{
      return dbBox!.values
        .map((e) => Message().fromJson(e)!)
        .toList();
    }catch (e) {
      return List<Message>.empty(growable: true);
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
  Future<int> getLast() async {
    try {
      return dbBox!.values.last['id'];
    }catch (e) {
      return 0;
    }
  }

  @override
  Future<List<Message>> getAllByAppName({ String? applicationName, bool? isRead }) async {
    try {
      return dbBox!.values
        .where((e) => e['headers']['application'] == applicationName)
        .where((e) => e['read'] == isRead)
        .map((e) => Message().fromJson(e)!)
        .toList();
    }catch (e) {
      return List<Message>.empty(growable: true);
    }
  }

}