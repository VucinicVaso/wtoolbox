import 'dart:io';
import 'dart:typed_data';
import '../wtoolbox_component.dart';

enum WTImageSize {
  small,
  medium,
  large
}

enum WTImageBorderType {
  none,
  circle,
  rectangle
}

abstract class WTImage extends WTComponent {

  String? borderType; // none, circle, rectangle
  void setBorderType(String? v) { borderType = v; }
  void withoutBorder() { borderType = WTImageBorderType.none.name; }
  void withCircleBorder() { borderType = WTImageBorderType.circle.name; }
  void withRectangleBorder() { borderType = WTImageBorderType.rectangle.name; }

  String? size; // small, medium, large
  void small() { size = WTImageSize.small.name; }
  void medium() { size = WTImageSize.medium.name; }
  void large() { size = WTImageSize.large.name; }

  String? assetImage;
  String? networkImage;
  Uint8List? memoryImage;
  void setAssetImage(String? v) { assetImage = v; }
  void setNetworkImage(String? v) { networkImage = v; }
  void setMemoryImage(Uint8List? v) { memoryImage = v; }

  File? svgImageFile;
  Uint8List? svgImageMemory;
  String? svgImageString, svgImageNetwork, svgImageAsset;
  void setSvgImageFromFile(File? v) { svgImageFile = v; }
  void setSvgImageFromMemory(Uint8List? v) { svgImageMemory = v; }
  void setSvgImageFromAssets(String? v) { svgImageAsset = v; }
  void setSvgImageFromNetwork(String? v) { svgImageNetwork = v; }
  void setSvgImageFromString(String? v) { svgImageString = v; }

}