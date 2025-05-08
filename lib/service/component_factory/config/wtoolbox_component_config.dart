import '../../theme/wtoolbox_theme_service_extension.dart';

abstract class WTComponentConfig {

  WTThemeServiceExtension? theme;
  void setTheme(WTThemeServiceExtension? v) { theme = v; }

  double? deviceWidth, deviceHeight;
  void setDeviceWidth(double? v) { deviceWidth = v; }
  void setDeviceHeight(double? v) { deviceHeight = v; }

  void setComponentsConfiguration();

}