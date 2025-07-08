import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/notifier/wtoolbox_notifier.dart';
import 'package:wtoolbox/notifier/wtoolbox_notifier_service.dart';
import 'package:wtoolbox/router/wtoolbox_routes.dart';
import 'package:wtoolbox/router/wtoolbox_router.dart';
import 'package:wtoolbox/translation/wtoolbox_translations.dart';
import 'package:wtoolbox/translation/wtoolbox_translation.dart';

abstract class WTApplicationStarter {

  /// application title
  String? _title = '';
  void setTitle(String? v) { _title = v; }
  String? getTitle() { return _title; }

  /// application settings (dotenv)
  Map<String, dynamic>? _settings = <String, dynamic>{};
  void setSettings(Map<String, dynamic>? v) { _settings = v; }
  Map<String, dynamic>? getSettings() { return _settings; }

  // register/unregister application translations
  WTTranslations? _translations;
  void registerTranslations(WTTranslations? translations) {
    _translations = translations;
    Get.find<WTTranslation>().setKeys(_translations!.keys);
  }
  void unregisterTranslations() {}

  // subscribe/unsubscribe application notifer
  WTNotifier? _notifier;
  void subscribeNotifier(WTNotifier? notifier) {
    _notifier = notifier;
    Get.find<WTNotifierService>().subscribe(_notifier);
  }
  void unsubscribeNotifier() {
    Get.find<WTNotifierService>().unsubscribe(_notifier!.getTitle());
  }

  // register/unregister application routes
  WTRoutes? _routes;
  void registerRoutes(WTRoutes? routes) {
    _routes = routes;
    Get.find<WTRouter>().registerRoutes(_routes!.getRoutes());
  }
  void unregisterRoutes() {
    Get.find<WTRouter>().unregisterRoutes(_routes!.getRoutes());
  }

  // register/unregister classes
  Future<void> register();
  Future<void> unregister();

}