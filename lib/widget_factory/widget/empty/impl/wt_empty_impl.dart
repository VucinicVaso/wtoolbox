import 'package:flutter/material.dart';
import '../wt_empty.dart';

class WTEmptyImpl extends WTEmpty {

  @override
  Widget? build() {
    return SizedBox.shrink(key: getUniqueKey());
  }

}