import 'package:wtoolbox/external/lib_hive.dart';
import 'package:wtoolbox/logger/wtoolbox_logger.dart';
import 'package:wtoolbox/entity/account/account.dart';
import '../account_repository.dart';

class AccountRepositoryHive extends AccountRepository {

  Box? dbBox;
  final String dbCollectionName = 'wtoolbox_account_collection';

  @override
  Future<bool> init(int? accountKey) async {
    String? dbBoxName = 'account_${accountKey.toString()}_$dbCollectionName';

    return Hive
      .openBox(dbBoxName)
      .then((v) {
        WTLogger.write('AccountRepositoryHive.init(name: ${v.name}, isOpen: ${v.isOpen})');
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
        .then((v) {
          WTLogger.write('AccountRepositoryHive.close(name: ${dbBox!.name}, isOpen: ${dbBox!.isOpen})');
          dbBox = null;
        });
    }
  }

  @override
  Future<bool> isEmpty() async { return dbBox!.isEmpty; }

  @override
  Future<bool> insert(Account? entity) async {
    try{
      entity!
        ..setKey(dbBox!.keys.isNotEmpty ? dbBox!.keys.last + 1 : 1)
        ..setDate(DateTime.now().toUtc().toLocal().toString());

      return await dbBox!
        .put(entity.key, entity.toJson())
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<bool> update(Account? entity) async {
    try {
      return await dbBox!
        .put(entity!.key!, entity.toJson())
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<bool> delete(Account? entity) async {
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
  Future<Account> getByKey(int? key) async {
    try {
      return Account().fromJson(dbBox!.values.firstWhere((e) => e['key'] == key))!;
    }catch (e) {
      return Account().empty()!;
    }
  }

  @override
  Future<List<Account>> getAll() async {
    try{
      return dbBox!.values
        .map((e) => Account().fromJson(e)!)
        .toList();
    }catch (e) {
      return List<Account>.empty(growable: true);
    }
  }

  @override
  Future<Account> getSelected() async {
    try {
      return Account().fromJson(dbBox!.values.firstWhere((e) => e['selected'] == true))!;
    } catch(e) {
      return Account().empty()!;
    }
  }

}
