import 'dart:ui';
import 'package:wtoolbox/3rd_party/lib_getx.dart';

abstract class WTTranslationService extends Translations {

  Locale? locale;
  Locale? fallbackLocale = const Locale('me_MNE');

  String? initialLocalization, localization;
  void setInitialLocalization({ String? label });
  void setLocalization({ String? label });

  Map<String, Map<String, String>> appKeys = <String, Map<String, String>>{}.obs;
  @override
  Map<String, Map<String, String>> get keys => appKeys;
  void setKeys(Map<String, Map<String, String>>? keyMap);

}
