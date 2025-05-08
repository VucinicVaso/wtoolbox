import 'dart:io';
import 'dart:typed_data';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import 'package:wtoolbox/3rd_party/lib_path_provider.dart';
import 'package:wtoolbox/3rd_party/lib_html_to_pdf.dart';
import 'package:wtoolbox/service/document/file/wtoolbox_file_service.dart';
import '../wtoolbox_pdf_service.dart';

class WTPdfServiceImpl extends WTPdfService {

  @override
  Future<String>? covertHtmlToPdf({ String? fileName, String? htmlContent }) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final targetPath = appDocDir.path;

    final generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
      content: htmlContent!,
      configuration: PrintPdfConfiguration(
        targetDirectory: targetPath,
        targetName: fileName!,
        printSize: PrintSize.A4,
        printOrientation: PrintOrientation.Portrait,
      ),
    );

    Uint8List? fileBytes = await generatedPdfFile.readAsBytes();
    String? pdfFilePath = await Get.find<WTFileService>().saveFile(fileName: '$fileName.pdf', fileBytes: fileBytes);
    return pdfFilePath!;
  }

}