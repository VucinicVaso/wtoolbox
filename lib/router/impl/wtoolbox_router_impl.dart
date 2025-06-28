import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/application_starter/wtoolbox_application_starter.dart';
import '../wtoolbox_router.dart';

class WTRouterImpl extends WTRouter {

  @override
  void setInitialRoute(String? route) { initialRoute = route!; }
  @override
  String? getInitialRoute() { return initialRoute!; }

  @override
  void setRedirectRoute(String? route) { redirectRoute = route; }
  @override
  String? getRedirectRoute() { return redirectRoute; }

  @override
  void setLogoutRoute(String? route) { logoutRoute = route; }
  @override
  String? getLogoutRoute() { return logoutRoute; }

  @override
  List<GetPage>? getRoutes() { return routes; }

  @override
  void registerRoutes(List<GetPage<dynamic>>? list) {
    for(var l in list!) { routes!.add(l); }
    Get.routeTree.routes.clear();
    Get.routeTree.routes.addAll(routes!);
  }
  @override
  void unregisterRoutes(List<GetPage<dynamic>>? list) {
    for(var l in list!) { routes!.removeWhere((r) => r.name == l.name); }
    Get.routeTree.routes.clear();
    Get.routeTree.routes.addAll(routes!);
  }

  @override
  void registerApplicationStarter(WTApplicationStarter? starter) {
    starters!.add(starter!);
  }
  @override
  Future<void> unregisterApplicationStarter(String? title) async {
    WTApplicationStarter? starter = starters!.firstWhere((p) => p.getTitle() == title);
    await starter.unregister();
    starters!.removeWhere((p) => p.getTitle() == starter.getTitle());
  }
  @override
  Future<void> registerApplicationStarters() async {
    for(WTApplicationStarter? s in starters!) {
      await s!.register();
    }
  }
  @override
  Future<void> unregisterApplicationStarters() async {
    for(WTApplicationStarter? s in starters!) {
      await s!.unregister();
    }
  }

}