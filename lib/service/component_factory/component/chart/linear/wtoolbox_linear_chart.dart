import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_charts.dart';
import '../wtoolbox_chart.dart';

class WTLinearChart extends WTChart {

  @override
  Widget? build() {
    return SfCartesianChart(
      key: getUniqueKey(),
      primaryXAxis: const CategoryAxis(),
      primaryYAxis: NumericAxis(labelFormat: '{value} $chartUnit'),
      series: <CartesianSeries<ChartData, String>>[
        LineSeries<ChartData, String>(
          dataSource: List.generate(
            data!.length,
            (i) => data![i]
          ),
          onCreateShader: (ShaderDetails details) {
            return ui.Gradient.linear(
              details.rect.topCenter,
              details.rect.bottomCenter,
              const [Colors.blue, Colors.blue, Colors.blue],
              [0.3, 0.6, 0.9]
            );
          },
          xValueMapper: (ChartData data, _) => data.title,
          yValueMapper: (ChartData data, _) => data.value,
        )
      ]
    );
  }

}