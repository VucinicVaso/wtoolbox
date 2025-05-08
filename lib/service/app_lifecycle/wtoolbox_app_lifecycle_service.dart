import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_getx.dart';

abstract class WTAppLifecycleService {

  Rx<Timer>? timer = Timer(const Duration(hours: 1), () {}).obs;
  void cancelTimer() { if(timer!.value.isActive) { timer!.value.cancel(); } }

  Rx<bool>? allowed = false.obs;
  void allow(bool? v) { allowed!.value = v!; }

  void didChangeAppLifecycleState(AppLifecycleState state);

  Future<void> stateHidden();

  Future<void> stateResumed();
  
  Future<void> stateDetached();
  
  Future<void> statePaused();

  Future<void> stateInactive();

}