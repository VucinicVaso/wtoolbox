import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_svg.dart';
import '../wtoolbox_card_list.dart';
import '../../wtoolbox_component_builder.dart';

class WTCardListInfo extends WTCardList {

  Widget? createImageWidget({
    double? size,
    EdgeInsets? padding,
    EdgeInsets? margin,
    String? assetImage,
    String? networkImage,
    Uint8List? memoryImage,
  }) {
    DecorationImage? decorationImage;
    if(assetImage != null) {
      decorationImage = DecorationImage(
        image: AssetImage(assetImage),
        fit: BoxFit.cover,
      );
    }
    if(networkImage != null) {
      decorationImage = DecorationImage(
        image: NetworkImage(networkImage),
        fit: BoxFit.cover,
      );
    }
    if(memoryImage != null) {
      decorationImage = DecorationImage(
        image: MemoryImage(memoryImage),
        fit: BoxFit.cover
      );
    }

    return Container(
      padding: padding ?? const EdgeInsets.all(0.0),
      margin:  margin ?? const EdgeInsets.all(0.0),
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        color: Colors.transparent,
        image: decorationImage,
      ),
    );
  }

  Widget? createSvgWidget({
    double? size,
    EdgeInsets? padding,
    EdgeInsets? margin,
    File? svgFile,
    Uint8List? svgMemory,
    String? svgString,
    String? svgNetwork,
    String? svgAsset,
  }) {
    SvgPicture? svgPicture;
    if(svgFile != null) {
      svgPicture = SvgPicture.file(
        svgFile,
        fit: BoxFit.fill,
        width: width,
        height: height,
      );
    }
    if(svgMemory != null) {
      svgPicture = SvgPicture.memory(
        svgMemory,
        fit: BoxFit.fill,
        width: width,
        height: height,
      );
    }
    if(svgString != null) {
      svgPicture = SvgPicture.string(
        svgString,
        fit: BoxFit.fill,
        width: width,
        height: height,
      );
    }
    if(svgNetwork != null) {
      svgPicture = SvgPicture.network(
        svgNetwork,
        fit: BoxFit.fill,
        width: width,
        height: height,
      );
    }
    if(svgAsset != null) {
      svgPicture = SvgPicture.asset(
        svgAsset,
        fit: BoxFit.fill,
        width: width,
        height: height,
      );
    }

    return Container(
      padding: padding ?? const EdgeInsets.all(0.0),
      margin: margin ?? const EdgeInsets.all(0.0),
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: Colors.transparent,
      ),
      child: svgPicture,
    );
  }

  Widget? createIconWidget({
    double? size,
    EdgeInsets? padding,
    EdgeInsets? margin,
    IconData? icon,
    Color? iconColor,
    Color? backgroundColor,
    Color? borderColor
  }) {
    return Container(
      width: size,
      height: size,
      padding: padding ?? const EdgeInsets.all(0.0),
      margin: margin ?? const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(color: borderColor!, spreadRadius: 1, blurRadius: 1, offset: const Offset(0, 1)),
        ],
      ),
      child: WTComponentBuilder.createIcon(
        iconData: icon,
        size: size! * 0.7,
        color: iconColor
      ),
    );
  }

  Widget? createStackedIconWidget({
    double? size,
    EdgeInsets? padding,
    EdgeInsets? margin,
    IconData? icon,
    Color? iconColor,
    Color? iconBackgroundColor,
    Color? iconBorderColor,
    IconData? decorationIcon,
    Color? decorationIconColor,
    Color? decorationIconBackgroundColor,
    Color? decorationIconBorderColor
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.all(0.0),
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: iconBackgroundColor,
              boxShadow: <BoxShadow>[
                BoxShadow(color: iconBorderColor!, spreadRadius: 1, blurRadius: 1, offset: const Offset(0, 1)),
              ],
            ),
            child: WTComponentBuilder.createIcon(
              iconData: icon,
              size: size! * 0.6,
              color: iconColor
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size * 0.45,
              height: size * 0.45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: decorationIconBackgroundColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(color: decorationIconBorderColor!, spreadRadius: 1, blurRadius: 1, offset: const Offset(0, 1)),
                ],
              ),
              child: WTComponentBuilder.createIcon(
                iconData: decorationIcon,
                size: size * 0.35,
                color: decorationIconColor
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// item { icon, decorationIcon, assetImage, networkImage, memoryImage, svgImageFile, svgImageMemory, svgImageString, svgImageNetwork, }
  Widget? leftWidget(Map? item) {
    // assetImage, networkImage, memoryImage
    if(item!['assetImage'] != null || item['networkImage'] != null || item['memoryImage'] != null) {
      return createImageWidget(
        size: item['iconSize'],
        margin: const EdgeInsets.only(right: 15.0),
        assetImage: item['assetImage'],
        networkImage: item['networkImage'],
        memoryImage: item['memoryImage'],
      );
    }

    // svgImageFile, svgImageMemory, svgImageString, svgImageNetwork, svgImageAsset
    if(item['svgImageFile'] != null || item['svgImageMemory'] != null || item['svgImageString'] != null
      || item['svgImageNetwork'] != null || item['svgImageAsset'] != null) {
      return createSvgWidget(
        size: item['iconSize'],
        margin: const EdgeInsets.only(right: 15.0),
        svgFile: item['svgImageFile'],
        svgMemory: item['svgImageMemory'],
        svgString: item['svgImageString'],
        svgNetwork: item['svgImageNetwork'],
        svgAsset: item['svgImageAsset'],
      );
    }

    // icon
    if(item['icon'] != null && item['decorationIcon'] == null) {
      return createIconWidget(
        size: item['iconSize'],
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.only(right: 15.0),
        icon: item['icon'],
        iconColor: item['iconColor'],
        backgroundColor: item['iconBackgroundColor'],
        borderColor: item['iconBorderColor'],
      );
    }

    // icon and decorationIcon
    if(item['icon'] != null && item['decorationIcon'] != null) {
      return createStackedIconWidget(
        size: item['iconSize'],
        margin: const EdgeInsets.only(right: 15.0),
        icon: item['icon'],
        iconColor: item['iconColor'],
        iconBackgroundColor: item['iconBackgroundColor'],
        iconBorderColor: item['iconBorderColor'],
        decorationIcon: item['decorationIcon'],
        decorationIconColor: item['decorationIconColor'],
        decorationIconBackgroundColor: item['decorationIconBackgroundColor'],
        decorationIconBorderColor: item['decorationIconBorderColor']
      );
    }

    return WTComponentBuilder.emptyComponent();
  }

  /// item { title, subtitle, heading, description }
  Widget? centerWidget(Map? item) {
    if(item!['title'] == null && item['subtitle'] == null && item['heading'] == null && item['description'] == null) {
      return Expanded(child: WTComponentBuilder.emptyComponent()!);
    }

    Widget? titleWidget = WTComponentBuilder.emptyComponent()!;
    if(item['title'] != null) {
      item['title'] = item['title'].length > 30 ? '${item['title'].substring(0, 25)}...' : item['title'];

      titleWidget = Container(
        margin: const EdgeInsets.only(bottom: 5.0),
        child: WTComponentBuilder.createText(
          text: item['title'],
          textStyle: textStyle(
            textColor: item['titleColor'],
            fontSize: item['titleSize'],
            fontWeight: FontWeight.normal
          ),
        )!,
      );
    }

    Widget? subtitleWidget = WTComponentBuilder.emptyComponent()!;
    if(item['subtitle'] != null) {
      item['subtitle'] = item['subtitle'].length > 25 ? '${item['subtitle'].substring(0, 25)}...' : item['subtitle'];

      subtitleWidget = Container(
        margin: const EdgeInsets.only(bottom: 5.0),
        child: WTComponentBuilder.createText(
          text: item['subtitle'],
          textStyle: textStyle(
            textColor: item['subtitleColor'],
            fontSize: item['subtitleSize'],
            fontWeight: FontWeight.bold
          ),
        )!,
      );
    }

    Widget? headingWidget = WTComponentBuilder.emptyComponent()!;
    if(item['heading'] != null) {
      item['heading'] = item['heading'].length > 25 ? '${item['heading'].substring(0, 25)}...' : item['heading'];

      headingWidget = Container(
        margin: const EdgeInsets.only(bottom: 5.0),
        child: WTComponentBuilder.createText(
          text: item['heading'],
          textStyle: textStyle(
            textColor: item['headingColor'],
            fontSize: item['headingSize']
          ),
        )!,
      );
    }

    Widget? descriptionWidget = WTComponentBuilder.emptyComponent()!;
    if(item['description'] != null) {
      item['description'] = item['description'].length > 30 ? '${item['description'].substring(0, 30)}...' : item['description'];

      descriptionWidget = WTComponentBuilder.createText(
        text: item['description'],
        textStyle: textStyle(
          textColor: item['descriptionColor'],
          fontSize: item['descriptionSize']
        ),
      )!;
    }

    return Expanded(
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            titleWidget,
            subtitleWidget,
            headingWidget,
            descriptionWidget,
          ],
        ),
      ),
    );
  }

  /// item { actionIcon, actionDecorationIcon }
  Widget? rightWidget(Map? item) {
    if(item!['actionIcon'] == null) { return WTComponentBuilder.emptyComponent(); }

    return createIconWidget(
      size: item['actionIconSize'],
      padding: const EdgeInsets.all(0.0),
      margin: const EdgeInsets.only(left: 15.0),
      icon: item['actionIcon'],
      iconColor: item['actionIconColor'],
      backgroundColor: item['actionIconBackgroundColor'],
      borderColor: item['actionIconBorderColor'],
    );
  }

  Widget? itemsListWidget() {
    if(items!.isEmpty) { return WTComponentBuilder.emptyComponent()!; }

    Widget? titleWidget = WTComponentBuilder.emptyComponent()!;
    if(title != null) {
      titleWidget = Container(
        width: width,
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
        child: WTComponentBuilder.createText(
          text: title,
          color: titleColor,
          size: titleSize,
          textAlign: TextAlign.left,
          fontWeight: FontWeight.normal,
        ),
      );
    }

    double? itemIconSize           = width! * 0.09;
    double? itemDecorationIconSize = width! * 0.09;
    double? itemActionIconSize     = width! * 0.09;
    double? itemTitleSize          = width! * 0.045;
    double? itemSubtitleSize       = width! * 0.045;
    double? itemHeadingSize        = width! * 0.035;
    double? itemDescriptionSize    = width! * 0.035;


    List<Widget>? widgets = List<Widget>.empty(growable: true);
    for(int i = 0; i < items!.length; i++) {
      Map? item = items![i];

      item['iconSize']           = itemIconSize;
      item['decorationIconSize'] = itemDecorationIconSize;
      item['actionIconSize']     = itemActionIconSize;
      item['titleSize']          = itemTitleSize;
      item['subtitleSize']       = itemSubtitleSize;
      item['headingSize']        = itemHeadingSize;
      item['descriptionSize']    = itemDescriptionSize;

      widgets.add(
        GestureDetector(
          onTap: item['action'],
          child: Container(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            margin: const EdgeInsets.all(5.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: item['backgroundColor'] ?? Colors.transparent,
              border: Border.all(color: Colors.transparent, width: 0.0)
            ),
            // decoration: items![i] != items!.last
            //   ? BoxDecoration(
            //       color: item['backgroundColor'] ?? Colors.transparent,
            //       border: const Border(
            //         bottom: BorderSide(width: 1.0, color: Colors.grey),
            //       ),
            //     )
            //   : BoxDecoration(
            //       color: item['backgroundColor'] ?? Colors.transparent,
            //       border: Border.all(color: Colors.transparent, width: 0.0)
            //     ),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  leftWidget(item)!,   /// icon, decorationIcon
                  centerWidget(item)!, /// title, subtitle, heading, description
                  rightWidget(item)!,  /// actionIcon, actionDecorationIcon
                ],
              ),
          ),
        )
      );
    }

    return Container(
      alignment: Alignment.centerLeft,
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          titleWidget,
          ...widgets,
        ],
      ),
    );
  }

  Widget? createBody() {
    BoxDecoration? boxDecoration = BoxDecoration(color: backgroundColor);
    if(borderEnabled!) {
      boxDecoration = BoxDecoration(
        color: backgroundColor!,
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(width: 1, color: borderColor!),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadeColor!,
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      );
    }

    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width     = constraints.maxWidth;
        titleSize = width! * 0.045;

        return Container(
          key: getUniqueKey(),
          padding: padding,
          margin: margin,
          width: width,
          decoration: boxDecoration,
          alignment: Alignment.center,
          child: itemsListWidget(),
        );
      },
    );
  }

  @override
  Widget? build() {
    return action == null ? createBody() : GestureDetector(onTap: action, child: createBody());
  }

}