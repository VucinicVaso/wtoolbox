import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_mobile_scanner.dart';
import '../wtoolbox_qr_scanner.dart';

class WTQrScannerView extends WTQrScanner {

  @override
  Widget? build() {
    return QrScannerWidget(
      key:         getUniqueKey(),
      margin:      margin,
      padding:     padding,
      onDetect:    onDetect,
      qrIcon:      qrIcon,
      qrIconColor: qrIconColor,
    );
  }

}

// ignore: must_be_immutable
class QrScannerWidget extends StatefulWidget {

  EdgeInsets? padding, margin;
  Function? onDetect;
  IconData? qrIcon;
  Color? qrIconColor;

  QrScannerWidget({
    super.key,
    this.padding,
    this.margin,
    this.onDetect,
    this.qrIcon,
    this.qrIconColor,
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
    activeScreen = 0;
    codeDetected = false;
    scannerController!.dispose();
    super.dispose();
  }

  MobileScannerController? scannerController;
  void initScannerController() {
    setState(() { scannerController = MobileScannerController(); });
  }

  int? activeScreen = 0;
  void setActiveScreen(int? value) {
    setState(() { activeScreen = value; });
  }

  bool? codeDetected = false;
  void setCodeDetected(bool? value) {
    setState(() { codeDetected = value!; });
  }

  void onDetect(BarcodeCapture barcodes) {
    if(!codeDetected!) {
      setCodeDetected(true);
      widget.onDetect!(barcodes);
      Future.delayed(const Duration(seconds: 2), () => setActiveScreen(0));
    }
    if(codeDetected!) {
      setCodeDetected(false);
      Future.delayed(const Duration(seconds: 2), () => setActiveScreen(0));
    }
  }

  Widget? createBody() {
    if(activeScreen! == 0) {
      return GestureDetector(
        onTap: () => setActiveScreen(1),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double? width    = constraints.maxWidth;
            double? height   = constraints.maxHeight;
            double? iconSize = width * 0.5;

            return Container(
              alignment: Alignment.center,
              width: width,
              height: height,
              child: CustomPaint(
                foregroundPainter: BorderPainter(),
                child: Icon(
                  widget.qrIcon,
                  size: iconSize,
                  color: widget.qrIconColor,
                ),
              ),
            );
          }
        ),
      );
    }

    return MobileScanner(
      key: UniqueKey(),
      onDetect: (barcodes) => onDetect(barcodes),
      controller: scannerController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: widget.key,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: widget.padding,
        margin: widget.margin,
        color: Colors.transparent,
        child: createBody()!,
      ),
    );
  }

}

class BorderPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    double sh = size.height;      // for convenient shortage
    double sw = size.width;       // for convenient shortage
    double cornerSide = sh * 0.1; // desirable value for corners side sh * 0.1

    Path path = Path()
      ..moveTo(cornerSide, 0)
      ..quadraticBezierTo(0, 0, 0, cornerSide)
      ..moveTo(0, sh - cornerSide)
      ..quadraticBezierTo(0, sh, cornerSide, sh)
      ..moveTo(sw - cornerSide, sh)
      ..quadraticBezierTo(sw, sh, sw, sh - cornerSide)
      ..moveTo(sw, cornerSide)
      ..quadraticBezierTo(sw, 0, sw - cornerSide, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BorderPainter oldDelegate) => false;

}