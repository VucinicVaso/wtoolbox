import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_svg.dart';
import 'package:wtoolbox/3rd_party/lib_webview.dart';
import '../../wtoolbox_component_builder.dart';
import '../wtoolbox_card.dart';
import '../wtoolbox_card_builder.dart';

class WTCardWelcome extends WTCard {
  
  @override
  Widget? build() {
    return WelcomeCardWidget(
      key:                 getUniqueKey(),
      width:               width,
      padding:             padding,
      margin:              margin,
      backgroundColor:     backgroundColor,
      borderColor:         borderColor,
      shadeColor:          shadeColor,
      action:              action,
      htmlContent:         htmlContent,
      icon:                icon,
      iconSize:            iconSize,
      iconColor:           iconColor,
      iconBackgroundColor: iconBackgroundColor,
      iconBorderColor:     iconBorderColor,
      assetImage:          assetImage,
      networkImage:        networkImage,
      memoryImage:         memoryImage,
      svgFile:             svgFile,
      svgMemory:           svgMemory,
      svgString:           svgString,
      svgNetwork:          svgNetwork,
      svgAsset:            svgAsset,
      title:               title,
      titleSize:           titleSize,
      titleColor:          titleColor,
      subtitle:            subtitle,
      subtitleSize:        subtitleSize,
      subtitleColor:       subtitleColor,
      textStyle:           textStyle,
    );
  }

}

// ignore: must_be_immutable
class WelcomeCardWidget extends StatefulWidget {

  EdgeInsets? padding, margin;
  double? width, iconSize, titleSize, subtitleSize;
  Color? backgroundColor, borderColor, shadeColor, iconColor, iconBackgroundColor, iconBorderColor,
      titleColor, subtitleColor;
  VoidCallback? action;
  String? htmlContent, assetImage, networkImage, svgString, svgNetwork, svgAsset, title, subtitle;
  IconData? icon;
  Uint8List? memoryImage, svgMemory;
  File? svgFile;
  Function? textStyle;

  WelcomeCardWidget({
    super.key,
    this.width,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.shadeColor,
    this.action,
    this.htmlContent,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.iconBackgroundColor,
    this.iconBorderColor,
    this.assetImage,
    this.networkImage,
    this.memoryImage,
    this.svgFile,
    this.svgMemory,
    this.svgString,
    this.svgNetwork,
    this.svgAsset,
    this.title,
    this.titleSize,
    this.titleColor,
    this.subtitle,
    this.subtitleSize,
    this.subtitleColor,
    this.textStyle,
  });

  @override
  State<WelcomeCardWidget> createState() => _WelcomeCardWidgetState();

}

class _WelcomeCardWidgetState extends State<WelcomeCardWidget> with WTCardBuilder {

  @override
  void initState() {
    setWebController();
    super.initState();
  }

  @override
  void dispose() {
    if(webViewController != null) {
      webViewController!.clearCache();
    }

    super.dispose();
  }

