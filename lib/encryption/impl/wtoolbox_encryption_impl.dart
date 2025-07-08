import 'package:wtoolbox/external/lib_encrypt.dart';
import '../wtoolbox_encryption.dart';

class WTEncryptionImpl extends WTEncryption {

  WTEncryptionImpl() {
    initEncryption();
  }

  @override
  void initEncryption() {
    setRawKey('aT9@!bV5#Xz1p*Ld3W&fQ8nRu%Ae7KmC');
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