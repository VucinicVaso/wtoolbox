import 'dart:async';
import 'package:flutter/material.dart';

abstract class WTApplicationLifecycle {
 
  Duration? duration;
  void setDuration({ int? hours, int? seconds });
  
  Timer? timer;
  void cancelTimer();

  bool? allowed = false;
  void allow() { allowed = true; }
  void disallow() { allowed = false; }

  Function? redirectAction;
  void setRedirectAction(Function? v) { redirectAction = v; }

  void didChangeAppLifecycleState(AppLifecycleState state);

  Future<void> resumed();
  Future<void> paused();
  Future<void> hidden();
  Future<void> detached();
  Future<void> inactive();

}