import '../../3rd_party/lib_encrypt.dart';
import '../wtoolbox_encryption.dart';

class WTEncryptionImpl extends WTEncryption {

  WTEncryptionImpl() {
    initEncryption();
  }

  @override
  void initEncryption() {
    setRawKey('#wtoolbox-encryption-key-!2025!#');
    setEncryptKey(Key.fromUtf8(getRawKey()!));
    setIv(IV.fromLength(16));
    setEncrypter(Encrypter(AES(getEncryptKey()!)));
  }

  @override
  String? encryptData(String? value) {
    return getEncrypter()!.encrypt(value!, iv: getIv()).base64;
  }

  @override
  String? decryptData(String? value) {
    return getEncrypter()!.decrypt(Encrypted.from64(value!), iv: getIv());
  }

}