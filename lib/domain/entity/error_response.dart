// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ErrorResponse {
  final int errorCode;
  final String errorMsg;
  final List<Params> requestParams;
  ErrorResponse({
    required this.errorCode,
    required this.errorMsg,
    required this.requestParams,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'errorCode': errorCode,
      'errorMsg': errorMsg,
      'requestParams': requestParams,
    };
  }

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class Params {
  final String key;
  final String value;
  Params({
    required this.key,
    required this.value,
  });

  Map<String, dynamic> toJson() => _$ParamsToJson(this);

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}
