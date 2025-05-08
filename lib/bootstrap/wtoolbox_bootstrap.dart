import 'package:wtoolbox/3rd_party/lib_getx.dart';
import '../observable/wtoolbox_observer.dart';
import '../observable/wtoolbox_observable.dart';
import '../service/router_register/wtoolbox_routing.dart';
import '../service/router_register/wtoolbox_router_register_service.dart';
import '../service/translation/wtoolbox_translations.dart';
import '../service/translation/wtoolbox_translation_service.dart';

abstract class WTBootstrap {

  /// application name
  String? _name = '';
  void setName(String? name) { _name = name; }
  String? getName() { return _name; }

  /// app settings
  Map<String, dynamic>? _settings = <String, dynamic>{};
  void setSettings(Map<String, dynamic>? v) { _settings = v; }
  Map<String, dynamic>? getSettings() { return _settings; }

  // register/unregister translations
  WTTranslations? _translations;
  void registerTranslations(WTTranslations? translations) {
    _translations = translations;
    Get.find<WTTranslationService>().setKeys(_translations!.keys);
  }
  void unregisterTranslations() {}

  // subscribe/unsubscribe observers
  WTObserver? _observer;
  void subscribeObserver(WTObserver? observer) {
    _observer = observer;
    Get.find<WTObservable>().subscribe(_observer);
  }
  void unsubscribeObserver() {
    Get.find<WTObservable>().unsubscribe(_observer!.getName());
  }

  // register/unregister application routes
  WTRouting? _routing;
  void registerRoutes(WTRouting? routing) {
    _routing = routing;
    Get.find<WTRouterRegisterService>().registerRoutes(_routing!.getRoutes());
  }
  void unregisterRoutes() {
    Get.find<WTRouterRegisterService>().unregisterRoutes(_routing!.getRoutes());
  }

  // register/unregister classes
  Future<void> register();
  Future<void> unregister();

}