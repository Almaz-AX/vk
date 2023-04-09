// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsResponse _$FriendsResponseFromJson(Map<String, dynamic> json) =>
    FriendsResponse(
      json['count'] as int,
      FriendsResponse._parseFriendLists(json['items'] as List),
    );

Map<String, dynamic> _$FriendsResponseToJson(FriendsResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.friendList.map((e) => e.toJson()).toList(),
    };
