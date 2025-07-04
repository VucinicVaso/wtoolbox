import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wtoolbox/external/lib_getx.dart';

abstract class WTApplicationLifecycle {

  Rx<Timer>? timer = Timer(const Duration(hours: 1), () {}).obs;
  void cancelTimer() { if(timer!.value.isActive) { timer!.value.cancel(); } }

  Rx<bool>? allowed = false.obs;
  void allow(bool? v) { allowed!.value = v!; }

  Function? redirectAction;
  void setRedirectAction(Function? v) { redirectAction = v; }

  void didChangeAppLifecycleState(AppLifecycleState state);

  Future<void> hidden();
  Future<void> resumed();
  Future<void> detached();
  Future<void> paused();
  Future<void> inactive();

}