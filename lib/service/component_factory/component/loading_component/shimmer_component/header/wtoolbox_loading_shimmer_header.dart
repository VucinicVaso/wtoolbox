import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../wtoolbox_loading_component.dart';

class WTLoadingShimmerHeader extends WTLoadingComponent {

  Widget? createIconWidget() {
    return Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
        color: shimmerPrimaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget? createTitleWidget(double? w, double? h) {
    return Container(
      width: w,
      height: h,
      alignment: Alignment.center,
      color: shimmerPrimaryColor,
    );
  }

  @override
  Widget? build() {
    return AppBar(
      key: getUniqueKey(),
      elevation: 2.0,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      shadowColor: shimmerPrimaryColor,
      backgroundColor: shimmerSecondaryColor,
      title: Shimmer.fromColors(
        baseColor: shimmerPrimaryColor!,
        highlightColor: shimmerSecondaryColor!,
        child: LayoutBuilder(
          key: getUniqueKey(),
          builder: (context, constraints) {
            width               = constraints.maxWidth;
            height              = width! * 0.125;
            iconSize            = height! * 0.7;
            double? titleWidth  = width! * 0.55;
            double? titleHeight = width! * 0.07;

            return Container(
              width: width,
              height: height,
              color: Colors.transparent,
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  createIconWidget()!,
                  createTitleWidget(titleWidth, titleHeight)!,
                  createIconWidget()!,
                ],
              ),
            );
          }
        ),
      ),
    );
  }

}
