import 'dart:io';
import 'dart:typed_data';
import 'package:wtoolbox/external/lib_path_provider.dart';
import 'package:wtoolbox/external/lib_html_to_pdf.dart';
import '../wtoolbox_pdf.dart';

class WTPDFImpl extends WTPDF {

  @override
  Future<Map<String, dynamic>>? covertHtmlToPdf({ String? fileName, String? htmlContent }) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final targetPath    = appDocDir.path;

    final generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
      content: htmlContent!,
      configuration: PrintPdfConfiguration(
        targetDirectory: targetPath,
        targetName: fileName!,
        printSize: PrintSize.A4,
        printOrientation: PrintOrientation.Portrait,
      ),
    );

    Uint8List? pdfFileBytes = await generatedPdfFile.readAsBytes();

    return {
      'fileName': '$fileName.pdf',
      'fileBytes': pdfFileBytes,
    };
  }

}