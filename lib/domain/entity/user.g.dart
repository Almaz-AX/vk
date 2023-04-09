// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      User._parseCity(json['city'] as Map<String, dynamic>),
      id: json['id'] as int,
      domain: json['domain'] as String,
      bDate: json['bdate'] as String,
      occupation: json['occupation'] as Map<String, dynamic>,
      homeTown: json['home_town'] as String,
      relatives: json['relatives'] as List<dynamic>,
      counters: Map<String, int>.from(json['counters'] as Map),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      online: json['online'] as int,
      photo: json['photo_100'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'domain': instance.domain,
      'bdate': instance.bDate,
      'occupation': instance.occupation,
      'city': instance.city,
      'home_town': instance.homeTown,
      'relatives': instance.relatives,
      'counters': instance.counters,
      'photo_100': instance.photo,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'online': instance.online,
    };
