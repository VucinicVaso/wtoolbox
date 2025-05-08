import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import 'package:wtoolbox/helper/logger/wtoolbox_logger.dart';
import '../service/router_register/wtoolbox_router_register_service.dart';

abstract class WTController<T> extends GetxController {

  // used to dismiss keyboard
  void unFocusFocusNode() { FocusScope.of(Get.context!).unfocus(); }

  // used for notifying components
  ValueNotifier<List<Map<String, dynamic>>>? messageNotifier = ValueNotifier<List<Map<String, dynamic>>>([]);
  void addMessage(Map<String, dynamic>? v) {
    List<Map<String, dynamic>>? list = List<Map<String, dynamic>>.empty(growable: true);
    list..addAll(messageNotifier!.value)..add(v!);
    messageNotifier!.value = list;
  }
  void addMessages(List<Map<String, dynamic>>? v) { messageNotifier!.value = v!; }
  void clearMessages() { messageNotifier!.value = []; }

  // redirect to previous view
  var previousView = ''.obs;
  void setPreviousView(String view) { previousView.value = view; }

  // set controller route arguments when view gets initialized
  void init({ Map<String, dynamic>? arguments }) {
    unFocusFocusNode();

    if(arguments != null && arguments.isNotEmpty) {
      if(arguments.containsKey('previousView')) { setPreviousView(arguments['previousView']); }
      setRouteParams(arguments);
    }
  }

  // init controller state
  Future<void> initState();

  // clear controller state
  Future<void> clearState();

  // webSocket message listener
  Future<void> listener(Map<String, dynamic>? message);

  // route arguments
  var params = <String, dynamic>{}.obs;
  void setRouteParams(Map<String, dynamic>? map) {
    params.clear();
    params.value = map!;
  }

  // close modal, popups...
  void closeWindow() { Get.back(); }

  // navigate to the view
  Future<void> navigateTo({ String? route, String? previousRoute, Map<String, dynamic>? arguments }) async {
    arguments!['previousView'] = previousRoute;
    Get.toNamed(route!, arguments: arguments);
    onClose();
  }

  // go to the view with no option of going back to the previous view
  Future<void> navigateOff({ String? route, String? previousRoute = '', Map<String, dynamic>? arguments }) async {
    if(previousRoute!.isNotEmpty) { arguments!['previousView'] = previousRoute; }
    Get.offNamed(route!, arguments: arguments);
    onClose();
  }

  /// navigate to the view and return back with data
  Future<dynamic>? getTo({ String? route, Map<String, dynamic>? arguments }) async {
    arguments!['getBack'] = true;
    return await Get.toNamed(route!, arguments: arguments);
  }
  Future<void> getBack() async {
    Get.back(result: params);
    onClose();
  }

  // return to the previous view
  Future<void> navigateBack() async {
    if(params.containsKey('getBack') && params['getBack'] == true) {
      await getBack();
    }

    if(!params.containsKey('getBack')) {
      if(params.containsKey('previousView')) { params.removeWhere((k, v) => k == 'previousView'); }

      if(previousView.value.isEmpty) {
        await navigateOff(
          route: Get.find<WTRouterRegisterService>().getRedirectRoute(),
          arguments: params
        );
      }

      if(previousView.value.isNotEmpty) {
        await navigateTo(
          route: previousView.value,
          previousRoute: Get.find<WTRouterRegisterService>().getRedirectRoute(),
          arguments: params
        );
      }
    }
  }

  @override
  Future onClose() async {
    if(Get.isRegistered<T>()) {
      await clearState();

      await Get
        .delete<T>(force: true)
        .then((v) => WTLogger.write('WTController.onClose(${T.toString()} = $v)'));
    }
    super.onClose();
  }

}