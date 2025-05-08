import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTLoadingComponent extends WTComponent {

  VoidCallback? action;
  void setAction(VoidCallback? v) { action = v; }

  dynamic content;
  void setContent(dynamic v) { content = v; }

  IconData? icon;
  double? iconSize;
  Color? iconColor, iconBackgroundColor;
  void setIcon(IconData? v) { icon = v; }
  void setIconColor(Color? v) { iconColor = v; }
  void setIconBackgroundColor(Color? v) { iconBackgroundColor = v; }
  void setIconSize(double? v) { iconSize = v; }

  double? imageSize;
  void setImageSize(double? v) { imageSize = v; }
  String? assetImage;
  void setAssetImage(String? v) { assetImage = v; }
  String? networkImage;
  void setNetworkImage(String? v) { networkImage = v; }
  Uint8List? memoryImage;
  void setMemoryImage(Uint8List? v) { memoryImage = v; }

  double? primaryButtonLabelSize, secondaryButtonLabelSize;
  String? primaryButtonLabel, secondaryButtonLabel;
  Color? primaryButtonLabelColor, primaryButtonBackgroundColor, secondaryButtonLabelColor, secondaryButtonBackgroundColor;
  void setPrimaryButtonLabel(String? v) { primaryButtonLabel = v; }
  void setPrimaryButtonLabelSize(double? v) { primaryButtonLabelSize = v; }
  void setPrimaryButtonLabelColor(Color? v) { primaryButtonLabelColor = v; }
  void setPrimaryButtonBackgroundColor(Color? v) { primaryButtonBackgroundColor = v; }
  void setSecondaryButtonLabel(String? v) { secondaryButtonLabel = v; }
  void setSecondaryButtonLabelSize(double? v) { secondaryButtonLabelSize = v; }
  void setSecondaryButtonLabelColor(Color? v) { secondaryButtonLabelColor = v; }
  void setSecondaryButtonBackgroundColor(Color? v) { secondaryButtonBackgroundColor = v; }

  String? title, subtitle, label;
  double? titleSize, subtitleSize, labelSize;
  Color? titleColor, titleBackgroundColor, subtitleColor, subtitleBackgroundColor, labelColor, labelBackgroundColor;
  void setTitle(String? v) { title = v; }
  void setTitleSize(double? v) { titleSize = v; }
  void setTitleColor(Color? v) { titleColor = v; }
  void setTitleBackgroundColor(Color? v) { titleBackgroundColor = v; }
  void setSubtitle(String? v) { subtitle = v; }
  void setSubtitleSize(double? v) { subtitleSize = v; }
  void setSubtitleColor(Color? v) { subtitleColor = v; }
  void setSubtitleBackgroundColor(Color? v) { subtitleBackgroundColor = v; }
  void setLabel(String? v) { label = v; }
  void setLabelSize(double? v) { labelSize = v; }
  void setLabelColor(Color? v) { labelColor = v; }
  void setLabelBackgroundColor(Color? v) { labelBackgroundColor = v; }

  Color? shimmerPrimaryColor, shimmerSecondaryColor, tertiaryColor;
  void setShimmerPrimaryColor(Color? v) { shimmerPrimaryColor = v; }
  void setShimmerSecondaryColor(Color? v) { shimmerSecondaryColor = v; }
  void setShimmerTertiaryColor(Color? v) { tertiaryColor = v; }

}