import 'package:wtoolbox/external/lib_oauth2.dart';

abstract class WTOAuth2 {

  FlutterAppAuth? appAuth;
  void init();

  String? authDomain;
  void setAuthDomain(String? domain) { authDomain = domain!; }

  String? authClientId;
  void setAuthClientId(String? clientId) { authClientId = clientId!; }

  String? authRedirectUri;
  void setAuthRedirectUri(String? uri) { authRedirectUri = uri; }

  String? authUserInfo;
  void setAuthUserInfo(String? info) { authUserInfo = info; }

  List<String>? authScopes = List<String>.empty(growable: true);
  void setAuthScopes(List<String>? scopes) {
    authScopes!.clear();
    authScopes!.addAll(scopes!);
  }

  String? logoutRedirectUrl;
  void setLogoutRedirectUrl(String? url) { logoutRedirectUrl = url; }

  String? authorizationEndpoint;
  void setAuthorizationEndpoint(String? endpoint) { authorizationEndpoint = endpoint; }

  String? tokenEndpoint;
  void setTokenEndpoint(String? endpoint) { tokenEndpoint = endpoint; }

  String? endSessionEndpoint;
  void setEndSessionEndpoint(String? endpoint) { endSessionEndpoint = endpoint; }

  Map<String, dynamic>? parseIdToken({ String? idToken });

  Future<Map<dynamic, dynamic>>? getUserDetails({ String? accessToken });

  Future<Map<String, dynamic>>? generateAccessToken({ String? refreshToken });

  Future<Map<String, dynamic>>? startSession();

  Future<bool?>? closeSession({ String? idToken });

}