import 'package:wtoolbox/3rd_party/lib_getx.dart';
import 'package:wtoolbox/3rd_party/lib_dotenv.dart';
import '../wtoolbox_dependency_injection.dart';
import '../../helper/encryption/wtoolbox_encryption.dart';
import '../../helper/encryption/impl/wtoolbox_encryption_impl.dart';
import '../../helper/device/wtoolbox_device.dart';
import '../../helper/device/impl/wtoolbox_device_impl.dart';
import '../../observable/wtoolbox_observable.dart';
import '../../observable/impl/wtoolbox_observable_impl.dart';
import '../../repository/account/account_repository.dart';
import '../../repository/account/hive/hive_account_repository.dart';
import '../../service/database/wtoolbox_database_service.dart';
import '../../service/database/impl/wtoolbox_hive_database_service.dart';
import '../../service/router_register/wtoolbox_router_register_service.dart';
import '../../service/router_register/impl/wtoolbox_router_register_service_impl.dart';
import '../../service/oauth2/wtoolbox_oauth2_registration_service.dart';
import '../../service/oauth2/impl/wtoolbox_oauth2_registration_service_impl.dart';
import '../../service/translation/wtoolbox_translation_service.dart';
import '../../service/translation/impl/wtoolbox_translation_service_impl.dart';
import '../../service/biometrics/wtoolbox_biometrics_service.dart';
import '../../service/biometrics/impl/wtoolbox_biometrics_service_impl.dart';
import '../../service/app_lifecycle/wtoolbox_app_lifecycle_service.dart';
import '../../service/app_lifecycle/impl/wtoolbox_app_lifecycle_service_impl.dart';
import '../../service/document/file/wtoolbox_file_service.dart';
import '../../service/document/file/impl/wtoolbox_file_service_impl.dart';
import '../../service/document/image/wtoolbox_image_service.dart';
import '../../service/document/image/impl/wtoolbox_image_service_impl.dart';
import '../../service/document/pdf/wtoolbox_pdf_service.dart';
import '../../service/document/pdf/impl/wtoolbox_pdf_service_impl.dart';
import '../../service/http/helper/wtoolbox_http_support.dart';
import '../../service/http/wtoolbox_http_service.dart';
import '../../service/http/impl/wtoolbox_http_service_impl.dart';
import '../../service/theme/wtoolbox_theme_service.dart';
import '../../service/theme/impl/wtoolbox_theme_service_impl.dart';
import '../../service/component_factory/factory/wtoolbox_component_factory_service.dart';
import '../../service/component_factory/factory/impl1/wtoolbox_component_factory_service_impl1.dart';
import '../../service/notification/wtoolbox_local_notification_service.dart';
import '../../service/notification/impl/wtoolbox_local_notification_service_impl.dart';

class WTDependencyInjectionImpl extends WTDependencyInjection {

  @override
  Future<void> register({ String? dotenvFileName }) async {
    // load .env file
    await dotenv.load(fileName: dotenvFileName!);

    // create connection and instance for local database, instances and initializations for repositories && services
    WTDatabaseService db = WTHiveDatabaseService();
    await db.init();
    Get.put<WTDatabaseService>(db);

    var hAr = HiveAccountRepository();
    await hAr.initConnection(0);
    Get.put<AccountRepository>(hAr);

    var device = WTDeviceImpl();
    await device.getDeviceData();
    Get.put<WTDevice>(device);

    Get.put<WTEncryption>(WTEncryptionImpl());
    Get.put<WTTranslationService>(WTTranslationServiceImpl());
    Get.put<WTRouterRegisterService>(WTRouterRegisterServiceImpl());
    Get.put<WTObservable>(WTObservableImpl());
    Get.put<WTOAuth2RegistrationService>(WTOAuth2RegistrationServiceImpl());
    Get.put<WTAppLifecycleService>(WTAppLifecycleServiceImpl());
    Get.put<WTBiometricsService>(WTBiometricsServiceImpl());
    Get.put<WTLocalNotificationService>(WTLocalNotificationServiceImpl());
    Get.put<WTFileService>(WTFileServiceImpl());
    Get.put<WTImageService>(WTImageServiceImpl());
    Get.put<WTPdfService>(WTPdfServiceImpl());
    Get.put<WTHttpService>(WTHttpServiceImpl(dotenv.get('SSL_CERTIFICATE')));
    Get.put<WTThemeService>(WTThemeServiceImpl());
    WTHttpSupport.instance.check();

    WTComponentFactoryService? cFsI1 = WTComponentFactoryServiceImpl1()
      ..setTheme(Get.find<WTThemeService>().themeExtensionService!);
    Get.put<WTComponentFactoryService>(cFsI1);
  }

  @override
  Future<void> unregister() async {
    // delete instances for services, repositories, database,
    await Get.delete<WTDevice>(force: true);
    await Get.delete<WTEncryption>(force: true);
    await Get.delete<WTObservable>(force: true);
    await Get.delete<WTTranslationService>(force: true);
    await Get.delete<WTThemeService>(force: true);
    await Get.delete<WTRouterRegisterService>(force: true);
    await Get.delete<WTComponentFactoryService>(force: true);
    await Get.delete<WTOAuth2RegistrationService>(force: true);
    await Get.delete<WTBiometricsService>(force: true);
    await Get.delete<WTAppLifecycleService>(force: true);
    await Get.delete<WTFileService>(force: true);
    await Get.delete<WTImageService>(force: true);
    await Get.delete<WTPdfService>(force: true);
    await Get.delete<WTHttpService>(force: true);
    await Get.delete<WTLocalNotificationService>(force: true);

    if(Get.isRegistered<AccountRepository>()) {
      await Get.find<AccountRepository>().closeConnection();
      await Get.delete<AccountRepository>(force: true);
    }

    await Get.find<WTDatabaseService>().close();
    await Get.delete<WTDatabaseService>(force: true);
  }

}

WTDependencyInjection? dependencyInjection = WTDependencyInjectionImpl();