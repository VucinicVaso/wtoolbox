class BmplDashboardCardChartSchema {

  BmplDashboardCardChartSchema({
    this.title,
    this.value
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'value': value,
    };
  }

  BmplDashboardCardChartSchema.fromMap(Map<dynamic, dynamic>? m) {
    title = m!['title'];
    value = m['value'];
  }

  String? title;
  void setTitle(String? v) { title = v; }

  double? value;
  void setValue(double? v) { value = v; }

}