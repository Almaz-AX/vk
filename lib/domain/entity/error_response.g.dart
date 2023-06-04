// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      errorCode: json['error_code'] as int,
      errorMsg: json['error_msg'] as String,
      requestParams: (json['request_params'] as List<dynamic>)
          .map((e) => Params.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'error_msg': instance.errorMsg,
      'request_params': instance.requestParams.map((e) => e.toJson()).toList(),
    };

Params _$ParamsFromJson(Map<String, dynamic> json) => Params(
      key: json['key'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$ParamsToJson(Params instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };
