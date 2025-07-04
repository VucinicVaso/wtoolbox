import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import '../wtoolbox_application_lifecycle.dart';

class WTApplicationLifecycleImpl extends WTApplicationLifecycle {

  WTApplicationLifecycleImpl() {
    allow();
    setDuration(hours: 0, seconds: 30);
  }

  @override
  void setDuration({ int? hours, int? seconds }) {
    duration = Duration(hours: hours ?? 0, seconds: seconds ?? 30);
  }

  @override
  void cancelTimer() { 
    if(timer != null && timer!.isActive) { 
      timer!.cancel(); 
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if(state == AppLifecycleState.paused) { await paused(); }

    if(state == AppLifecycleState.resumed) { await resumed(); }

    if(state == AppLifecycleState.hidden) { await hidden(); }

    if(state == AppLifecycleState.detached) { await detached(); }

    if(state == AppLifecycleState.inactive) { await inactive(); }
  }

  @override
  Future<void> paused() async {
    timer = Timer(
      duration!,
      () async {
        if(timer!.isActive && allowed!) {
          await redirectAction!();
        }
      }
    );
  }

  @override
  Future<void> resumed() async {
    cancelTimer();
  }

  @override
  Future<void> hidden() async {}

  @override
  Future<void> detached() async {
    await redirectAction!();
  }

  @override
  Future<void> inactive() async {}

}