import 'package:wtoolbox/entity/wtoolbox_entity.dart';

class Queue extends WTEntity<Queue> {

  Queue({
    this.key,
    this.id,
    this.date,
    this.read,
    this.application,
    this.headers,
    this.body,
  });

  int? key; // db (Hive) key
  void setKey(int? v) { key = v; }

  int? id; // db generated id
  void setId(int? v) { id = v; }

  String? date; // db generated date
  void setDate(String? v) { date = v; }

  bool? read; // is queue read ( true || false )
  void setRead(bool? v) { read = v; }

  String? application; // application name
  void setApplication(String? v) { application = v; }

  Map<String, String>? headers; // message headers
  void setHeaders(Map<String, String>? v) { headers = v; }

  String? body; // (JSON encoded) message body
  void setBody(String? v) { body = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':         key,
      'id':          id,
      'date':        date,
      'read':        read,
      'application': application,
      'headers':     headers,
      'body':        body,
    };
  }

  @override
  Queue? fromJson(Map? json) {
    return Queue(
      key:         json!['key'],
      id:          json['id'],
      date:        json['date'],
      read:        json['read'],
      application: json['application'],
      headers:     { ...json['headers'] },
      body:        json['body'],
    );
  }

  @override
  Queue? empty() {
    return Queue(
      key:         0,
      id:          -1,
      date:        '',
      read:        true,
      application: '',
      headers:     {},
      body:        '',
    );
  }

}
