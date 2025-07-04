import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:wtoolbox/external/lib_uuid.dart';
import 'package:wtoolbox/external/lib_device_info_plus.dart';
import 'package:wtoolbox/logger/wtoolbox_logger.dart';
import '../wtoolbox_device.dart';

class WTDeviceImpl extends WTDevice {

  WTDeviceImpl() {
    getDeviceData();
  }

  @override
  Future<void> getDeviceData() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if(kIsWeb) {
        var info = await deviceInfo.webBrowserInfo;
        Map<dynamic, dynamic> infoMap = webBrowserData(info);
        setDevice({ 'id': uuid.v4(), 'platform': 'WEB', 'data': infoMap });
      }
      if(!kIsWeb) {
        if(Platform.isAndroid) {
          var info = await deviceInfo.androidInfo;
          Map<dynamic, dynamic> infoMap = androidDeviceData(info);
          setDevice({ 'id': uuid.v4(), 'platform': 'ANDROID', 'data': infoMap });
        }
        if(Platform.isIOS) {
          var info = await deviceInfo.iosInfo;
          Map<dynamic, dynamic> infoMap = iosDeviceData(info);
          setDevice({ 'id': uuid.v4(), 'platform': 'IOS', 'data': infoMap });
        }
        if(Platform.isWindows) {
          var info = await deviceInfo.windowsInfo;
          Map<dynamic, dynamic> infoMap = windowsDeviceData(info);
          setDevice({ 'id': uuid.v4(), 'platform': 'WINDOWS', 'data': infoMap });
        }
        if(Platform.isLinux) {
          var info = await deviceInfo.linuxInfo;
          Map<dynamic, dynamic> infoMap = linuxDeviceData(info);
          setDevice({ 'id': uuid.v4(), 'platform': 'LINUX', 'data': infoMap });
        }
        if(Platform.isMacOS) {
          var info = await deviceInfo.macOsInfo;
          Map<dynamic, dynamic> infoMap = macOsDeviceData(info);
          setDevice({ 'id': uuid.v4(), 'platform': 'MACOS', 'data': infoMap });
        }
        if(Platform.isFuchsia) {
          var infoMap = {};
          setDevice({ 'id': uuid.v4(), 'platform': 'FUCHSIA', 'data': infoMap });
        }
      }
    } on PlatformException {
      WTLogger.write('WTDevice.getDeviceData() error: Failed to get platform version.');
    }
  }

  @override
  Map<dynamic, dynamic> androidDeviceData(AndroidDeviceInfo build) {
    return <dynamic, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt':        build.version.sdkInt,
      'version.release':       build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental':   build.version.incremental,
      'version.codename':      build.version.codename,
      'version.baseOS':        build.version.baseOS,
      'board':                 build.board,
      'bootloader':            build.bootloader,
      'brand':                 build.brand,
      'device':                build.device,
      'display':               build.display,
      'fingerprint':           build.fingerprint,
      'hardware':              build.hardware,
      'host':                  build.host,
      'id':                    build.id,
      'manufacturer':          build.manufacturer,
      'model':                 build.model,
      'product':               build.product,
      'supported32BitAbis':    build.supported32BitAbis,
      'supported64BitAbis':    build.supported64BitAbis,
      'supportedAbis':         build.supportedAbis,
      'tags':                  build.tags,
      'type':                  build.type,
      'isPhysicalDevice':      build.isPhysicalDevice,
      'systemFeatures':        build.systemFeatures,
      'serialNumber':          build.serialNumber,
    };
  }

  @override
  Map<dynamic, dynamic> iosDeviceData(IosDeviceInfo data) {
    return <dynamic, dynamic>{
      'name':                data.name,
      'systemName':          data.systemName,
      'systemVersion':       data.systemVersion,
      'model':               data.model,
      'localizedModel':      data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice':    data.isPhysicalDevice,
      'utsname.sysname:':    data.utsname.sysname,
      'utsname.nodename:':   data.utsname.nodename,
      'utsname.release:':    data.utsname.release,
      'utsname.version:':    data.utsname.version,
      'utsname.machine:':    data.utsname.machine,
    };
  }

  @override
  Map<dynamic, dynamic> windowsDeviceData(WindowsDeviceInfo data) {
    return <dynamic, dynamic>{
      'numberOfCores':           data.numberOfCores,
      'computerName':            data.computerName,
      'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
      'userName':                data.userName,
      'majorVersion':            data.majorVersion,
      'minorVersion':            data.minorVersion,
      'buildNumber':             data.buildNumber,
      'platformId':              data.platformId,
      'csdVersion':              data.csdVersion,
      'servicePackMajor':        data.servicePackMajor,
      'servicePackMinor':        data.servicePackMinor,
      'suitMask':                data.suitMask,
      'productType':             data.productType,
      'reserved':                data.reserved,
      'buildLab':                data.buildLab,
      'buildLabEx':              data.buildLabEx,
      'digitalProductId':        data.digitalProductId,
      'displayVersion':          data.displayVersion,
      'editionId':               data.editionId,
      'installDate':             data.installDate,
      'productId':               data.productId,
      'productName':             data.productName,
      'registeredOwner':         data.registeredOwner,
      'releaseId':               data.releaseId,
      'deviceId':                data.deviceId,
    };
  }

  @override
  Map<dynamic, dynamic> linuxDeviceData(LinuxDeviceInfo data) {
    return <dynamic, dynamic>{
      'name':            data.name,
      'version':         data.version,
      'id':              data.id,
      'idLike':          data.idLike,
      'versionCodename': data.versionCodename,
      'versionId':       data.versionId,
      'prettyName':      data.prettyName,
      'buildId':         data.buildId,
      'variant':         data.variant,
      'variantId':       data.variantId,
      'machineId':       data.machineId,
    };
  }

  @override
  Map<String, dynamic> macOsDeviceData(MacOsDeviceInfo data) {
    return <String, dynamic>{
      'computerName':  data.computerName,
      'hostName':      data.hostName,
      'arch':          data.arch,
      'model':         data.model,
      'kernelVersion': data.kernelVersion,
      'majorVersion':  data.majorVersion,
      'minorVersion':  data.minorVersion,
      'patchVersion':  data.patchVersion,
      'osRelease':     data.osRelease,
      'activeCPUs':    data.activeCPUs,
      'memorySize':    data.memorySize,
      'cpuFrequency':  data.cpuFrequency,
      'systemGUID':    data.systemGUID,
    };
  }

  @override
  Map<String, dynamic> webBrowserData(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName':         data.browserName.name,
      'appCodeName':         data.appCodeName,
      'appName':             data.appName,
      'appVersion':          data.appVersion,
      'deviceMemory':        data.deviceMemory,
      'language':            data.language,
      'languages':           data.languages,
      'platform':            data.platform,
      'product':             data.product,
      'productSub':          data.productSub,
      'userAgent':           data.userAgent,
      'vendor':              data.vendor,
      'vendorSub':           data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints':      data.maxTouchPoints,
    };
  }

}