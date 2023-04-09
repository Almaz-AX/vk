// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Friend _$FriendFromJson(Map<String, dynamic> json) => Friend(
      json['id'] as int,
      json['track_code'] as String,
      json['photo_100'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
      json['can_access_closed'] as bool,
      json['is_closed'] as bool,
    );

Map<String, dynamic> _$FriendToJson(Friend instance) => <String, dynamic>{
      'id': instance.id,
      'track_code': instance.trackCode,
      'photo_100': instance.photo,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'can_access_closed': instance.canAccessClosed,
      'is_closed': instance.isClosed,
    };
