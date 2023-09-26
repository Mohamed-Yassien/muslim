class ArchivedSuraModel {
    int? number;
  String? name;
  String? type;
  int? numberOfAyahs;
  int? suraIndex;
  

  ArchivedSuraModel({
    required this.number,
    required this.name,
    required this.numberOfAyahs,
    required this.suraIndex,
    required this.type,
  });

  factory ArchivedSuraModel.fromJson(Map<String, dynamic> json) {
    return ArchivedSuraModel(
        number: json['number'],
        name: json['name'],
        type: json['type'],
        numberOfAyahs: json['numberOfAyahs'],
        suraIndex: json['suraIndex']);
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'name': name,
      'type': type,
      'numberOfAyahs': numberOfAyahs,
      'suraIndex': suraIndex,
    };
  }
}
