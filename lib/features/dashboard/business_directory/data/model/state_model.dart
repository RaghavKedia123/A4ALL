class Taluka {
  final String id;
  final String name;
  final int areaCode;

  Taluka({
    required this.id,
    required this.name,
    required this.areaCode,
  });

  factory Taluka.fromJson(Map<String, dynamic> json) {
    return Taluka(
      id: json['id'] as String,
      name: json['name'] as String,
      areaCode: json['area_code'] as int,
    );
  }
}

class District {
  final String id;
  final String name;
  final List<Taluka> talukas;
  final String? isMetro;

  District({
    required this.id,
    required this.name,
    required this.talukas,
    this.isMetro,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['id'] as String,
      name: json['name'] as String,
      isMetro: json['is_metro'] as String?,
      talukas: (json['talukas'] as List<dynamic>)
          .map((talukaJson) =>
              Taluka.fromJson(talukaJson as Map<String, dynamic>))
          .toList(),
    );
  }
}

class StateModel {
  final String id;
  final String name;
  final List<District> districts;

  StateModel({
    required this.id,
    required this.name,
    required this.districts,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['id'] as String,
      name: json['name'] as String,
      districts: (json['districts'] as List<dynamic>)
          .map((districtJson) =>
              District.fromJson(districtJson as Map<String, dynamic>))
          .toList(),
    );
  }

  StateModel copyWith({
    String? id,
    String? name,
    List<District>? districts,
  }) {
    return StateModel(
      id: id ?? this.id,
      name: name ?? this.name,
      districts: districts ?? this.districts,
    );
  }
}
