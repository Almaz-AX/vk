import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Photo {
  final int albumId;
  final int date;
  final int id;
  final int ownerId;
  @JsonKey(name: 'sizes', fromJson: _parseListPhotoSize)
  final List<PhotoSize> sizes;
  final String? squareCrop;
  final String text;
  final bool hasTags;

  Photo(this.albumId, this.date, this.id, this.ownerId, this.sizes,
      this.squareCrop, this.text, this.hasTags);

  static List<PhotoSize> _parseListPhotoSize(List<dynamic> list) {
    final rez =
        list.map((e) => PhotoSize.fromJson(e as Map<String, dynamic>)).toList();
    return rez;
  }

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

}

class PhotoSize {
  final int height;
  final String type;
  final int width;
  final String url;

  PhotoSize(
      {required this.height,
      required this.type,
      required this.width,
      required this.url});

  factory PhotoSize.fromJson(Map<String, dynamic> json) {
    return PhotoSize(
      height: json['height'] as int,
      type: json['type'] as String,
      width: json['width'] as int,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'height': height, 'type': type, 'width': width, 'url': url};
  }
}
