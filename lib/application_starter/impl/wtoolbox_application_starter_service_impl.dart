import '../wtoolbox_application_starter.dart';
import '../wtoolbox_application_starter_service.dart';

class WTApplicationStarterServiceImpl extends WTApplicationStarterService {

  @override
  Future<void> registerInitialApplicationStarter(WTApplicationStarter? starter) async {
    await starter!.register();
    initialStarter = starter;
  }
  @override
  Future<void> unregisterInitialApplicationStarter() async {
    await initialStarter!.unregister();
  }

  @override
  void addApplicationStarter(WTApplicationStarter? starter) {
    starters!.add(starter!);
  }

  @override
  Future<void> registerApplicationStarter(WTApplicationStarter? starter) async {
    await starter!.register();
    starters!.add(starter);
  }
  @override
  Future<void> unregisterApplicationStarter(String? title) async {
    WTApplicationStarter? starter = starters!.firstWhere((p) => p.getTitle() == title);
    await starter.unregister();
    starters!.removeWhere((p) => p.getTitle() == starter.getTitle());
  }

  @override
  Future<void> registerApplicationStarters() async {
    for(var s in starters!) {
      await s.register(); 
    }
  }
  @override
  Future<void> unregisterApplicationStarters() async {
    for(var s in starters!) { 
      await s.unregister(); 
    }
  }

}