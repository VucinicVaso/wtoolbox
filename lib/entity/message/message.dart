import 'package:wtoolbox/clean_architecture/entity/wtoolbox_entity.dart';

class Message extends WTEntity<Message> {

  Message({
    super.key,
    super.date,
    this.id,
    this.read,
    this.headers,
    this.body,
  });

  String? id; // db generated id
  void setId(String? v) { id = v; }

  bool? read; // is message read ( true || false )
  void setRead(bool? v) { read = v; }

  Map<String, String>? headers; // message headers
  void setHeaders(Map<String, String>? v) { headers = v; }

  String? body; // (JSON encoded) message body
  void setBody(String? v) { body = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':     key,
      'id':      id,
      'date':    date,
      'read':    read,
      'headers': headers,
      'body':    body,
    };
  }

  @override
  Message? fromJson(Map? json) {
    return Message(
      key:     json!['key'],
      id:      json['id'],
      date:    json['date'],
      read:    json['read'],
      headers: { ...json['headers'] },
      body:    json['body'],
    );
  }

  @override
  Message? empty() {
    return Message(
      key:     0,
      id:      '',
      date:    '',
      read:    true,
      headers: {},
      body:    '',
    );
  }

}