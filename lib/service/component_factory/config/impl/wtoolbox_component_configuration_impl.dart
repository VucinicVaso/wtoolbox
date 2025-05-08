import '../../../../3rd_party/lib_getx.dart';
import '../../../theme/wtoolbox_theme_service.dart';
import '../wtoolbox_component_configuration.dart';
import 'wtoolbox_component_config_md.dart';

class WTComponentConfigurationImpl extends WTComponentConfiguration {

  @override
  void initComponentConfiguration() {
    if(isInitialized == false) {
      setDeviceWidth(Get.width);
      setDeviceHeight(Get.height);
      setTheme(Get.find<WTThemeService>().themeExtensionService!);
      initialize();

      if(deviceWidth! > 390) {
        setConfig(WTComponentConfigMd(theme: theme, deviceWidth: deviceWidth, deviceHeight: deviceHeight)); 
      }
    }
  }

}