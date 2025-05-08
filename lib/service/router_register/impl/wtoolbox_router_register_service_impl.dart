import 'package:wtoolbox/3rd_party/lib_getx.dart';
import '../wtoolbox_router_register_service.dart';
import '../../../bootstrap/wtoolbox_bootstrap.dart';

class WTRouterRegisterServiceImpl extends WTRouterRegisterService {

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
  void addPackage(WTBootstrap? bootstrap) {
    packages!.add(bootstrap!);
  }
  @override
  Future<void> registerPackages() async {
    for(WTBootstrap? bootstrap in packages!) {
      await bootstrap!.register();
    }
  }
  @override
  Future<void> unregisterPackages() async {
    for(WTBootstrap? bootstrap in packages!) {
      await bootstrap!.unregister(); }
  }
  @override
  Future<void> unregisterPackage(String? name) async {
    WTBootstrap? bootstrap = packages!.firstWhere((p) => p.getName() == name);
    await bootstrap.unregister();
    packages!.removeWhere((p) => p.getName() == bootstrap.getName());
  }

}