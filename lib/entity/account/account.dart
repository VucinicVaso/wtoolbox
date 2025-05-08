import 'dart:typed_data';
import '../wtoolbox_entity.dart';
import '../security_token/security_token.dart';

enum AccountEntitySecurityOption {
  pin,
  face,
  fingerprint
}

class Account extends WTEntity<Account> {

  Account({
    this.key,
    this.date,
    this.selected,
    this.isLoggedIn,
    this.securityOption,
    this.pinCode,
    this.lockTimeout,
    this.services,
  });

  int? key; // db key
  void setKey(int? v) { key = v; }

  String? date; // db generated date
  void setDate(String? v) { date = v; }

  bool? selected; // check if account is selected
  void setSelected(bool? v) { selected = v; }

  bool? isLoggedIn; // check if account is logged in
  void setIsLoggedIn(bool? v) { isLoggedIn = v; }

  String? securityOption; // enum AccountEntitySecurityOption
  void setSecurityOption(String? v) { securityOption = v; }

  String? pinCode; // security pin code
  void setPinCode(String? v) { pinCode = v; }

  int? lockTimeout; // account lock timeout (used when user has been inactive for x amount of seconds)
  void setLockTimeout(int? v) { lockTimeout = v; }

  Uint8List? image;
  void setImage(Uint8List? v) { image = v; }

  String? userId;
  void setUserId(String? v) { userId = v; }

  String? firstname;
  void setFirstname(String? v) { firstname = v; }

  String? lastname;
  void setLastname(String? v) { lastname = v; }

  String? username;
  void setUsername(String? v) { username = v; }

  String? email;
  void setEmail(String? v) { email = v; }

  String? deviceOS; // device platform (Android || IOS || ??)
  void setDeviceOS(String? v) { deviceOS = v; }

  Map<dynamic, dynamic>? deviceInfo; // json for device info (from device_info_plus library)
  void setDeviceInfo(Map<dynamic, dynamic>? v) { deviceInfo = v; }

  Map<dynamic, dynamic>? services; // map of HTTP && Websockets urls,
  void setServices(Map<dynamic, dynamic>? v) { services = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':            key,
      'date':           date,
      'selected':       selected,
      'isLoggedIn':     isLoggedIn,
      'securityOption': securityOption,
      'pinCode':        pinCode,
      'lockTimeout':    lockTimeout,
      'services':       services,
    };
  }

  @override
  Account? fromJson(Map? json) {
    return Account(
      key:            json!['key'],
      date:           json['date'],
      selected:       json['selected'],
      isLoggedIn:     json['isLoggedIn'],
      securityOption: json['securityOption'],
      pinCode:        json['pinCode'],
      lockTimeout:    json['lockTimeout'],
      services:       json['services'],
    );
  }

  @override
  Account? empty() {
    return Account(
      key:            0,
      date:           '',
      selected:       false,
      isLoggedIn:     false,
      securityOption: '',
      pinCode:        '',
      lockTimeout:    0,
      services:       {},
    );
  }

}