import 'package:json_annotation/json_annotation.dart';

part 'friend.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Friend {
  final int id;
  final String trackCode;
  @JsonKey(name: 'photo_100')
  final String photo;
  final String firstName;
  final String lastName;
  final bool canAccessClosed;
  final bool isClosed;

  Friend(this.id, this.trackCode, this.photo, this.firstName, this.lastName,
      this.canAccessClosed, this.isClosed);

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);

  Map<String, dynamic> toJson() => _$FriendToJson(this);
  
}
