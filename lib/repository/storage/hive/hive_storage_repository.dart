import 'package:wtoolbox/3rd_party/lib_hive.dart';
import '../../../helper/logger/wtoolbox_logger.dart';
import '../storage_repository.dart';
import '../../../entity/storage/storage.dart';

class HiveStorageRepository extends StorageRepository {

  Box? dbBox;
  final String dbCollectionName = 'wt_storage_collection';

  @override
  Future<bool> initConnection(int? accountKey) async {
    String? dbBoxName = 'account_${accountKey.toString()}_$dbCollectionName';

    return Hive
      .openBox(dbBoxName)
      .then((v) {
        WTLogger.write('HiveStorageRepository.openBox(name: ${v.name}, isOpen: ${v.isOpen})');
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
          WTLogger.write('HiveStorageRepository.closeBox(name: ${dbBox!.name}, isOpen: ${dbBox!.isOpen})');
          dbBox = null;
        });
    }
  }

  @override
  Future<bool> isEmpty() async { return dbBox!.isEmpty; }

  @override
  Future<bool> insert(Storage? entity) async {
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
  Future<bool> update(Storage? entity) async {
    try {
      return await dbBox!
        .put(entity!.key!, entity.toJson())
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<bool> delete(Storage? entity) async {
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
    try {
      return await dbBox!
        .deleteAll(dbBox!.keys)
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<List<Storage>> getAll() async {
    try {
      return dbBox!.values
        .map((e) => Storage().fromJson(e)!)
        .toList();
    }catch (e) {
      return List<Storage>.empty(growable: true);
    }
  }

  @override
  Future<Storage> getByKey(int? key) async {
    try {
      return Storage().fromJson(dbBox!.values.firstWhere((e) => e['key'] == key))!;
    }catch (e) {
      return Storage().empty()!;
    }
  }

  @override
  Future<Storage> getByFileReference(String? fileReference) async {
    try {
      return Storage().fromJson(dbBox!.values.firstWhere((e) => e['data']['fileReference'] == fileReference))!;
    }catch (e) {
      return Storage().empty()!;
    }
  }

}