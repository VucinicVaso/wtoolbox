abstract class WTImageService {

  // crop image using image cropper lib
  Future<Map<String, dynamic>>? cropImage({ String? filePath });

}