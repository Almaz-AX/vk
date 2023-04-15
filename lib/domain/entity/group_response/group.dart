import 'package:json_annotation/json_annotation.dart';
part 'group.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Group {
  final int id;
  final String name;
  final String screenName;
  final int isClosed;
  final String type;
  @JsonKey(name: 'photo_100')
  final String photo;

  Group(
      {required this.id,
      required this.name,
      required this.screenName,
      required this.isClosed,
      required this.type,
      required this.photo});

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}

