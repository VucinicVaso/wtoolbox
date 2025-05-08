import 'wtoolbox_component_config.dart';
import '../../theme/wtoolbox_theme_service_extension.dart';

abstract class WTComponentConfiguration {

  bool? isInitialized = false;
  void initialize() { isInitialized = true; }

  double? deviceWidth, deviceHeight;
  void setDeviceWidth(double? v) { deviceWidth = v; }
  void setDeviceHeight(double? v) { deviceHeight = v; }

  WTThemeServiceExtension? theme;
  void setTheme(WTThemeServiceExtension? v) { 
    theme = v;

    if(config != null) { 
      config!
        ..setTheme(theme)
        ..setComponentsConfiguration(); 
    }
  }

  WTComponentConfig? config;
  void setConfig(WTComponentConfig? v) { config = v; }

  void initComponentConfiguration();

}