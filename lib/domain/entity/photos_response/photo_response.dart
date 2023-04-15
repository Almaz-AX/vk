import 'package:json_annotation/json_annotation.dart';
import 'package:vk/domain/entity/photos_response/photo.dart';


part 'photo_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoResponse {
  final int count;
  @JsonKey(name: 'items', fromJson: _parseGroupLists)
  final List<Photo> photos;

  PhotoResponse({required this.count, required this.photos});

  factory PhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$PhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoResponseToJson(this);

  static List<Photo> _parseGroupLists(List<dynamic> list) {
    final rez =
        list.map((e) => Photo.fromJson(e as Map<String, dynamic>)).toList();
    return rez;
  }
}