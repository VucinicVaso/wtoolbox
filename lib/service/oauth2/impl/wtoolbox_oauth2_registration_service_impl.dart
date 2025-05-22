import 'dart:convert';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import 'package:wtoolbox/3rd_party/lib_oauth2.dart';
import 'package:wtoolbox/3rd_party/lib_dotenv.dart';
import '../wtoolbox_oauth2_registration_service.dart';
import '../../../helper/logger/wtoolbox_logger.dart';
import '../../http/wtoolbox_http_service.dart';

class WTOAuth2RegistrationServiceImpl extends WTOAuth2RegistrationService {

  WTOAuth2RegistrationServiceImpl() {
    initAppAuth();
  }

  @override
  void initAppAuth() {
    appAuth = const FlutterAppAuth();
    setAuthDomain(dotenv.get('OAUTH2_SERVER_URI'));
    setAuthClientId(dotenv.get('OAUTH2_AUTH_CLIENT_ID'));
    setAuthRedirectUri(dotenv.get('OAUTH2_REDIRECT_URI'));
    setAuthUserInfo(dotenv.get('OAUTH2_USER_INFO_URI'));
    setAuthScopes([ 'openid', 'profile' ]);
    setLogoutRedirectUrl(dotenv.get('OAUTH2_LOGOUT_REDIRECT_URI'));
    setAuthorizationEndpoint(dotenv.get('OAUTH2_AUTHORIZATION_ENDPOINT'));
    setTokenEndpoint(dotenv.get('OAUTH2_TOKEN_ENDPOINT'));
    setEndSessionEndpoint(dotenv.get('OAUTH2_END_SESSION_ENDPOINT'));
  }

  @override
  Map<String, dynamic>? parseIdToken({ String? idToken }) {
    final parts = idToken!.split(r'.');
    assert(parts.length == 3);
    return jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }

  @override
  Future<Map<dynamic, dynamic>>? getUserDetails({ String? accessToken }) async {
    try {
      Map<dynamic, dynamic> userDetails = <dynamic, dynamic>{};
      userDetails = await Get.find<WTHttpService>().get(authUserInfo!, { 'Authorization': 'Bearer $accessToken' });
      return userDetails;
    }catch(e) {
      throw Exception('WTOAuth2RegistrationService.getUserDetails: $e');
    }
  }

  @override
  Future<Map<String, dynamic>>? generateAccessToken({ String? refreshToken }) async {
    try {
      TokenRequest tokenRequest = TokenRequest(
        authClientId!,
        authRedirectUri!,
        issuer: authDomain,
        refreshToken: refreshToken,
      );

      final response = await appAuth!.token(tokenRequest);
      Map<String, dynamic>? idTokenData = parseIdToken(idToken: response.idToken!);
      var userDetails = await getUserDetails(accessToken: response.accessToken);

      return {
        'idToken':      response.idToken,
        'idTokenData':  idTokenData,
        'accessToken':  response.accessToken,
        'refreshToken': response.refreshToken,
        'userDetails':  userDetails
      };
    }catch (e) {
      throw Exception('WTOAuth2RegistrationService.generateAccessToken $e');
    }
  }

  @override
  Future<Map<String, dynamic>>? createSession() async {
    try {
      AuthorizationTokenRequest authorizationTokenRequest = AuthorizationTokenRequest(
        authClientId!,
        authRedirectUri!,
        issuer: authDomain,
        scopes: authScopes,
        allowInsecureConnections: true,
        //promptValues: ['login']
      );
      AuthorizationTokenResponse? response = await appAuth!.authorizeAndExchangeCode(authorizationTokenRequest);
      if(response.accessToken!.isEmpty) { throw Exception('Something went wrong with authorization.'); }

      Map<String, dynamic>? idTokenData = parseIdToken(idToken: response.idToken);
      var userDetails = await getUserDetails(accessToken: response.accessToken);

      return {
        'idToken':      response.idToken,
        'idTokenData':  idTokenData,
        'accessToken':  response.accessToken,
        'refreshToken': response.refreshToken,
        'userDetails':  userDetails
      };
    }catch(e) {
      throw Exception('WTOAuth2RegistrationService.createSession: $e');
    }
  }

  @override
  Future<bool?>? closeSession({ String? idToken }) async {
    try {
      AuthorizationServiceConfiguration serviceConfiguration = AuthorizationServiceConfiguration(
        authorizationEndpoint: authorizationEndpoint!,
        tokenEndpoint: tokenEndpoint!,
        endSessionEndpoint: endSessionEndpoint
      );
      EndSessionRequest endSessionRequest = EndSessionRequest(
        idTokenHint: idToken,
        postLogoutRedirectUrl: logoutRedirectUrl,
        serviceConfiguration: serviceConfiguration
      );
      EndSessionResponse? endSessionResponse = await appAuth!.endSession(endSessionRequest);

      WTLogger.write('WTOAuth2RegistrationService.closeSession: ${endSessionResponse.state}');
      return true;
    }catch(e) {
      throw Exception('WTOAuth2RegistrationService.closeSession: $e');
    }
  }

}