  WebViewController? webViewController;
  void setWebController() {
    if(widget.htmlContent != null) {
      setState(() {
        webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {},
              onPageStarted: (String url) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                //return NavigationDecision.navigate;
                return NavigationDecision.prevent;
              },
              onPageFinished: (url) {},
              onUrlChange: (change) {},
            ),
          )
          ..loadHtmlString(widget.htmlContent!);
      });
    }
  }

  Widget? htmlWidget() {
    double? height = widget.width! * 0.3;

    return Container(
      padding: const EdgeInsets.all(0.0),
      margin: const EdgeInsets.all(0.0),
      height: height,
      child: WebViewWidget(
        controller: webViewController!
      ),
    );
  }

  Widget? createImageWidget({ double? size, EdgeInsets? padding = const EdgeInsets.all(0.0), EdgeInsets? margin = const EdgeInsets.all(0.0) }) {
    BoxDecoration? imageDecoration;

    if(widget.assetImage != null) {
      imageDecoration = BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage(widget.assetImage!),
          fit: BoxFit.cover
        ),
      );
    }

    if(widget.networkImage != null) {
      imageDecoration = BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        color: Colors.transparent,
        image: DecorationImage(
          image: NetworkImage(widget.networkImage!),
          fit: BoxFit.cover
        ),
      );
    }

    if(widget.memoryImage != null) {
      imageDecoration = BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        color: Colors.transparent,
        image: DecorationImage(
          image: MemoryImage(widget.memoryImage!),
          fit: BoxFit.cover
        ),
      );
    }

    return Container(
      padding: padding,
      margin: margin,
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: imageDecoration,
    );
  }

  Widget? createSvgWidget({ double? size, EdgeInsets? padding = const EdgeInsets.all(0.0), EdgeInsets? margin = const EdgeInsets.all(0.0) }) {
    Widget? svgWidget = WTComponentBuilder.emptyComponent();

    if(widget.svgFile != null) {
      svgWidget = SvgPicture.file(
        widget.svgFile!,
        fit: BoxFit.fill,
        width: size,
        height: size,
      );
    }

    if(widget.svgMemory != null) {
      svgWidget = SvgPicture.memory(
        widget.svgMemory!,
        fit: BoxFit.fill,
        width: size,
        height: size,
      );
    }

    if(widget.svgString != null) {
      svgWidget = SvgPicture.string(
        widget.svgString!,
        fit: BoxFit.fill,
        width: size,
        height: size,
      );
    }

    if(widget.svgNetwork != null) {
      svgWidget = SvgPicture.network(
        widget.svgNetwork!,
        fit: BoxFit.fill,
        width: size,
        height: size,
      );
    }

    if(widget.svgAsset != null) {
      svgWidget = SvgPicture.asset(
        widget.svgAsset!,
        fit: BoxFit.fill,
        width: size,
        height: size,
      );
    }

    return Container(
      padding: padding,
      margin: margin ?? const EdgeInsets.all(0.0),
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: Colors.transparent,
      ),
      child: svgWidget,
    );

  }

  /// icon || image(assetImage, networkImage, memoryImage) || svg(svgFile, svgMemory, svgString, svgNetwork, svgAsset)...
  Widget? iconWidget() {
    if(widget.icon != null) {
      return createIconHolder(
        containerPadding: const EdgeInsets.all(5.0),
        containerMargin: const EdgeInsets.fromLTRB(2.5, 5.0, 5.0, 5.0),
        iconData: widget.icon,
        iconSize: widget.iconSize!,
        iconColor: widget.iconColor,
        iconBackgroundColor: widget.iconBackgroundColor,
        iconBorderColor: widget.iconBorderColor,
      );
    }

    if(widget.assetImage != null || widget.networkImage != null || widget.memoryImage != null) {
      return createImageWidget(
        size: widget.iconSize!,
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.fromLTRB(2.5, 5.0, 5.0, 5.0),
      );
    }

    if(widget.svgFile != null || widget.svgMemory != null || widget.svgString != null || widget.svgNetwork != null || widget.svgAsset != null) {
      return createSvgWidget(
        size: widget.iconSize!,
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.fromLTRB(2.5, 5.0, 5.0, 5.0),
      )!;
    }

    return WTComponentBuilder.emptyComponent();
  }

  /// title, subtitle,
  Widget? labelsWidget() {
    if(widget.title == null && widget.subtitle == null) { return WTComponentBuilder.emptyComponent()!; }

    Widget? titleWidget = WTComponentBuilder.emptyComponent()!;
    if(widget.title != null) {
      titleWidget = WTComponentBuilder.createText(
        text: widget.title,
        textAlign: TextAlign.start,
        textStyle: widget.textStyle!(
          textColor: widget.titleColor,
          fontSize: widget.titleSize,
          fontWeight: FontWeight.bold
        ),
      )!;
    }

    Widget? subtitleWidget = WTComponentBuilder.emptyComponent()!;
    if(widget.subtitle != null) {
      subtitleWidget = WTComponentBuilder.createText(
        text: widget.subtitle,
        textAlign: TextAlign.start,
        textStyle: widget.textStyle!(
          textColor: widget.subtitleColor,
          fontSize: widget.subtitleSize,
          fontWeight: FontWeight.normal
        )!,
      )!;
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleWidget,                 /// title
          const SizedBox(height: 2.5), ///
          subtitleWidget,              /// subtitle
        ],
      ),
    );
  }

  Widget? createBody() {
    if(widget.htmlContent != null) { return htmlWidget(); }

    return Container(
      padding: widget.padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          iconWidget()!,
          labelsWidget()!,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: widget.key,
      builder: (context, constraints) {
        widget.width        = constraints.maxWidth * 0.9;
        widget.padding      = widget.padding ?? const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0);
        widget.margin       = widget.margin ?? const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0);
        widget.iconSize     = widget.width! * 0.15;
        widget.titleSize    = widget.width! * 0.045;
        widget.subtitleSize = widget.width! * 0.040;

        return Container(
          key: widget.key,
          width: widget.width!,
          padding: widget.padding,
          margin: widget.margin,
          decoration: BoxDecoration(
            color: widget.backgroundColor!,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            border: Border.all(
              width: 1,
              color: widget.borderColor!
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: widget.shadeColor!,
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.centerLeft,
          child: createBody()!,
        );
      }
    );
  }

}