import 'application_starter/wtoolbox_application_starter.dart';

abstract class WToolbox {

  Future<void> open({ String? envFile });

  Future<void> close();

  Future<void> registerApplicationStarters({ WTApplicationStarter? initialStarter, List<WTApplicationStarter>? starters });

  void registerRoutes({ String? initialRoute, String? redirectRoute, String? logoutRoute });

}