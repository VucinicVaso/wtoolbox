import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/logger/wtoolbox_logger.dart';
import 'package:wtoolbox/router/wtoolbox_router.dart';

abstract class WTController<T> extends GetxController {

  // used to dismiss keyboard
  void unfocusFocusNode() { FocusScope.of(Get.context!).unfocus(); }

  // set controller route arguments when view gets initialized
  void init({ Map<String, dynamic>? arguments }) {
    unfocusFocusNode();
    setParams(arguments ?? {});
  }

  // init controller state
  Future<void> initState();

  // clear controller state
  Future<void> clearState();

  // notifier listener
  Future<void> listener(Map<String, dynamic>? message);

  // route arguments
  Map<String, dynamic>? params = <String, dynamic>{};
  void setParams(Map<String, dynamic>? map) {
    params!..clear()..addAll(map!);
  }

  // close modal
  void closeWindow() { Get.back(); }

  // navigate to the view
  Future<void> navigateTo({ String? route, String? previousRoute, Map<String, dynamic>? arguments }) async {
    if(previousRoute!.isNotEmpty) { arguments!['previousRoute'] = previousRoute; }
    await Get.toNamed(route!, arguments: arguments);
    await onClose();
  }

  // go to the view with no option of going back to the previous view
  Future<void> navigateOff({ String? route, String? previousRoute = '', Map<String, dynamic>? arguments }) async {
    if(previousRoute!.isNotEmpty) { arguments!['previousRoute'] = previousRoute; }
    await Get.offNamed(route!, arguments: arguments);
    await onClose();
  }

  // return to the previous view
  Future<void> navigateBack() async {
    String? redirectRoute = Get.find<WTRouter>().getRedirectRoute();

    if(!params!.containsKey('previousRoute')) {
      await navigateOff(route: redirectRoute, arguments: params);
    }

    if(params!.containsKey('previousRoute')) {
      String? previousRoute = params!['previousRoute'];
      params!.removeWhere((k, v) => k == 'previousRoute');
        
      await navigateTo(route: previousRoute, previousRoute: redirectRoute, arguments: params);
    }
  }

  @override
  Future onClose() async {
    await clearState();
    
    if(Get.isRegistered<T>()) {
      await Get
        .delete<T>(force: true)
        .then((v) => WTLogger.write('WTController.onClose(${T.toString()} = $v)'));
    }

    super.onClose();
  }

}