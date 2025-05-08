import 'package:get/get.dart';
import '../../bootstrap/wtoolbox_bootstrap.dart';

abstract class WTRouterRegisterService {

  String? initialRoute = '/';
  void setInitialRoute(String? route);
  String? getInitialRoute();

  String? redirectRoute = '/';
  void setRedirectRoute(String? route);
  String? getRedirectRoute();

  String? logoutRoute = '/';
  void setLogoutRoute(String? route);
  String? getLogoutRoute();

  List<GetPage<dynamic>>? routes = List.empty(growable: true);
  void registerRoutes(List<GetPage<dynamic>>? list);
  void unregisterRoutes(List<GetPage<dynamic>>? list);
  List<GetPage<dynamic>>? getRoutes();
  
  List<WTBootstrap>? packages = List.empty(growable: true);
  void addPackage(WTBootstrap? bootstrap);
  Future<void> registerPackages();
  Future<void> unregisterPackages();
  Future<void> unregisterPackage(String? name);

}