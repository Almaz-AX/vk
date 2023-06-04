// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vk/domain/entity/error_response.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SuccessResponse{}

class Response {
  final SuccessResponse? response;
  final ErrorResponse? error; 
  Response({
    this.response,
    this.error,
  });
 
}
