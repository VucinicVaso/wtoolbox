import 'package:flutter/services.dart';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import 'package:wtoolbox/3rd_party/lib_local_auth.dart';
import '../../../helper/logger/wtoolbox_logger.dart';
import '../wtoolbox_biometrics_service.dart';

class WTBiometricsServiceImpl extends WTBiometricsService {

  WTBiometricsServiceImpl() {
    init();
  }

  @override
  Future<bool>? init() async {
    setLocalAuth();
    if(!isAllowedToAuthenticateWithBiometrics()!) { return false; }

    await checkIfDeviceIsSupported();
    if(!isAllowedToAuthenticateWithBiometrics()!) { return false; }

    await checkForBiometricsSupport();
    if(!isAllowedToAuthenticateWithBiometrics()!) { return false; }

    await getAvailableBiometrics();
    return isAllowedToAuthenticateWithBiometrics()!;
  }

  @override
  Future<void> checkIfDeviceIsSupported() async {
    bool? check = await getLocalAuth()!.isDeviceSupported();
    setIsAllowedToAuthenticateWithBiometrics(check);
  }

  @override
  Future<void> checkForBiometricsSupport() async {
    try {
      bool? check = await getLocalAuth()!.canCheckBiometrics;
      setIsAllowedToAuthenticateWithBiometrics(check);
    } on PlatformException catch (e) {
      WTLogger.write('WTBiometricsServiceImpl.checkForBiometricsSupport error: $e');
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
      WTLogger.write('WTBiometricsServiceImpl.getAvailableBiometrics: $e');
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
        WTLogger.write('WTBiometricsServiceImpl.authenticate: $e');
        return false;
      }
    }else {
      return false;
    }
  }

}