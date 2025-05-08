import 'package:wtoolbox/3rd_party/lib_hive.dart';
import '../../../helper/logger/wtoolbox_logger.dart';
import '../../../entity/account/account.dart';
import '../account_repository.dart';

class HiveAccountRepository extends AccountRepository {

  Box? dbBox;
  final String dbCollectionName = 'wt_account_collection';

  @override
  Future<bool> initConnection(int? accountKey) async {
    String? dbBoxName = 'account_${accountKey.toString()}_$dbCollectionName';

    return Hive
      .openBox(dbBoxName)
      .then((v) {
        WTLogger.write('HiveAccountRepository.openBox(name: ${v.name}, isOpen: ${v.isOpen})');
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
        .then((v) {
          WTLogger.write('HiveAccountRepository.closeBox(name: ${dbBox!.name}, isOpen: ${dbBox!.isOpen})');
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
