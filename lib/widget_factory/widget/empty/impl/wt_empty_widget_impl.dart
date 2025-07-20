import 'package:flutter/material.dart';
import '../wt_empty_widget.dart';

class WTEmptyWidgetImpl extends WTEmptyWidget {

  @override
  Widget? build() {
    return SizedBox.shrink(key: getUniqueKey());
  }

}