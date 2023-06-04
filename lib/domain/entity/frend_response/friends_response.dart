// ignore_for_file: unnecessary_cast

import 'package:json_annotation/json_annotation.dart';
import 'package:vk/domain/entity/frend_response/friend.dart';
import 'package:vk/domain/entity/response.dart';


part 'friends_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FriendsResponse {
  final int count;
  @JsonKey(name: 'items', fromJson: _parseFriendLists)
  final List<Friend> friendList;

  FriendsResponse(this.count, this.friendList);

  factory FriendsResponse.fromJson(Map<String, dynamic> json) =>
      _$FriendsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FriendsResponseToJson(this);

  static List<Friend> _parseFriendLists(List<dynamic> lists) {
    final rez =
        lists.map((e) => Friend.fromJson(e as Map<String, dynamic>)).toList();
    return rez;
  }
}
