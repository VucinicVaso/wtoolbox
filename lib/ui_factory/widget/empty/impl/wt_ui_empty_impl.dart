import 'package:flutter/material.dart';
import '../wt_ui_empty.dart';

class WTUIEmptyImpl extends WTUIEmpty {

  @override
  Widget? build() {
    return SizedBox.shrink(key: getUniqueKey());
  }

}