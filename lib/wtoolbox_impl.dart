import 'external/lib_getx.dart';
import 'dependency_container/wt_dependency_container.dart';
import 'dependency_container/impl/wt_dependency_container_impl.dart';
import 'application_starter/wtoolbox_application_starter.dart';
import 'application_starter/wtoolbox_application_starter_service.dart';
import 'router/wtoolbox_router.dart';
import 'wtoolbox.dart';

class WToolboxImpl extends WToolbox {

  WTDependencyContainer? dependecyContainer;

  @override
  Future<void> open({ String? envFile }) async {
    dependecyContainer = WTDependencyContainerImpl();
    await dependecyContainer!.register(dotenvFile: envFile);
  }

  @override
  Future<void> close() async {
    await dependecyContainer!.unregister();
  }

  @override
  Future<void> registerApplicationStarters({ WTApplicationStarter? initialStarter, List<WTApplicationStarter>? starters }) async {
    var applicationStarterService = Get.find<WTApplicationStarterService>();

    await applicationStarterService.registerInitialApplicationStarter(initialStarter);

    if(starters!.isNotEmpty) {
      for(WTApplicationStarter s in starters) {
        applicationStarterService.addApplicationStarter(s);
      }
    }
  }

  @override
  void registerRoutes({ String? initialRoute, String? redirectRoute, String? logoutRoute }) {
    var router = Get.find<WTRouter>();

    router
      ..setInitialRoute(initialRoute)
      ..setRedirectRoute(redirectRoute)
      ..setLogoutRoute(logoutRoute);
    }

}

WToolbox wtoolbox = WToolboxImpl();