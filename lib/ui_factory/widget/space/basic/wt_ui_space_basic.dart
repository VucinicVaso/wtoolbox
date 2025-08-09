import 'package:flutter/material.dart';
import '../wt_ui_space.dart';

class WTUISpaceBasic extends WTUISpace {

  @override
  Widget? build() {
    return SizedBox(
      width: width,
      height: height
    );
  }

}