import 'package:flutter/material.dart';
import '../wtoolbox_empty.dart';

class WTEmptyImpl extends WTEmpty {

  @override
  Widget? build() {
    return SizedBox.shrink(key: getUniqueKey());
  }

}