import 'dart:ui';
import '../wtoolbox_component.dart';

abstract class WTPdfViewer extends WTComponent {

  String? pdfPath;
  void setPDFPath(String? v) { pdfPath = v; }

  String? confirmLabel;
  Color? confirmLabelColor;
  double? confirmLabelSize;
  void setConfirmLabel(String? v) { confirmLabel = v; }
  void setConfirmLabelColor(Color? v) { confirmLabelColor = v; }
  void setConfirmLabelSize(double? v) { confirmLabelSize = 0; }

}