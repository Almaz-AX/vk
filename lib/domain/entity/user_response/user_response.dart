import 'package:vk/domain/entity/error_response.dart';
import 'package:vk/domain/entity/user_response/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final List<User>? response;
  final ErrorResponse? error;

  UserResponse(this.response, this.error);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
