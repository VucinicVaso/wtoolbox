import '../wtoolbox_component_config.dart';
import '../../../theme/wtoolbox_theme_service_extension.dart';

class WTComponentConfigMd extends WTComponentConfig {

  WTComponentConfigMd({ WTThemeServiceExtension? theme, double? deviceWidth, double? deviceHeight }) {
    setTheme(theme);
    setDeviceWidth(deviceWidth);
    setDeviceHeight(deviceHeight);
    setComponentsConfiguration();
  }

  @override
  void setComponentsConfiguration() {}

}