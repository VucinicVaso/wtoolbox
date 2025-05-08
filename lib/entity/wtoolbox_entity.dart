abstract class WTEntity<T> {

  Map<String, dynamic>? toJson();

  T? fromJson(Map<dynamic, dynamic>? json);

  T? empty();

}