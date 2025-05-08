import 'package:wtoolbox/entity/wtoolbox_entity.dart';

class Language extends WTEntity<Language> {

  Language({
    this.key,
    this.label,
    this.language,
    this.image,
    this.selected,
  });

  int? key; // db generated key
  void setKey(int? v) { key = v; }

  String? label; // language label ( en_US )
  void setLabel(String? v) { label = v; }

  String? language; // language title ( English )
  void setLanguage(String? v) { language = v; }

  String? image; // 
  void setImage(String? v) { image = v; }

  bool? selected; // is language selected ( true || false )
  void setSelected(bool? v) { selected = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':      key,
      'label':    label,
      'language': language,
      'image':    image,
      'selected': selected
    };
  }

  @override
  Language? fromJson(Map? json) {
    return Language(
      key:      json!['key'],
      label:    json['label'],
      language: json['language'],
      image:    json['image'],
      selected: json['selected'],
    );
  }

  @override
  Language? empty() {
    return Language(
      key:      0,
      label:    '',
      language: '',
      image:    '',
      selected: false,
    );
  }

}