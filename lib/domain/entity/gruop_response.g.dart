// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gruop_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupResponse _$GroupResponseFromJson(Map<String, dynamic> json) =>
    GroupResponse(
      count: json['count'] as int,
      groups: GroupResponse._parseGroupLists(json['items'] as List),
    );

Map<String, dynamic> _$GroupResponseToJson(GroupResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'items': instance.groups.map((e) => e.toJson()).toList(),
    };
