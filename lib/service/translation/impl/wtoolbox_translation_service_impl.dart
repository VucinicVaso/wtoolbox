import 'dart:ui';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import '../wtoolbox_translation_service.dart';
import '../common/common_translation.dart';
import '../../../entity/language/language.dart';

class WTTranslationServiceImpl extends WTTranslationService {

  WTTranslationServiceImpl() {
    appKeys.clear();
    keys.clear();
    Get.translations.clear();
    setInitTranslationLanguage();
    setKeys(CommonTranslation().keys);
  }

  @override
  void setTranslation(Language? entity) {
    translation = entity;
    locale = Locale(translation!.label!);
    Get.updateLocale(locale!);
  }

  @override
  Language? getTranslation() { return translation; }

  @override
  void setInitTranslationLanguage() {
    //setTranslation(LanguageEntity(key: 1, label: 'me_MNE', language: 'Montenegrin', selected: true));
    setTranslation(Language(key: 2, label: 'en_US', language: 'English', selected: true));
  }

  @override
  void setAccountTranslationLanguage(Language? lE) {
    setTranslation(lE);
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