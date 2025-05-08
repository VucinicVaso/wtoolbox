import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTChip extends WTComponent {

  Map<String, dynamic>? colors = <String, dynamic>{};
  void setColors(Map<String, dynamic>? v) { colors = v; }

  void basic() {
    backgroundColor    = colors!['basic']['backgroundColor'];
    primaryIconColor   = colors!['basic']['primaryIconColor'];
    secondaryIconColor = colors!['basic']['secondaryIconColor'];
    labelColor         = colors!['basic']['labelColor'];
  }
  void info() {
    backgroundColor    = colors!['info']['backgroundColor'];
    primaryIconColor   = colors!['info']['primaryIconColor'];
    secondaryIconColor = colors!['info']['secondaryIconColor'];
    labelColor         = colors!['info']['labelColor'];
  }
  void success() {
    backgroundColor    = colors!['success']['backgroundColor'];
    primaryIconColor   = colors!['success']['primaryIconColor'];
    secondaryIconColor = colors!['success']['secondaryIconColor'];
    labelColor         = colors!['success']['labelColor'];
  }
  void danger() {
    backgroundColor    = colors!['danger']['backgroundColor'];
    primaryIconColor   = colors!['danger']['primaryIconColor'];
    secondaryIconColor = colors!['danger']['secondaryIconColor'];
    labelColor         = colors!['danger']['labelColor'];
  }
  void warning() {
    backgroundColor    = colors!['warning']['backgroundColor'];
    primaryIconColor   = colors!['warning']['primaryIconColor'];
    secondaryIconColor = colors!['warning']['secondaryIconColor'];
    labelColor         = colors!['warning']['labelColor'];
  }

  IconData? primaryIcon, secondaryIcon;
  double? primaryIconSize, secondaryIconSize;
  Color? primaryIconColor, secondaryIconColor;
  void setPrimaryIcon(IconData? v) { primaryIcon = v; }
  void setPrimaryIconSize(double? v) { primaryIconSize = v; }
  void setPrimaryIconColor(Color? v) { primaryIconColor = v; }
  void setSecondaryIcon(IconData? v) { secondaryIcon = v; }
  void setSecondaryIconSize(double? v) { secondaryIconSize = v; }
  void setSecondaryIconColor(Color? v) { secondaryIconColor = v; }

  String? label;
  double? labelSize;
  Color? labelColor;
  void setLabel(String? v) { label = v; }
  void setLabelSize(double? v) { labelSize = v; }
  void setLabelColor(Color? v) { labelColor = v; }

}