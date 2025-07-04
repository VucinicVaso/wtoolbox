import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import '../wtoolbox_application_lifecycle.dart';

class WTApplicationLifecycleImpl extends WTApplicationLifecycle {

  WTApplicationLifecycleImpl() {
    allow(false);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if(state == AppLifecycleState.hidden) { await hidden(); }

    if(state == AppLifecycleState.resumed) { await resumed(); }

    if(state == AppLifecycleState.detached) { await detached(); }

    if(state == AppLifecycleState.paused) { await paused(); }

    if(state == AppLifecycleState.inactive) { await inactive(); }
  }

  @override
  Future<void> hidden() async {
    //allow(true);
  }

  @override
  Future<void> resumed() async {
    //allow(false);
    cancelTimer();
  }
  
  @override
  Future<void> detached() async {
    await redirectAction!();
  }
  
  @override
  Future<void> paused() async {
    timer!.value = Timer(
      Duration(seconds: 30),
      () async {
        if(timer!.value.isActive && allowed!.value) {
          await redirectAction!();
        }
      }
    );
  }

  @override
  Future<void> inactive() async {
    //
  }

}