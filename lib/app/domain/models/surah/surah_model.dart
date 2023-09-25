class SurahModel {
  List<SurahData>? surahData;

  SurahModel({this.surahData});

  SurahModel.fromJson(Map<String, dynamic> json) {
    if (json['surahs'] != null) {
      surahData = <SurahData>[];
      json['surahs'].forEach((v) {
        surahData!.add(SurahData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (surahData != null) {
      data['surahs'] = surahData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SurahData {
  int? number;
  String? name;
  int? numberOfAyahs;
  String? type;

  SurahData({this.number, this.name, this.numberOfAyahs, this.type});

  SurahData.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    numberOfAyahs = json['numberOfAyahs'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    data['numberOfAyahs'] = numberOfAyahs;
    data['type'] = type;
    return data;
  }
}
