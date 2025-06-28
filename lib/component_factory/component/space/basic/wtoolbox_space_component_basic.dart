import 'package:flutter/material.dart';
import '../wtoolbox_space_component.dart';

class WTSpaceComponentBasic extends WTSpaceComponent {

  @override
  Widget? build() {
    return SizedBox(
      width:  width,
      height: height
    );
  }

}

