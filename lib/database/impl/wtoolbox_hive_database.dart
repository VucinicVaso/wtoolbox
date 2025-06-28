import 'package:wtoolbox/external/lib_hive_flutter.dart';
import 'package:wtoolbox/external/lib_path_provider.dart';
import '../wtoolbox_database.dart';

class WTHiveDatabase extends WTDatabase {

  WTHiveDatabase() {
    createConnection();
  }

  @override
  Future<void> createConnection() async {
    await connectWithSupportDirectory();
  }

  Future<void> connectWithSupportDirectory() async {
    final appSupportDirectory = await getApplicationSupportDirectory();
    await Hive.initFlutter(appSupportDirectory.path);
  }

  Future<void> connectWithDocumentDirectory() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);
  }

  @override
  Future<void> closeConnection() async {
    await Hive.close();
  }

}