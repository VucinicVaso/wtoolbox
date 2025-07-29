import 'package:wtoolbox/external/lib_encrypt.dart';
import '../wtoolbox_encryption.dart';

class WTEncryptionImpl extends WTEncryption {

  WTEncryptionImpl({ String? key }) {
    setRawKey(key);
    initEncryption();
  }

  @override
  void initEncryption() {
    setEncryptKey(Key.fromUtf8(getRawKey()!));
    setIv(IV.fromLength(16));
    setEncrypter(Encrypter(AES(getEncryptKey()!)));
  }

  @override
  String? encrypt(String? value) {
    return getEncrypter()!.encrypt(value!, iv: getIv()).base64;
  }

  @override
  String? decrypt(String? value) {
    return getEncrypter()!.decrypt(Encrypted.from64(value!), iv: getIv());
  }

}