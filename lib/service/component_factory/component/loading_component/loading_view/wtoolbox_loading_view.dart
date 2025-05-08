import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../wtoolbox_loading_component.dart';

class WTLoadingView extends WTLoadingComponent {

  @override
  Widget? build() {
    return LoadingViewState(
      key:             getUniqueKey(),
      backgroundColor: backgroundColor,
      width:           width,
      height:          height,
      padding:         padding,
      margin:          margin,
      icon:            icon,
      iconSize:        iconSize,
      iconColor:       iconColor,
      label:           label,
      labelSize:       labelSize,
      labelColor:      labelColor,
      imageSize:       imageSize,
      assetImage:      assetImage,
      networkImage:    networkImage,
      memoryImage:     memoryImage,
    );
  }

}

// ignore: must_be_immutable
class LoadingViewState extends StatefulWidget {

  double? width, height, iconSize, labelSize, imageSize;
  IconData? icon;
  EdgeInsets? padding, margin;
  Color? backgroundColor, iconColor, labelColor;
  String? label, assetImage, networkImage;
  Uint8List? memoryImage;

  LoadingViewState({
    super.key,
    this.backgroundColor,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.label,
    this.labelSize,
    this.labelColor,
    this.imageSize,
    this.assetImage,
    this.networkImage,
    this.memoryImage,
  });

  @override
  State<LoadingViewState> createState() => LoadingViewStateless();

}

class LoadingViewStateless extends State<LoadingViewState> with TickerProviderStateMixin {

  @override
  void initState() {
    setAnimationController();
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  AnimationController? animationController;
  void setAnimationController() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
      )
      ..addListener(() {
        setState(() {});
      });
    animationController!.repeat(reverse: true);
  }

  Widget? createSpinnerWidget() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
      child: Transform.scale(
        scale: 1.3,
        child: CircularProgressIndicator(
          value: animationController!.value,
          semanticsLabel: '',
          strokeWidth: 3.0,
          color: widget.iconColor,
          backgroundColor: Colors.grey.shade300,
        ),
      ),
    );
  }

  Widget? createImageWidget() {
    if(widget.assetImage == null && widget.networkImage == null && widget.memoryImage == null) {
      return const SizedBox.shrink();
    }

    BoxDecoration? boxDecoration = const BoxDecoration();
    if(widget.assetImage == null && widget.networkImage == null && widget.memoryImage == null) {
      boxDecoration = const BoxDecoration();
    }

    if(widget.assetImage != null) {
      boxDecoration = BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage(widget.assetImage!),
          fit: BoxFit.cover
        ),
      );
    }

    if(widget.networkImage != null) {
      boxDecoration = BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        color: Colors.transparent,
        image: DecorationImage(
          image: NetworkImage(widget.networkImage!),
          fit: BoxFit.cover
        ),
      );
    }

    if(widget.memoryImage != null) {
      boxDecoration = BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        color: Colors.transparent,
        image: DecorationImage(
          image: MemoryImage(widget.memoryImage!),
          fit: BoxFit.cover
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
      width: widget.imageSize,
      height: widget.imageSize,
      alignment: Alignment.center,
      decoration: boxDecoration,
    );
  }

  Widget? createLabelWidget() {
    if(widget.label == null) { return const SizedBox.shrink(); }

    String? labelValue;
    List<TextSpan>? labelList = List<TextSpan>.empty(growable: true);
    if(widget.label!.contains(' ')) {
      List<String> labels = widget.label!.split(' ');
      labelValue = "${labels[0].toUpperCase()}\n";
      labels.removeAt(0);

      labelList.add(
        TextSpan(
          text: labelValue,
          style: TextStyle(
            fontSize: widget.labelSize!,
            color: widget.labelColor,
            fontWeight: FontWeight.bold
          ),
        )
      );

      labelList.add(
        TextSpan(
          text: labels.join(' ').toUpperCase(),
          style: TextStyle(
            fontSize: widget.labelSize! * 0.6,
            color: widget.labelColor,
          ),
        )
      );
    }
    if(!widget.label!.contains(' ')) {
      labelValue = widget.label;

      labelList.add(
        TextSpan(
          text: labelValue!.toUpperCase(),
          style: TextStyle(
            fontSize: widget.labelSize!,
            color: widget.labelColor,
          ),
        )
      );
    }

    return Container(
      padding: const EdgeInsets.all(0.0),
      margin: const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                ...labelList,
              ],
            ),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        widget.width     = constraints.maxWidth;
        widget.height    = constraints.maxHeight;
        widget.imageSize = widget.width! * 0.075;
        widget.labelSize = widget.width! * 0.05;

        return Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          margin: widget.margin,
          alignment: Alignment.center,
          color: widget.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              /// spinner (icon)
              createSpinnerWidget()!,

              /// image && label
              Container(
                width: widget.width,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    createImageWidget()!, /// image
                    createLabelWidget()!, /// label
                  ],
                ),
              ),

            ],
          ),
        );
      }
    );
  }

}