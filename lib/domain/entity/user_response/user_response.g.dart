// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      (json['response'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['error'] == null
          ? null
          : ErrorResponse.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
      'error': instance.error,
    };
