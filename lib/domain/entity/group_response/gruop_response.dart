import 'package:json_annotation/json_annotation.dart';
import 'package:vk/domain/entity/group_response/group.dart';

part 'gruop_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GroupResponse {
  final int count;
  @JsonKey(name: 'items', fromJson: _parseGroupLists)
  final List<Group> groups;

  GroupResponse({required this.count, required this.groups});

  factory GroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GroupResponseToJson(this);

  static List<Group> _parseGroupLists(List<dynamic> lists) {
    final rez =
        lists.map((e) => Group.fromJson(e as Map<String, dynamic>)).toList();
    return rez;
  }
}
