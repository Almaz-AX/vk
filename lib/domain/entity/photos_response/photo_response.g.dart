// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoResponse _$PhotoResponseFromJson(Map<String, dynamic> json) =>
    PhotoResponse(
      count: json['count'] as int,
      photos: PhotoResponse._parseGroupLists(json['items'] as List),
    );

Map<String, dynamic> _$PhotoResponseToJson(PhotoResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.photos.map((e) => e.toJson()).toList(),
    };
