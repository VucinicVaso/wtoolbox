import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import '../wtoolbox_app_lifecycle_service.dart';
import '../../router_register/wtoolbox_router_register_service.dart';

class WTAppLifecycleServiceImpl extends WTAppLifecycleService {

  WTAppLifecycleServiceImpl() {
    allow(false);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if(state == AppLifecycleState.hidden) { await stateHidden(); }

    if(state == AppLifecycleState.resumed) { await stateResumed(); }

    if(state == AppLifecycleState.detached) { await stateDetached(); }

    if(state == AppLifecycleState.paused) { await statePaused(); }

    if(state == AppLifecycleState.inactive) { await stateInactive(); }
  }

  @override
  Future<void> stateHidden() async {
    //allow(true);
  }

  @override
  Future<void> stateResumed() async {
    //allow(false);
    cancelTimer();
  }
  
  @override
  Future<void> stateDetached() async {
    await Get.offNamed(Get.find<WTRouterRegisterService>().getLogoutRoute()!);
  }
  
  @override
  Future<void> statePaused() async {

    timer!.value = Timer(
      Duration(seconds: 30),
      () async {
        if(timer!.value.isActive && allowed!.value) {
          await Get.offNamed(Get.find<WTRouterRegisterService>().getLogoutRoute()!);
        }
      }
    );
  }

  @override
  Future<void> stateInactive() async {
    //
  }

}