import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../wtoolbox_loading_component.dart';

class WTLoadingShimmerCard extends WTLoadingComponent {

  @override
  Widget? build() {
    return LayoutBuilder(
      builder: (context, constraints) {
        width  = constraints.maxWidth;
        height = width! * 0.6;

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

                Container(
                  width: width! * 0.50,
                  height: 20.0,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: shimmerPrimaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(
                      width: 1,
                      color: shimmerSecondaryColor!,
                    ),
                  ),
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                ),

                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                  child: Column(
                    children: <Widget>[

                      Container(
                        height: 20.0,
                        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                        decoration: BoxDecoration(
                          color: shimmerPrimaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                          border: Border.all(
                            width: 1,
                            color: shimmerSecondaryColor!,
                          ),
                        ),
                      ),

                      Container(
                        height: 20.0,
                        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                        decoration: BoxDecoration(
                          color: shimmerPrimaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                          border: Border.all(
                            width: 1,
                            color: shimmerSecondaryColor!,
                          ),
                        ),
                      ),

                      Container(
                        height: 20.0,
                        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
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
                ),

                Container(
                  height: 40.0,
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: Container(
                    width: width! * 0.5,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: shimmerPrimaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(
                        width: 1,
                        color: shimmerSecondaryColor!,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }

}