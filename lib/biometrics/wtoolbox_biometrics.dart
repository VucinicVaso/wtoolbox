import 'package:wtoolbox/external/lib_local_auth.dart';

abstract class WTBiometrics {

  // check if user can authenticate with biometrics
  bool? _allowed = false;
  void setIsAllowedToAuthenticateWithBiometrics(bool? b) { _allowed = b; }
  bool? isAllowedToAuthenticateWithBiometrics() { return _allowed!; }

  // init LocalAuthentication
  LocalAuthentication? _auth;
  void setLocalAuth() {
    _auth = LocalAuthentication();
    setIsAllowedToAuthenticateWithBiometrics(_auth != null);
  }
  LocalAuthentication? getLocalAuth() { return _auth; }

  // list of available biometrics
  final List<BiometricType> _biometricsList = List<BiometricType>.empty(growable: true);
  void setBiometricsList(List<BiometricType>? list) { _biometricsList.addAll(list!); }
  List<BiometricType>? getBiometricsList() { return _biometricsList; }

  Future<bool>? init();

  Future<void> isDeviceIsSupported();

  Future<void> checkForBiometricsSupport();

  Future<void> getAvailableBiometrics();

  Future<bool>? authenticate();

}