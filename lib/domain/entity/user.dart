import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final int id;
  final String domain;
  @JsonKey(name: 'bdate')
  final String bDate;
  final Map<String, dynamic> occupation;
  @JsonKey(name: 'city', fromJson: _parseCity)
  final City city;
  final String homeTown;
  final List relatives;
  final Map<String, int> counters;
  @JsonKey(name: 'photo_100')
  final String photo;

  final String firstName;
  final String lastName;
  final int online;

  User(
    this.city, {
    required this.id,
    required this.domain,
    required this.bDate,
    required this.occupation,
    required this.homeTown,
    required this.relatives,
    required this.counters,
    required this.firstName,
    required this.lastName,
    required this.online,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static _parseCity(Map<String, dynamic> cityMap) => City.fromJson(cityMap);
}

class City {
  final int id;
  final String title;

  City({
    required this.id,
    required this.title,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
