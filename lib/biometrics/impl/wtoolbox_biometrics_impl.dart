import 'package:flutter/services.dart';
import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/external/lib_local_auth.dart';
import 'package:wtoolbox/logger/wtoolbox_logger.dart';
import '../wtoolbox_biometrics.dart';

class WTBiometricsImpl extends WTBiometrics {

  WTBiometricsImpl() {
    init();
  }

  @override
  Future<bool>? init() async {
    setLocalAuth();
    if(!isAllowedToAuthenticateWithBiometrics()!) { return false; }

    await isDeviceIsSupported();
    if(!isAllowedToAuthenticateWithBiometrics()!) { return false; }

    await checkForBiometricsSupport();
    if(!isAllowedToAuthenticateWithBiometrics()!) { return false; }

    await getAvailableBiometrics();
    return isAllowedToAuthenticateWithBiometrics()!;
  }

  @override
  Future<void> isDeviceIsSupported() async {
    bool? check = await getLocalAuth()!.isDeviceSupported();
    setIsAllowedToAuthenticateWithBiometrics(check);
  }

  @override
  Future<void> checkForBiometricsSupport() async {
    try {
      bool? check = await getLocalAuth()!.canCheckBiometrics;
      setIsAllowedToAuthenticateWithBiometrics(check);
    } on PlatformException catch (e) {
      WTLogger.write('WTBiometrics.checkForBiometricsSupport() error: $e');
      setIsAllowedToAuthenticateWithBiometrics(false);
    }
  }

  @override
  Future<void> getAvailableBiometrics() async {
    try {
      List<BiometricType>? list = await getLocalAuth()!.getAvailableBiometrics();
      setBiometricsList(list);
      setIsAllowedToAuthenticateWithBiometrics(true);
    } on PlatformException catch (e) {
      WTLogger.write('WTBiometrics.getAvailableBiometrics() error: $e');
      setBiometricsList(<BiometricType>[]);
      setIsAllowedToAuthenticateWithBiometrics(false);
    }
  }

  @override
  Future<bool>? authenticate() async {
    var list = getBiometricsList();
    if(
      list!.contains(BiometricType.fingerprint) || 
      list.contains(BiometricType.face) || 
      list.contains(BiometricType.weak) || 
      list.contains(BiometricType.strong)
    ) {
      try {
        bool? didAuthenticate = await getLocalAuth()!.authenticate(
          localizedReason: 'biometricsMessage'.tr,
          //biometricOnly: true,
          options: const AuthenticationOptions(biometricOnly: true)
        );
        return didAuthenticate;
      } on PlatformException catch(e) {
        WTLogger.write('WTBiometrics.authenticate() error: $e');
        return false;
      }
    }else {
      return false;
    }
  }

}