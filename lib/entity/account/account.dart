import 'package:wtoolbox/clean_architecture/entity/wtoolbox_entity.dart';

enum AccountEntitySecurityOption {
  pin,
  face,
  fingerprint
}

class Account extends WTEntity<Account> {

  Account({
    super.key,
    super.date,
    this.selected,
    this.isLoggedIn,
    this.securityOption,
    this.pinCode,
    this.lockTimeout,
    this.language,
    this.theme,
    this.device,
    this.userId,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.image,
  });

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

  String? language; // label for selected language
  void setLanguage(String? v) { language = v; }

  String? theme; // name of selected theme
  void setTheme(String? v) { theme = v; }

  Map<dynamic, dynamic>? device = <dynamic, dynamic>{}; // json for device info (from device_info_plus library)
  void setDeviceData(Map<dynamic, dynamic>? v) { device = v; }

  String? userId; // account server id
  void setUserId(String? v) { userId = v; }

  String? image; // image from url/assets/...
  void setImage(String? v) { image = v; }

  String? firstname;
  void setFirstname(String? v) { firstname = v; }

  String? lastname;
  void setLastname(String? v) { lastname = v; }

  String? username;
  void setUsername(String? v) { username = v; }

  String? email;
  void setEmail(String? v) { email = v; }

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
      'language':       language,
      'theme':          theme,
      'device':         device,
      'userId':         userId,
      'firstname':      firstname,
      'lastname':       lastname,
      'username':       username,
      'email':          email,
      'image':          image,
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
      language:       json['language'],
      theme:          json['theme'],
      device:         json['device'],
      userId:         json['userId'],
      firstname:      json['firstname'],
      lastname:       json['lastname'],
      username:       json['username'],
      email:          json['email'],
      image:          json['image'],
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
      language:       '',
      theme:          '',
      device:         {},
      userId:         '',
      firstname:      '',
      lastname:       '',
      username:       '',
      email:          '',
      image:          '',
    );
  }

}