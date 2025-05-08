import 'package:wtoolbox/3rd_party/lib_hive_flutter.dart';
import 'package:wtoolbox/3rd_party/lib_path_provider.dart';
import '../wtoolbox_database_service.dart';

class WTHiveDatabaseService extends WTDatabaseService {

  @override
  Future<void> init() async {
    await initWithSupportDirectory();
  }

  Future<void> initWithSupportDirectory() async {
    final appSupportDirectory = await getApplicationSupportDirectory();
    await Hive.initFlutter(appSupportDirectory.path);
  }

  Future<void> initWithDocumentDirectory() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);
  }

  @override
  Future<void> close() async {
    await Hive.close();
  }

}