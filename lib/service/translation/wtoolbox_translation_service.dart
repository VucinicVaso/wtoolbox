import 'dart:ui';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import '../../entity/language/language.dart';

abstract class WTTranslationService extends Translations {

  Locale? locale;
  Locale? fallbackLocale = const Locale('me_MNE');

  Language? translation;
  void setTranslation(Language? entity);
  Language? getTranslation();

  void setInitTranslationLanguage();
  void setAccountTranslationLanguage(Language? entity);

  Map<String, Map<String, String>> appKeys = <String, Map<String, String>>{}.obs;
  @override
  Map<String, Map<String, String>> get keys => appKeys;
  void setKeys(Map<String, Map<String, String>>? keyMap);

}
