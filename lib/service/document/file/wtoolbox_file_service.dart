import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:wtoolbox/3rd_party/lib_image_picker.dart';
import 'package:wtoolbox/3rd_party/lib_path_provider.dart';
import '../../../helper/logger/wtoolbox_logger.dart';

abstract class WTFileService {

  String? dir; // temp dir

  /// create temp dir
  Future<void> createTempDir() async {
    try {
      Directory? directory = await getTemporaryDirectory();
      dir = directory.path;
    } catch(e) {
      throw Exception(e);
    }
  }

  /// clear temp dir
  void clearTempDir() {
    Directory(dir!)
      .delete(recursive: true)
      .then((v) => WTLogger.write('WTFileService.clearTempDir() success: ${v.existsSync().toString()}'))
      .catchError((e) => WTLogger.write('WTFileService.clearTempDir() error: $e'));
  }

  /// get file type and placeholder from file extension
  Map<String, dynamic>? getFileTypeAndPlaceholder({ String? fileExtension }) {
    String? ext = fileExtension!.toLowerCase();
    if(ext == '.pdf') { return <String, dynamic>{ 'type': 'file', 'placeholder': 'assets/pdf.png' }; }
    if(ext == '.txt') { return <String, dynamic>{ 'type': 'file', 'placeholder': 'assets/txt.png' }; }
    if(ext == '.doc') { return <String, dynamic>{ 'type': 'file', 'placeholder': 'assets/doc.png' }; }
    if(ext == '.docx') { return <String, dynamic>{ 'type': 'file', 'placeholder': 'assets/docx.png' }; }
    if(ext == '.exe') { return <String, dynamic>{ 'type': 'file', 'placeholder': 'assets/exe.png' }; }
    if(ext == '.xlsx') { return <String, dynamic>{ 'type': 'file', 'placeholder': 'assets/xlsx.png' }; }
    if(ext == '.psd') { return <String, dynamic>{ 'type': 'file', 'placeholder': 'assets/file.png' }; }
    if(ext == '.zip') { return <String, dynamic>{ 'type': 'file', 'placeholder': 'assets/zip.png' }; }
    if(ext == '.jpg') { return <String, dynamic>{ 'type': 'image', 'placeholder': 'assets/no-image.jpg' }; }
    if(ext == '.jpeg') { return <String, dynamic>{ 'type': 'image', 'placeholder': 'assets/no-image.jpg' }; }
    if(ext == '.png') { return <String, dynamic>{ 'type': 'image', 'placeholder': 'assets/no-image.jpg' }; }
    if(ext == '.gif') { return <String, dynamic>{ 'type': 'image', 'placeholder': 'assets/no-image.jpg' }; }
    if(ext == '.svg') { return <String, dynamic>{ 'type': 'image', 'placeholder': 'assets/no-image.jpg' }; }
    if(ext == '.mp4') { return <String, dynamic>{ 'type': 'video/audio', 'placeholder': 'assets/video.png' }; }
    if(ext == '.mp3') { return <String, dynamic>{ 'type': 'video/audio', 'placeholder': 'assets/video.png' }; }
    if(ext == '.api') { return <String, dynamic>{ 'type': 'video/audio', 'placeholder': 'assets/video.png' }; }
    if(ext == '.mov') { return <String, dynamic>{ 'type': 'video/audio', 'placeholder': 'assets/video.png' }; }
    return <String, dynamic>{ 'type': 'file', 'placeholder': 'assets/file.png' };
  }

  /// get ApplicationDocumentsDirectory file path
  Future<String>? getFilePath({ String? fileName });

  /// save file to ApplicationDocumentsDirectory
  Future<String>? saveFile({ String? fileName, Uint8List? fileBytes });

  /// get data from XFile
  Future<Map<String, dynamic>>? generateXFileData({ XFile? xFile });

  /// get file from ApplicationDocumentsDirectory path as UInt8List
  Future<Uint8List>? generateUInt8ListFromFilePath({ String? filePath });

  /// generate file from ApplicationDocumentsDirectory path or UInt8List
  File? generateFile({ String? filePath, Uint8List? uInt8List });

  /// generate XFile from file path or uInt8List
  XFile? generateXFile({ String? filePath, Uint8List? uInt8List });

  /// create temp .txt file from db base64String file
  Future<Map<String, dynamic>>? generateXFileFromBase64String({ String? base64String, String? fileName });

  /// get list of files (documents: txt, pdf... except images and videos) from device storage
  Future<List<Map<String, dynamic>>>? getFilesFromDeviceStorage();

  /// get file from local assets folder
  Future<Map<String, dynamic>>? getXFileFromAssets({ String? folder, String? path });

  /// read content of text file and return it as a string
  Future<String>? readFileAsString(XFile? file);

  /// take camera image
  Future<Map<String, dynamic>>? takeCameraImage();

  /// get image from device gallery and return it's data
  Future<Map<String, dynamic>>? selectImageFromGallery();

  /// get list of images from device gallery
  Future<List<Map<String, dynamic>>>? selectImagesFromGallery();

  /// generate image thumbnail from XFile
  Future<Map<String, dynamic>>? generateThumbnailImage({ XFile? xFile, int? width, int? height });

}