import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../wtoolbox_loading_component.dart';

class WTLoadingShimmerActionsCard extends WTLoadingComponent {

  Widget? createTitleWidget() {
    return Container(
      width: width! * 0.4,
      height: width! * 0.08,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      decoration: BoxDecoration(
        color: shimmerPrimaryColor!,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        border: Border.all(
          width: 1,
          color: shimmerSecondaryColor!,
        ),
      ),
    );
  }

  Widget? createIconWidget() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /// icon
          Container(
            width: iconSize,
            height: iconSize,
            margin: const EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              color: shimmerPrimaryColor!,
              shape: BoxShape.circle,
            ),
          ),

          /// title
          Container(
            width: iconSize,
            height: iconSize! * 0.25,
            decoration: BoxDecoration(
              color: shimmerPrimaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(
                width: 1,
                color: shimmerSecondaryColor!,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      builder: (context, constraints) {
        width    = constraints.maxWidth;
        height   = width! * 0.45;
        iconSize = width! * 0.125;

        return Container(
          key: getUniqueKey(),
          width: width,
          height: height,
          padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          margin: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: shimmerSecondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            border: Border.all(
              width: 1,
              color: shimmerPrimaryColor!,
            ),
            boxShadow: [
              BoxShadow(
                color: shimmerPrimaryColor!,
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Shimmer.fromColors(
            baseColor: shimmerPrimaryColor!,
            highlightColor: shimmerSecondaryColor!,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                /// title
                createTitleWidget()!,

                /// icons
                Container(
                  width: width,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      createIconWidget()!,
                      createIconWidget()!,
                      createIconWidget()!,
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      }
    );
  }

}