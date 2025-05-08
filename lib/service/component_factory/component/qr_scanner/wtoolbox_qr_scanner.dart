import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_mobile_scanner.dart';
import '../wtoolbox_component.dart';

abstract class WTQrScanner extends WTComponent {

  IconData? qrIcon;
  void setQrIcon(IconData? v) { qrIcon = v; }
  Color? qrIconColor;
  void setQrIconColor(Color? v) { qrIconColor = v; }

  Function? action;
  void setAction(Function? v) { action = v; }

  void onDetect(Barcode barcode) {
    final String code = barcode.rawValue!.isNotEmpty ? barcode.rawValue! : '';
    action!(code);
  }

}