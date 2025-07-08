import 'package:wtoolbox/external/lib_getx.dart';

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

}