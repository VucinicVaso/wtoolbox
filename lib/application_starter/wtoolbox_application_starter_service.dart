import 'wtoolbox_application_starter.dart';

abstract class WTApplicationStarterService {

  WTApplicationStarter? initialStarter;
  Future<void> registerInitialApplicationStarter(WTApplicationStarter? starter);
  Future<void> unregisterInitialApplicationStarter();

  List<WTApplicationStarter>? starters = List.empty(growable: true);
  void addApplicationStarter(WTApplicationStarter? starter);
  
  Future<void> registerApplicationStarter(WTApplicationStarter? starter);
  Future<void> unregisterApplicationStarter(String? title);
  Future<void> registerApplicationStarters();
  Future<void> unregisterApplicationStarters();

}