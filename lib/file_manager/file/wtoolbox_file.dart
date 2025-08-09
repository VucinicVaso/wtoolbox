import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:wtoolbox/external/lib_image_picker.dart';

abstract class WTFile {

  // temp dir
  String? dir;

  /// create temp dir
  Future<void> createTempDir();

  /// clear temp dir
  void clearTempDir();

  /// get file type and placeholder from file extension
  Map<String, dynamic>? getFileTypeAndPlaceholder({ String? fileExtension });

  /// get ApplicationDocumentsDirectory file path
  Future<String>? getFilePath({ String? fileName });

  /// save file to ApplicationDocumentsDirectory
  Future<String>? saveFile({ String? fileName, Uint8List? fileBytes });

  /// get data from XFile
  Future<Map<String, dynamic>>? getDataFromXFile({ XFile? xFile });

  /// get file from ApplicationDocumentsDirectory path as UInt8List
  Future<Uint8List>? getUInt8ListFromFilePath({ String? filePath });

  /// get file from ApplicationDocumentsDirectory path or UInt8List
  File? getFile({ String? filePath, Uint8List? uInt8List });

  /// gete XFile from file path or uInt8List
  XFile? getXFile({ String? filePath, Uint8List? uInt8List });

  /// create temp .txt file from db base64String file
  Future<Map<String, dynamic>>? getXFileFromBase64String({ String? base64String, String? fileName });

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

  /// get image thumbnail from XFile
  Future<Map<String, dynamic>>? getThumbnailImage({ XFile? xFile, int? width, int? height });

}