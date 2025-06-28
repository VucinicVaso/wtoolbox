import 'package:flutter/foundation.dart';

class WTLogger {

  static write(String? message) {
    if(kDebugMode) { print('-- $message'); }
  }

}
