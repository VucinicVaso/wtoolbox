import 'package:wtoolbox/entity/wtoolbox_entity.dart';

class Storage extends WTEntity<Storage> {

  Storage({
    this.key,
    this.date,
    this.file
  });

  int? key; // db (Hive) key
  void setKey(int? v) { key = v; }

  String? date; // db generated date
  void setDate(String? v) { date = v; }

  Map<String, dynamic>? file = <String, dynamic>{};
  void setFile(Map<String, dynamic>? v) { file = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':  key,
      'date': date,
      'file': file,
    };
  }

  @override
  Storage? fromJson(Map? json) {
    return Storage(
      key:  json!['key'],
      date: json['date'],
      file: json['file'],
    );
  }

  @override
  Storage? empty() {
    return Storage(
      key:  0,
      date: '',
      file: {},
    );
  }


}