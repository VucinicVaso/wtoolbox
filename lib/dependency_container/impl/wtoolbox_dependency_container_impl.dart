import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/external/lib_dotenv.dart';
import 'package:wtoolbox/encryption/wtoolbox_encryption.dart';
import 'package:wtoolbox/encryption/impl/wtoolbox_encryption_impl.dart';
import 'package:wtoolbox/device/wtoolbox_device.dart';
import 'package:wtoolbox/device/impl/wtoolbox_device_impl.dart';
import 'package:wtoolbox/notifier/wtoolbox_notifier_service.dart';
import 'package:wtoolbox/notifier/impl/wtoolbox_notifier_service_impl.dart';
import 'package:wtoolbox/database/wtoolbox_database.dart';
import 'package:wtoolbox/database/impl/wtoolbox_hive_database.dart';
import 'package:wtoolbox/application_starter/wtoolbox_application_starter_service.dart';
import 'package:wtoolbox/application_starter/impl/wtoolbox_application_starter_service_impl.dart';
import 'package:wtoolbox/router/wtoolbox_router.dart';
import 'package:wtoolbox/router/impl/wtoolbox_router_impl.dart';
import 'package:wtoolbox/oauth2/wtoolbox_oauth2.dart';
import 'package:wtoolbox/oauth2/impl/wtoolbox_oauth2_impl.dart';
import 'package:wtoolbox/translation/wtoolbox_translation.dart';
import 'package:wtoolbox/translation/impl/wtoolbox_translation_impl.dart';
import 'package:wtoolbox/biometrics/wtoolbox_biometrics.dart';
import 'package:wtoolbox/biometrics/impl/wtoolbox_biometrics_impl.dart';
import 'package:wtoolbox/application_lifecycle/wtoolbox_application_lifecycle.dart';
import 'package:wtoolbox/application_lifecycle/impl/wtoolbox_application_lifecycle_impl.dart';
import 'package:wtoolbox/file_manager/file/wtoolbox_file_service.dart';
import 'package:wtoolbox/file_manager/file/impl/wtoolbox_file_service_impl.dart';
import 'package:wtoolbox/file_manager/image/wtoolbox_image_service.dart';
import 'package:wtoolbox/file_manager/image/impl/wtoolbox_image_service_impl.dart';
import 'package:wtoolbox/file_manager/pdf/wtoolbox_pdf_service.dart';
import 'package:wtoolbox/file_manager/pdf/impl/wtoolbox_pdf_service_impl.dart';
import 'package:wtoolbox/http_adapter/wtoolbox_http_adapter.dart';
import 'package:wtoolbox/http_adapter/impl/wtoolbox_http_adapter_impl.dart';
import 'package:wtoolbox/theme/wtoolbox_theme_catalog.dart';
import 'package:wtoolbox/theme/impl/wtoolbox_theme_service_impl.dart';
import 'package:wtoolbox/widget_factory/factory/wtoolbox_widget_factory.dart';
import 'package:wtoolbox/widget_factory/factory/impl1/wtoolbox_widget_factory_impl1.dart';
import '../wtoolbox_dependency_container.dart';

class WTDependencyContainerImpl extends WTDependencyContainer {

  @override
  Future<void> register({ String? dotenvFile }) async {
    await dotenv.load(fileName: dotenvFile!);

    Get.put<WTDevice>(WTDeviceImpl());
    Get.put<WTDatabase>(WTHiveDatabase());
    Get.put<WTEncryption>(WTEncryptionImpl());
    Get.put<WTApplicationStarterService>(WTApplicationStarterServiceImpl());
    Get.put<WTRouter>(WTRouterImpl());
    Get.put<WTNotifierService>(WTNotifierServiceImpl());
    Get.put<WTOAuth2>(WTOAuth2Impl());
    Get.put<WTApplicationLifecycle>(WTApplicationLifecycleImpl());
    Get.put<WTBiometrics>(WTBiometricsImpl());
    Get.put<WTFileService>(WTFileServiceImpl());
    Get.put<WTImageService>(WTImageServiceImpl());
    Get.put<WTPDFService>(WTPDFServiceImpl());
    Get.put<WTHttpAdapter>(WTHttpAdapterImpl(dotenv.get('SSL_CERTIFICATE')));
    Get.put<WTTranslation>(WTTranslationImpl());
    Get.put<WTThemeCatalog>(WTThemeCatalogImpl());

    WTWidgetFactory? widgetFactory1 = WTWidgetFactoryImpl1()
      ..setTheme(Get.find<WTThemeCatalog>().themeExtension!);
    Get.put<WTWidgetFactory>(widgetFactory1);
  }

  @override
  Future<void> unregister() async {
    await Get.delete<WTDevice>(force: true);
    await Get.delete<WTEncryption>(force: true);
    await Get.delete<WTNotifierService>(force: true);
    await Get.delete<WTTranslation>(force: true);
    await Get.delete<WTThemeCatalog>(force: true);
    await Get.delete<WTRouter>(force: true);
    await Get.delete<WTApplicationStarterService>(force: true);
    await Get.delete<WTWidgetFactory>(force: true);
    await Get.delete<WTOAuth2>(force: true);
    await Get.delete<WTBiometrics>(force: true);
    await Get.delete<WTApplicationLifecycle>(force: true);
    await Get.delete<WTFileService>(force: true);
    await Get.delete<WTImageService>(force: true);
    await Get.delete<WTPDFService>(force: true);
    await Get.delete<WTHttpAdapter>(force: true);

    await Get.find<WTDatabase>().closeConnection();
    await Get.delete<WTDatabase>(force: true);
    
    dotenv.clean();
  }

}

WTDependencyContainer? dependecyContainer = WTDependencyContainerImpl();