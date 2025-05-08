import 'package:wtoolbox/entity/wtoolbox_entity.dart';

class WTTheme extends WTEntity<WTTheme> {

  WTTheme({
    this.key,
    this.title,
    this.theme,
    this.selected,
    this.date
  });

  int? key; // db (Hive) key
  void setKey(int? v) { key = v; }

  String? title;
  void setTitle(String? v) { title = v; }

  Map<dynamic, dynamic>? theme = <dynamic, dynamic>{}; // map containing WTTheme colors
  void setTheme(Map<dynamic, dynamic>? v) { theme = v; }

  bool? selected; // is WTTheme selected
  void setSelected(bool? v) { selected = v; }

  String? date; // date WTTheme was created
  void setDate(String? v) { date = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':      key,
      'title':    title,
      'selected': selected,
      'date':     date,
      'theme':    theme,
    };
  }

  @override
  WTTheme? fromJson(Map? json) {
    return WTTheme(
      key:      json!['key'],
      title:    json['title'],
      selected: json['selected'],
      date:     json['date'],
      theme:    json['theme'],
    );
  }

  @override
  WTTheme? empty() {
    return WTTheme(
      key:      0,
      title:    '',
      selected: false,
      date:     '',
      theme:    {},
    );
  }

}