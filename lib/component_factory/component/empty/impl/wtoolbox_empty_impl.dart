import 'package:flutter/material.dart';
import '../wtoolbox_empty_component.dart';

class WTEmptyImpl extends WTEmptyComponent {

  @override
  Widget? build() {
    return SizedBox.shrink(key: getUniqueKey());
  }

}