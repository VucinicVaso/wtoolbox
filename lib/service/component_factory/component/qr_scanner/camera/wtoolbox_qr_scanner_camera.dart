import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_mobile_scanner.dart';
import '../wtoolbox_qr_scanner.dart';

class WTQrScannerCamera extends WTQrScanner {

  @override
  Widget? build() {
    return QrScannerWidget(
      key:      getUniqueKey(),
      padding:  padding,
      margin:   margin,
      onDetect: onDetect,
    );
  }

}

// ignore: must_be_immutable
class QrScannerWidget extends StatefulWidget {

  EdgeInsets? padding, margin;
  Function? onDetect;

  QrScannerWidget({
    super.key,
    this.padding,
    this.margin,
    this.onDetect,
  });

  @override
  State<QrScannerWidget> createState() => _QrScannerWidgetState();

}

class _QrScannerWidgetState extends State<QrScannerWidget> {

  @override
  void initState() {
    initScannerController();
    super.initState();
  }

  @override
  void dispose() {
    codeDetected = false;
    scannerController!.dispose();
    super.dispose();
  }

  MobileScannerController? scannerController;
  void initScannerController() {
    setState(() { scannerController = MobileScannerController(); });
  }

  bool? codeDetected = false;
  void setCodeDetected(bool? value) {
    setState(() { codeDetected = value!; });
  }

  void onDetect(BarcodeCapture barcodes) {
    if(!codeDetected!) {
      setCodeDetected(true);
      Future.delayed(const Duration(seconds: 2), () => widget.onDetect!(barcodes));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: widget.key,
      child: Container(
        padding: widget.padding,
        margin: widget.margin,
        child: MobileScanner(
          key: UniqueKey(),
          onDetect: (barcodes) => onDetect(barcodes),
          controller: scannerController,
        ),
      ),
    );
  }

}