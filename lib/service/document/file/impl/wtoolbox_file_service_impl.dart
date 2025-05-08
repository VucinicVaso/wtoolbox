import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:wtoolbox/3rd_party/lib_uuid.dart';
import 'package:wtoolbox/3rd_party/lib_mime.dart';
import 'package:wtoolbox/3rd_party/lib_path.dart' as path;
import 'package:wtoolbox/3rd_party/lib_image.dart';
import 'package:wtoolbox/3rd_party/lib_image_picker.dart';
import 'package:wtoolbox/3rd_party/lib_file_picker.dart';
import 'package:wtoolbox/3rd_party/lib_path_provider.dart';
import '../wtoolbox_file_service.dart';

class WTFileServiceImpl extends WTFileService {

  @override
  Future<String>? getFilePath({ String? fileName }) async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    return '${appDocumentsDirectory.path}/$fileName';
  }

  @override
  Future<String>? saveFile({ String? fileName, Uint8List? fileBytes }) async {
    try {
      var file = File(await getFilePath(fileName: fileName)!);
      var createdFile = await file.writeAsBytes(fileBytes!);
      return createdFile.path;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Uint8List>? generateUInt8ListFromFilePath({ String? filePath }) async {
    var file = XFile(filePath!);
    return await file.readAsBytes();
  }

  @override
  File? generateFile({ String? filePath, Uint8List? uInt8List }) {
    return filePath != '' ? File(filePath!) : File.fromRawPath(uInt8List!);
  }

  @override
  XFile? generateXFile({ String? filePath, Uint8List? uInt8List }) {
    return filePath!.isNotEmpty ? XFile(filePath) : XFile.fromData(uInt8List!);
  }

  @override
  Future<Map<String, dynamic>>? generateXFileFromBase64String({ String? base64String, String? fileName }) async {
    await createTempDir();
    var tempFile = File('$dir/$fileName');
    var file = await tempFile.writeAsBytes(base64Decode(base64String!));
    clearTempDir();
    XFile? xFile = generateXFile(filePath: file.path);
    return await generateXFileData(xFile: xFile)!;
  }

  @override
  Future<List<Map<String, dynamic>>>? getFilesFromDeviceStorage() async {
    List<Map<String, dynamic>>? files = List<Map<String, dynamic>>.empty(growable: true);
    FilePickerResult? pickFiles = await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.any);
    if(pickFiles != null) {
      for(PlatformFile? pF in pickFiles.files) {
        files.add(await generateXFileData(xFile: generateXFile(filePath: pF!.path)!)!);
      }
    }
    return files;
  }

  @override
  Future<Map<String, dynamic>>? getXFileFromAssets({ String? folder = '', String? path }) async {
    ByteData fileByteData = folder!.isEmpty ? await rootBundle.load('assets/$path') : await rootBundle.load('assets/$folder/$path');
    XFile? xFile = generateXFile(filePath: '', uInt8List: fileByteData.buffer.asUint8List(fileByteData.offsetInBytes, fileByteData.lengthInBytes));
    return await generateXFileData(xFile: xFile)!;
  }

  @override
  Future<String>? readFileAsString(XFile? file) async {
    return await file!.readAsString();
  }

  @override
  Future<Map<String, dynamic>>? generateXFileData({ XFile? xFile }) async {
    String filePath = xFile!.path;
    String basename = xFile.name;
    String localName = '${uuid.v4()}_${basename.split('.').first}.${basename.split('.').last}';
    String extension = path.extension(filePath);
    Uint8List fileBytes = await xFile.readAsBytes();
    String? mime = lookupMimeType(filePath);
    int size = await xFile.length();
    Map<String, dynamic>? typeAndPlaceholder = getFileTypeAndPlaceholder(fileExtension: path.extension(filePath));
    Map<String, dynamic>? thumbnail = typeAndPlaceholder!['type'] != 'image' ? {} : await generateThumbnailImage(xFile: xFile, width: 200, height: 200);

    return <String, dynamic>{
      'urlPath': '',
      'assetsPath': '',
      'bytes': fileBytes,
      'mime': mime,
      'extension': extension,
      'size': size,
      'basename': xFile.name,
      'fileLocalName': localName,
      'fileLocalPath': filePath,
      'type': typeAndPlaceholder['type'],
      'placeholder': typeAndPlaceholder['placeholder'],
      'thumbnail': thumbnail,
    };
  }

  @override
  Future<Map<String, dynamic>>? takeCameraImage() async {
    var xFile = await ImagePicker().pickImage(source: ImageSource.camera);
    return await generateXFileData(xFile: xFile)!;
  }

  @override
  Future<Map<String, dynamic>>? selectImageFromGallery() async {
    var xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    return await generateXFileData(xFile: xFile)!;
  }

  @override
  Future<List<Map<String, dynamic>>>? selectImagesFromGallery() async {
    List<Map<String, dynamic>>? list = List<Map<String, dynamic>>.empty(growable: true);
    var xFiles = await ImagePicker().pickMultiImage();
    for(var f in xFiles) { list.add(await generateXFileData(xFile: f)!); }
    return list;
  }

  @override
  Future<Map<String, dynamic>>? generateThumbnailImage({ XFile? xFile, int? width, int? height }) async {
    var imageName = xFile!.name.split('.')[0];
    var imageBytes = await xFile.readAsBytes();
    String tempPath = (await getTemporaryDirectory()).path;
    Uint8List uInt8ListImage = encodePng(copyResize(decodeImage(imageBytes)!, width: width!, height: height!));
    File file = await File('$tempPath/thumbnail_$imageName.png').writeAsBytes(uInt8ListImage);

    return <String, dynamic>{
      'thumbnailName': 'thumbnail_$imageName.png',
      'thumbnailPath': file.path,
      'thumbnailBytes': file.readAsBytesSync(),
    };
  }

}