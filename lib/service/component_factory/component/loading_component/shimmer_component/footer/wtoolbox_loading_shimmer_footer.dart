import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../wtoolbox_loading_component.dart';

class WTLoadingShimmerFooter extends WTLoadingComponent {

  Widget? createFooterItem() {
    return Shimmer.fromColors(
      baseColor: shimmerPrimaryColor!,
      highlightColor: shimmerSecondaryColor!,
      child: Container(
        width: iconSize,
        height: iconSize,
        decoration: BoxDecoration(
          color: shimmerPrimaryColor!,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      key: getUniqueKey(),
      builder: (context, constraints) {
        width    = constraints.maxWidth;
        height   = width! * 0.15;
        iconSize = height! * 0.7;

        return Container(
          key: getUniqueKey(),
          width: width,
          height: height,
          padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          decoration: BoxDecoration(
            color: shimmerSecondaryColor,
            border: Border(
              top: BorderSide(
                color: shimmerPrimaryColor!,
                width: 2.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              createFooterItem()!,
              createFooterItem()!,
              createFooterItem()!,
              createFooterItem()!,
            ],
          ),
        );
      }
    );
  }

}
