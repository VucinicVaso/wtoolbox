import 'package:wtoolbox/external/lib_encrypt.dart';

abstract class WTEncryption {

  String? _rawKey;
  void setRawKey(String? value) { _rawKey = value; }
  String? getRawKey() { return _rawKey; }

  Key? _encryptKey;
  void setEncryptKey(Key? value) { _encryptKey = value; }
  Key? getEncryptKey() { return _encryptKey!; }

  IV? _iv;
  void setIv(IV? value) { _iv = value; }
  IV? getIv() { return _iv!; }

  Encrypter? _encrypter;
  void setEncrypter(Encrypter? value) { _encrypter = value; }
  Encrypter? getEncrypter() { return _encrypter; }

  void initEncryption();

  String? encrypt(String? value);

  String? decrypt(String? value);

}