import 'dart:convert';
import 'package:wtoolbox/3rd_party/lib_xml.dart';
import '../wtoolbox_component.dart';

abstract class WTChart extends WTComponent {

  String? chartUnit;
  void setChartUnit(String? v) { chartUnit = v; }

  List<ChartData>? data = List<ChartData>.empty(growable: true);
  void addChartContentItem({ String? title, double? value, Map? map }) {
    if(title != null && value != null) { data!.add(ChartData(title: title, value: value)); }
    if(map != null) { map.forEach((k, v) { data!.add(ChartData(title: k, value: v)); }); }
  }
  void addChartContentItems(List<dynamic>? v) {
    for(Map? c in v!) {
      data!.add(ChartData(title: c!['title'], value: c['value']));
    }
  }

  void setStringContent(String? v) {}

  void setJsonContent(String? v) {
    Map? map = jsonDecode(v!);
    if(map != null) {
      map.forEach((k, v) {
        data!.add(ChartData(title: k, value: v));
      });
    }
  }

  void setXmlContent(String? v) {
    XmlDocument document = XmlDocument.parse(v!);
    Map? map = jsonDecode(document.toString());
    if(map != null) {
      map.forEach((k, v) {
        data!.add(ChartData(title: k, value: v));
      });
    }
  }

}

class ChartData {

  final String? title;
  final double? value;

  ChartData({ this.title, this.value });

}