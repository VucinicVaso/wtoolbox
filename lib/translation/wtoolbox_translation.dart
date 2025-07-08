import 'dart:ui';
import 'package:wtoolbox/external/lib_getx.dart';

abstract class WTTranslation extends Translations {

  Locale? locale;
  Locale? fallbackLocale = const Locale('en_US');

  String? initialLocalization, localization;
  void setInitialLocalization({ String? label });
  void setLocalization({ String? label });

  Map<String, Map<String, String>> appKeys = <String, Map<String, String>>{}.obs;
  @override
  Map<String, Map<String, String>> get keys => appKeys;
  void setKeys(Map<String, Map<String, String>>? keyMap);

}
