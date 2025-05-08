import 'package:wtoolbox/3rd_party/lib_hive.dart';
import '../../../helper/logger/wtoolbox_logger.dart';
import '../theme_repository.dart';
import '../../../entity/theme/wt_theme.dart';

class HiveThemeRepository extends ThemeRepository {

  Box? dbBox;
  final String dbCollectionName = 'wt_theme_collection';

  @override
  Future<bool> initConnection(int? accountKey) async {
    String? dbBoxName = 'account_${accountKey.toString()}_$dbCollectionName';

    return await Hive
      .openBox(dbBoxName)
      .then((v) async {
        WTLogger.write('HiveThemeRepository.openBox(name: ${v.name}, isOpen: ${v.isOpen})');
        if(!v.isOpen) { return false; }
        dbBox = v;
        if(dbBox!.isEmpty) {
          await insert(
            WTTheme()
              ..setKey(1)
              ..setDate(DateTime.now().toUtc().toLocal().toString())
              ..setTitle('Light')
              ..setSelected(true)
              ..setTheme({
                'base1': 0xFFffffff,
                'base2': 0xFFf3f5f7,
                'text1': 0xFF192434,
                'text2': 0xFF253445,
                'text3': 0xFF616d7c,
                'text4': 0xFF8893a1,
                'text5': 0xFFc4cad3,
                'primary1': 0xFF006af6,
                'primary2': 0xFF005fdb,
                'primary3': 0xFF3d8ffb,
                'primary4': 0xFFe4f0ff,
                'primary5': 0xFFffffff,
                'error1': 0xFFe21d11,
                'error2': 0xFFca140c,
                'error3': 0xFFf38e89,
                'error4': 0xFFfde8e7,
                'error5': 0xFFffffff,
                'success1': 0xFF148444,
                'success2': 0xFF087637,
                'success3': 0xFF8bc3a2,
                'success4': 0xFFe8f3ec,
                'success5': 0xFFffffff,
                'shade1': 0xFF192434,
                'shade2': 0xFF253446,
                'shade3': 0xFF414d5e,
                'shade4': 0xFF626d7c,
                'shade5': 0xFF77828f,
                'shade6': 0xFF8893a1,
                'shade7': 0xFFa9b1bc,
                'shade8': 0xFFc4cad3,
                'shade9': 0xFFdbdfe5,
                'shade10': 0xFFe7ebef,
                'shade11': 0xFFf3f5f7
              })
          );
          await insert(
            WTTheme()
              ..setKey(2)
              ..setDate(DateTime.now().toUtc().toLocal().toString())
              ..setTitle('Dark')
              ..setSelected(false)
              ..setTheme({
                'base1': 0xFF223248,
                'base2': 0xFF2b3d52,
                'text1': 0xFFf5f9ff,
                'text2': 0xFFd7e0ec,
                'text3': 0xFFa0b0c4,
                'text4': 0xFF7588a0,
                'text5': 0xFF53667f,
                'primary1': 0xFF0e6ce9,
                'primary2': 0xFF8fbdf9,
                'primary3': 0xFF5585c1,
                'primary4': 0xFF223d5e,
                'primary5': 0xFFffffff,
                'error1': 0xFFe1231a,
                'error2': 0xFFff9e99,
                'error3': 0xFF834950,
                'error4': 0xFF3e394a,
                'error5': 0xFFffffff,
                'success1': 0xFF148444,
                'success2': 0xFF0fd965,
                'success3': 0xFF1a945c,
                'success4': 0xFF20464c,
                'success5': 0xFFffffff,
                'shade1': 0xFFf5f9ff,
                'shade2': 0xFFd7e0ec,
                'shade3': 0xFFbbc8d9,
                'shade4': 0xFFa0b0c4,
                'shade5': 0xFF8799af,
                'shade6': 0xFF7588a0,
                'shade7': 0xFF63778f,
                'shade8': 0xFF53667f,
                'shade9': 0xFF44566e,
                'shade10': 0xFF36485f,
                'shade11': 0xFF2b3d52
              })
          );
        }
      return true;
    });
  }

  @override
  Future<void> closeConnection() async {
    if(dbBox!.isOpen) {
      await dbBox!
        .close()
        .then((v) async {
          WTLogger.write('HiveThemeRepository.closeBox(name: ${dbBox!.name}, isOpen: ${dbBox!.isOpen})');
          dbBox = null;
        });
    }
  }

  @override
  Future<bool> isEmpty() async { return dbBox!.isEmpty; }

  @override
  Future<bool> insert(WTTheme? entity) async {
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
  Future<bool> update(WTTheme? entity) async {
    try {
      return await dbBox!
        .put(entity!.key!, entity.toJson())
        .then((v) => true);
    }catch (e) {
      return false;
    }
  }

  @override
  Future<bool> delete(WTTheme? entity) async {
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
  Future<List<WTTheme>> getAll() async {
    try {
      return dbBox!.values
        .map((e) => WTTheme().fromJson(e)!)
        .toList();
    }catch (e) {
      return List<WTTheme>.empty(growable: true);
    }
  }

  @override
  Future<WTTheme> getByKey(int? key) async {
    try {
      return WTTheme().fromJson(dbBox!.values.firstWhere((e) => e['key'] == key))!;
    }catch (e) {
      return WTTheme().empty()!;
    }
  }

  @override
  Future<WTTheme> getSelected() async {
    try {
      return WTTheme().fromJson(dbBox!.values.firstWhere((e) => e['selected'] == true))!;
    }catch (e) {
      return WTTheme().empty()!;
    }
  }

}