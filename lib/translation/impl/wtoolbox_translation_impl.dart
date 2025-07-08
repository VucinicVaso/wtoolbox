import 'dart:ui';
import 'package:wtoolbox/external/lib_getx.dart';
import '../wtoolbox_translation.dart';
import 'wtoolbox_translation_catalog.dart';

class WTTranslationImpl extends WTTranslation {

  WTTranslationImpl() {
    appKeys.clear();
    keys.clear();
    Get.translations.clear();
    setInitialLocalization(label: 'en_US');
    setLocalization(label: initialLocalization!);
    setKeys(WTTranslationCatalog().keys);
  }

  @override
  void setInitialLocalization({ String? label }) {
    initialLocalization = label;
  }

  @override
  void setLocalization({ String? label }) {
    localization = label;
    locale = Locale(localization!);
    Get.updateLocale(locale!);
  }

  @override
  void setKeys(Map<String, Map<String, String>>? keyMap) {
    if(appKeys.isEmpty) {
      appKeys.addAll(keyMap!);
      Get.appendTranslations(keys);
    }else {
      List<String>? duplicateKeys = [ 'key' ];
      appKeys.forEach((k1, v1) =>
        keyMap!.forEach((k2, v2) {
          v2.removeWhere((k3, v3) => duplicateKeys.contains(k3));
          if(k1 == k2) { v1.addAll(v2); }
        }
      ));

      appKeys = appKeys;
      Get.appendTranslations(keys);
    }
  }

}