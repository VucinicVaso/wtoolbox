import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_charts.dart';
import '../wtoolbox_dashboard_card.dart';
import '../../wtoolbox_component_builder.dart';
import '../wtoolbox_dashboard_card_chart_schema.dart';

class WTDashboardCardChartBasic extends WTDashboardCard {

  /// title, icon
  Widget? createHeader() {
    if(title == null && iconData == null) { return WTComponentBuilder.emptyComponent(); }

    titleSize = title!.length <= 24 ? width! * 0.05 : width! * 0.035;
    iconSize  = width! * 0.05;

    return Flexible(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(10, 0.0, 10.0, 0.0),
        margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /// title
            Flexible(
              child: WTComponentBuilder.createText(
                text:       title,
                size:       titleSize,
                color:      titleColor,
                fontWeight: FontWeight.bold,
                textAlign:  TextAlign.left
              )!,
            ),

            WTComponentBuilder.sizedComponent(width: 5.0)!,

            /// icon
            WTComponentBuilder.createIcon(
              iconData: iconData,
              size:     iconSize,
              color:    iconColor
            )!,
          ],
        ),
      ),
    );
  }

  /// chartCardList
  Widget? createBody() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      height: width! * 0.60,
      alignment: Alignment.center,
      child: chartCardList!.isNotEmpty
        ? SfCartesianChart(
            key: getUniqueKey(),
            primaryXAxis: const CategoryAxis(),
            primaryYAxis: NumericAxis(labelFormat: '{value} ${ chartUnit ?? "" }'),
            series: <CartesianSeries<BmplDashboardCardChartSchema, String>>[
              ColumnSeries<BmplDashboardCardChartSchema, String>(
                dataSource: List.generate(
                  chartCardList!.length,
                  (i) => chartCardList![i]
                ),
                onCreateShader: (ShaderDetails details) =>
                  ui.Gradient.linear(
                    details.rect.topCenter,
                    details.rect.bottomCenter,
                    const [Colors.blue, Colors.blue, Colors.blue],
                    [0.3, 0.6, 0.9]
                  ),
                xValueMapper: (BmplDashboardCardChartSchema data, _) => data.title,
                yValueMapper: (BmplDashboardCardChartSchema data, _) => data.value
              ),
            ],
          )
       : WTComponentBuilder.emptyComponent(),
    );
  }

  /// heading, description
  Widget? createFooter() {
    if(heading!.isEmpty && description == null) { return WTComponentBuilder.emptyComponent(); }

    headingSize     = heading!.length <= 24 ? width! * 0.045 : width! * 0.030;
    descriptionSize = description!.length <= 24 ? width! * 0.04 : width! * 0.025;

    Widget? headingWidget = heading!.isNotEmpty
      ? WTComponentBuilder.createText(
          text:       heading,
          size:       headingSize,
          color:      headingColor,
          fontWeight: FontWeight.bold,
          textAlign:  TextAlign.left
        )!
      : WTComponentBuilder.emptyComponent();

    Widget? spaceBetweenWidget = heading != null && description != null
      ? WTComponentBuilder.sizedComponent(height: 2.5)!
      : WTComponentBuilder.emptyComponent()!;

    Widget? descriptionWidget = description!.isNotEmpty
      ? WTComponentBuilder.createText(
          text:       description,
          size:       descriptionSize,
          color:      descriptionColor,
          fontWeight: FontWeight.normal,
          textAlign:  TextAlign.left
        )!
      : WTComponentBuilder.emptyComponent();

    return Flexible(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(10, 0.0, 10.0, 0.0),
        margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            headingWidget!,
            spaceBetweenWidget,
            descriptionWidget!,
          ],
        ),
      ),
    );
  }

  @override
  Widget? build() {
    return LayoutBuilder(
      builder: (context, constraints) {
        width   = constraints.maxWidth;
        height  = constraints.maxWidth;
        padding = padding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        margin  = margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);

        return Container(
          key: getUniqueKey(),
          padding: padding,
          margin: margin,
          width: width,
          height: height,
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
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
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                createHeader()!, /// title, icon
                createBody()!,   /// chartCardList
                createFooter()!, /// heading, description
              ],
            ),
          ),
        );
      }
    );
  }

}