// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      json['album_id'] as int,
      json['date'] as int,
      json['id'] as int,
      json['owner_id'] as int,
      Photo._parseListPhotoSize(json['sizes'] as List),
      json['square_crop'] as String?,
      json['text'] as String,
      json['has_tags'] as bool,
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'album_id': instance.albumId,
      'date': instance.date,
      'id': instance.id,
      'owner_id': instance.ownerId,
      'sizes': instance.sizes,
      'square_crop': instance.squareCrop,
      'text': instance.text,
      'has_tags': instance.hasTags,
    };
