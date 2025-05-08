import 'package:wtoolbox/3rd_party/lib_image_picker.dart';

abstract class WTImageService {

  // crop image using image cropper lib
  Future<Map<String, dynamic>>? cropImage({ String? filePath });

  // extract text from image using Google ML Kit
  Future<String>? extractTextFromImage(XFile? image);

}