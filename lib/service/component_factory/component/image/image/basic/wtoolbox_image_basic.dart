import 'package:flutter/material.dart';
import '../../wtoolbox_image.dart';

class WTImageBasic extends WTImage {

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

  BoxDecoration? createAssetImage() {
    if(borderType == WTImageBorderType.circle.name) {
      return BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: Border.all(
          color: borderColor!,
          width: 4,
        ),
        image: DecorationImage(
          image: AssetImage(assetImage!),
          fit: BoxFit.cover
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
        image: DecorationImage(
          image: AssetImage(assetImage!),
          fit: BoxFit.cover
        ),
      );
    }

    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      color: backgroundColor!,
      image: DecorationImage(
        image: AssetImage(assetImage!),
        fit: BoxFit.cover
      ),
    );
  }

  BoxDecoration? createMemoryImage() {
    if(borderType == WTImageBorderType.circle.name) {
      return BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: Border.all(
          color: borderColor!,
          width: 4,
        ),
        image: DecorationImage(
          image: MemoryImage(memoryImage!),
          fit: BoxFit.cover
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
        image: DecorationImage(
          image: MemoryImage(memoryImage!),
          fit: BoxFit.cover
        ),
      );
    }

    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      color: backgroundColor!,
      image: DecorationImage(
        image: MemoryImage(memoryImage!),
        fit: BoxFit.cover
      ),
    );
  }

  BoxDecoration? createNetworkImage() {
    if(borderType == WTImageBorderType.circle.name) {
      return BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: Border.all(
          color: borderColor!,
          width: 4,
        ),
        image: DecorationImage(
          image: NetworkImage(networkImage!),
          fit: BoxFit.cover
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
        image: DecorationImage(
          image: NetworkImage(networkImage!),
          fit: BoxFit.cover
        ),
      );
    }

    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      color: backgroundColor!,
      image: DecorationImage(
        image: NetworkImage(networkImage!),
        fit: BoxFit.cover
      ),
    );
  }

  BoxDecoration? createBodyDecoration() {
    /// asset
    if(assetImage != null) {
      return createAssetImage();
    }

    /// memory
    if(memoryImage != null) {
      return createMemoryImage();
    }

    /// network
    if(networkImage != null) {
      return createNetworkImage();
    }

    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      color: backgroundColor!,
    );
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
          decoration: createBodyDecoration(),
        );
      }
    );
  }

}