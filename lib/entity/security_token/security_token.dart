import 'package:wtoolbox/entity/wtoolbox_entity.dart';

class SecurityToken extends WTEntity<SecurityToken> {

  SecurityToken({
    this.key,
    this.idToken,
    this.idTokenData,
    this.accessToken,
    this.refreshToken,
    this.userDetails,
  });

  int? key; // db generated key
  void setKey(int? v) { key = v; }

  String? idToken; // OAuth2 idToken
  void setIdToken(String? v) { idToken = v; }

  Map<dynamic, dynamic>? idTokenData; // OAuth2 data from idToken
  void setIdTokenData(Map<dynamic, dynamic>? v) { idTokenData = v; }

  String? accessToken; // OAuth2 access_token
  void setAccessToken(String? v) { accessToken = v; }

  String? refreshToken; // OAuth2 refresh_token
  void setRefreshToken(String? v) { refreshToken = v; }

  Map<dynamic, dynamic>? userDetails; // OAuth2 user details
  void setUserDetails(Map<dynamic, dynamic>? v) { userDetails = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':          key,
      'idToken':      idToken,
      'idTokenData':  idTokenData,
      'accessToken':  accessToken,
      'refreshToken': refreshToken,
      'userDetails':  userDetails
    };
  }

  @override
  SecurityToken? fromJson(Map? json) {
    return SecurityToken(
      key:          json!['key'],
      idToken:      json['idTokenData'],
      idTokenData:  json['idTokenData'],
      accessToken:  json['accessToken'],
      refreshToken: json['refreshToken'],
      userDetails:  json['userDetails']
    );
  }

  @override
  SecurityToken? empty() {
    return SecurityToken(
      key:          0,
      idToken:      '',
      idTokenData:  {},
      accessToken:  '',
      refreshToken: '',
      userDetails:  {}
    );
  }


}
