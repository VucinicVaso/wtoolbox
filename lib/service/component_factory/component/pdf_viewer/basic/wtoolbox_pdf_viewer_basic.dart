import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../3rd_party/lib_pdf_view.dart';
import '../wtoolbox_pdf_viewer.dart';

class WTPdfViewerBasic extends WTPdfViewer {

  @override
  Widget? build() {
    return PdfViewerWidget(
      key:               getUniqueKey(),
      backgroundColor:   backgroundColor,
      width:             width,
      height:            height,
      padding:           padding,
      margin:            margin,
      path:              pdfPath,
      confirmLabel:      confirmLabel,
      confirmLabelColor: confirmLabelColor,
      confirmLabelSize:  confirmLabelSize,
    );
  }

}

// ignore: must_be_immutable
class PdfViewerWidget extends StatefulWidget {

  double? width, height, confirmLabelSize;
  String? path, confirmLabel;
  EdgeInsets? padding, margin;
  Color? backgroundColor, confirmLabelColor;

  PdfViewerWidget({
    super.key,
    this.backgroundColor,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.path,
    this.confirmLabel,
    this.confirmLabelSize,
    this.confirmLabelColor,

  });

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();

}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {

  bool _isLoading = true;
  PDFDocument? document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  @override
  void dispose() {
    document = null;
    super.dispose();
  }

  Future<void> loadDocument() async {
    setState(() { _isLoading = true; });
    document = await PDFDocument.fromFile(File(widget.path!));
    setState(() { _isLoading = false; });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        widget.width            = constraints.maxWidth;
        widget.height           = constraints.maxHeight;
        widget.confirmLabelSize = constraints.maxWidth * 0.045;

        return Container(
          width: widget.width,
          height: widget.height,
          color: widget.backgroundColor,
          padding: widget.padding,
          margin: widget.margin,
          alignment: Alignment.topCenter,
          child: _isLoading
            ? const Center(
                child: CircularProgressIndicator()
              )
            : PDFViewer(
                document: document!,
                lazyLoad: false,
                zoomSteps: 1,
                numberPickerConfirmWidget: Text(
                  widget.confirmLabel!,
                  style: TextStyle(
                    fontSize: widget.confirmLabelSize,
                    color: widget.confirmLabelColor,
                  ),
                ),
              ),
        );
      }
    );
  }

}
