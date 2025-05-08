import 'package:flutter/material.dart';

mixin WTCardBuilder {

  Widget? createIconHolder({
    bool? showBoxDecoration = true,
    EdgeInsets? containerPadding = const EdgeInsets.all(0.0),
    EdgeInsets? containerMargin = const EdgeInsets.all(0.0),
    IconData? iconData,
    double? iconSize,
    Color? iconColor,
    Color? iconBackgroundColor,
    Color? iconBorderColor
  }) {
    BoxDecoration? boxDecoration = const BoxDecoration(color: Colors.transparent);
    if(showBoxDecoration!) {
      boxDecoration = BoxDecoration(
        shape: BoxShape.circle, //borderRadius: BorderRadius.circular(50.0),
        color: iconBackgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: iconBorderColor!,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      );
    }

    return Container(
      padding: containerPadding,
      margin: containerMargin,
      alignment: Alignment.center,
      decoration: boxDecoration,
      child: Icon(
        iconData,
        size: iconSize,
        color: iconColor,
      ),
    );
  }

  Widget? createStackedIconHolder({
    double? containerSize = 0.0,
    EdgeInsets? containerPadding = const EdgeInsets.all(0.0),
    EdgeInsets? containerMargin = const EdgeInsets.all(0.0),
    bool? showIconBoxDecoration = true,
    IconData? iconData,
    double? iconSize,
    Color? iconColor,
    Color? iconBackgroundColor,
    Color? iconBorderColor,
    EdgeInsets? iconPadding = const EdgeInsets.all(0.0),
    EdgeInsets? iconMargin = const EdgeInsets.all(0.0),
    IconData? decorationIcon,
    double? decorationIconSize,
    Color? decorationIconColor,
    Color? decorationIconBackgroundColor,
    Color? decorationIconBorderColor,
    EdgeInsets? decorationIconPadding = const EdgeInsets.all(0.0),
    EdgeInsets? decorationIconMargin = const EdgeInsets.all(0.0),
  }) {
    BoxDecoration? iconBoxDecoration = const BoxDecoration(color: Colors.transparent);
    if(showIconBoxDecoration!) {
      iconBoxDecoration = BoxDecoration(
        //borderRadius: BorderRadius.circular(50.0),
        shape: BoxShape.circle,
        color: iconBackgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: iconBorderColor!,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      );
    }

    return Container(
      padding: containerPadding,
      margin: containerMargin,
      width: containerSize,
      height: containerSize,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          /// icon
          Container(
            alignment: Alignment.center,
            padding: iconPadding,
            margin: iconMargin,
            decoration: iconBoxDecoration,
            child: Icon(
              iconData,
              size: iconSize,
              color: iconColor
            ),
          ),

          /// decorationIcon
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              padding: decorationIconPadding,
              margin: decorationIconMargin,
              decoration: BoxDecoration(
                color: decorationIconBackgroundColor,
                borderRadius: BorderRadius.circular(50.0),
                //shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: decorationIconBorderColor!,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Icon(
                decorationIcon,
                size: decorationIconSize,
                color: decorationIconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget? createIconWidget({
    bool? showBoxDecoration = true,
    double? containerSize,
    EdgeInsets? containerPadding,
    EdgeInsets? containerMargin,
    IconData? iconData,
    double? iconSize,
    Color? iconColor,
    Color? iconBackgroundColor,
    Color? iconBorderColor
  }) {
    return Container(
      width: containerSize,
      height: containerSize,
      padding: containerPadding ?? const EdgeInsets.all(0.0),
      margin: containerMargin ?? const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      decoration: showBoxDecoration!
        ? BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: iconBackgroundColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: iconBorderColor!,
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          )
        : const BoxDecoration(color: Colors.transparent),
      child: Icon(
        iconData,
        size: iconSize,
        color: iconColor,
      ),
    );
  }

  Widget? createStackedIconWidget({
    EdgeInsets? margin,
    bool? showIconBoxDecoration = true,
    double? iconContainerSize,
    IconData? iconData,
    double? iconSize,
    Color? iconColor,
    Color? iconBackgroundColor,
    Color? iconBorderColor,
    double? decorationIconContainerSize,
    IconData? decorationIcon,
    double? decorationIconSize,
    Color? decorationIconColor,
    Color? decorationIconBackgroundColor,
    Color? decorationIconBorderColor,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.all(0.0),
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          /// icon
          Container(
            alignment: Alignment.center,
            width: iconContainerSize,
            height: iconContainerSize,
            padding: const EdgeInsets.all(5.0),
            decoration: showIconBoxDecoration!
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: iconBackgroundColor,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: iconBorderColor!,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                )
              : const BoxDecoration(color: Colors.transparent),
            child: Icon(iconData, size: iconSize, color: iconColor),
          ),

          /// decorationIcon
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: decorationIconContainerSize,
              height: decorationIconContainerSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: decorationIconBackgroundColor,
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: decorationIconBorderColor!,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Icon(decorationIcon, size: decorationIconSize, color: decorationIconColor),
            ),
          ),
        ],
      ),
    );
  }

}