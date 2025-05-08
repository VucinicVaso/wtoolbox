import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_image_picker.dart';
import 'package:wtoolbox/3rd_party/lib_image_cropper.dart';
//import 'package:wtoolbox/3rd_party/lib_google_ml_kit_text_recognition.dart';
import '../wtoolbox_image_service.dart';

class WTImageServiceImpl implements WTImageService {

  @override
  Future<Map<String, dynamic>>? cropImage({ String? filePath }) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: filePath!,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'WT Image Cropper',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false
        ),
        IOSUiSettings(
          title: 'WT Image Cropper',
        ),
      ],
    );

    if(croppedFile == null) { return <String, dynamic>{}; }

    String? cFilePath = croppedFile.path;
    Uint8List? cFileUInt8list = await croppedFile.readAsBytes();

    return <String, dynamic>{
      'croppedFilePath':  cFilePath,
      'croppedFileBytes': cFileUInt8list
    };
  }

  @override
  Future<String>? extractTextFromImage(XFile? image) async {
    return '';

    // final inputImage = InputImage.fromFilePath(image!.path);
    // final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    // final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
    // String text = recognizedText.text;
    // textRecognizer.close();
    // return text;
  }

}