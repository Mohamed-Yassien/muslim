class ArchivedSuraModel {
  int? number;
  String? name;
  String? type;
  int? numberOfAyahs;
  int? suraIndex;
  String? content;

  ArchivedSuraModel({
    required this.number,
    required this.name,
    required this.numberOfAyahs,
    required this.suraIndex,
    required this.type,
    required this.content,
  });

  factory ArchivedSuraModel.fromJson(Map<String, dynamic> json) {
    return ArchivedSuraModel(
        number: json['number'],
        name: json['name'],
        content: json['content'],
        type: json['type'],
        numberOfAyahs: json['numberOfAyahs'],
        suraIndex: json['suraIndex']);
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'name': name,
      'content': content,
      'type': type,
      'numberOfAyahs': numberOfAyahs,
      'suraIndex': suraIndex,
    };
  }
}
