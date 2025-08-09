import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:wtoolbox/external/lib_image_cropper.dart';
import '../wtoolbox_image.dart';

class WTImageImpl implements WTImage {

  @override
  Future<Map<String, dynamic>>? cropImage({ String? filePath }) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: filePath!,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'WTOOLBOX',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false
        ),
        IOSUiSettings(
          title: 'WTOOLBOX',
        ),
      ],
    );

    if(croppedFile == null) { return <String, dynamic>{}; }

    String? cFilePath         = croppedFile.path;
    Uint8List? cFileUInt8list = await croppedFile.readAsBytes();

    return <String, dynamic>{
      'croppedFilePath':  cFilePath,
      'croppedFileBytes': cFileUInt8list
    };
  }

}