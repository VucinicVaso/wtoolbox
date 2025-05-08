import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_getx.dart';

abstract class WTRouting {

  List<GetPage<dynamic>>? routes = List<GetPage<dynamic>>.empty(growable: true);
  List<GetPage<dynamic>> getRoutes() { return routes!; }
  void registerRoute({ String? name, Widget Function()? view }) { routes!.add(GetPage(name: name!, page: view!)); }

}