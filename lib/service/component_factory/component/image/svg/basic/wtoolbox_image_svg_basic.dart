import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_svg.dart';
import '../../wtoolbox_image.dart';
import '../../../wtoolbox_component_builder.dart';

class WTImageSvgBasic extends WTImage {

  BoxDecoration? createDecoration() {
    if(borderType == WTImageBorderType.none.name) {
      return BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(1.0)),
        color: backgroundColor!,
      );
    }

    if(borderType == WTImageBorderType.circle.name) {
      return BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: Border.all(
          color: borderColor!,
          width: 4,
        ),
      );
    }

    if(borderType == WTImageBorderType.rectangle.name) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
        border: Border.all(
          color: borderColor!,
          width: 4,
        ),
      );
    }

    return null;
  }

  void setImageSize(double? screenWidth) {
    if(size != null) {
      if(size == WTImageSize.small.name) {
        width  = screenWidth! * 0.1;
        height = screenWidth * 0.1;
      }

      if(size == WTImageSize.medium.name) {
        width  = screenWidth! * 0.6;
        height = screenWidth * 0.4;
      }

      if(size == WTImageSize.large.name) {
        width  = screenWidth! * 0.8;
        height = screenWidth * 0.4;
      }
    }
  }

  Widget? createBody() {
    /// asset
    if(svgImageAsset != null) {
      return SvgPicture.asset(
        svgImageAsset!,
        fit: BoxFit.fill,
        width: width,
        height: height,
      );
    }

    /// file
    if(svgImageFile != null) {
      return SvgPicture.file(
        svgImageFile!,
        fit: BoxFit.fill,
        width: width,
        height: height,
      );
    }

    /// memory
    if(svgImageMemory != null) {
     return SvgPicture.memory(
       svgImageMemory!,
       fit: BoxFit.fill,
       width: width,
       height: height,
     );
    }

    /// network
    if(svgImageNetwork != null) {
     return SvgPicture.network(
       svgImageNetwork!,
       fit: BoxFit.fill,
       width: width,
       height: height,
     );
    }

    /// string
    if(svgImageString != null) {
      return SvgPicture.string(
        svgImageString!,
        fit: BoxFit.fill,
        width: width,
        height: height,
      );
    }

    return WTComponentBuilder.emptyComponent();
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      builder: (context, constraints) {
        setImageSize(constraints.maxWidth);

        return Container(
          key: getUniqueKey(),
          width: width,
          height: height,
          padding: padding,
          margin: margin,
          alignment: Alignment.center,
          decoration: createDecoration(),
          child: createBody(),
        );
      }
    );
  }

}