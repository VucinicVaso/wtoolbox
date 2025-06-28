import 'package:get/get.dart';
import 'package:wtoolbox/application_starter/wtoolbox_application_starter.dart';

abstract class WTRouter {

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
  
  List<WTApplicationStarter>? starters = List.empty(growable: true);
  void registerApplicationStarter(WTApplicationStarter? starter);
  Future<void> unregisterApplicationStarter(String? title);
  Future<void> registerApplicationStarters();
  Future<void> unregisterApplicationStarters();

}