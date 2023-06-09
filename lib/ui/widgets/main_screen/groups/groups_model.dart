import 'package:flutter/material.dart';
import 'package:vk/domain/api_client/api_client.dart';

import '../../../../domain/entity/group_response/group.dart';

class GroupsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _groups = <Group>[];

  List<Group> get groups => List.unmodifiable(_groups);

  Future<void> _loadGroups() async {
    final groupResponse = await _apiClient.getGroup();
    _groups.addAll(groupResponse.groups);
    notifyListeners();
  }

  GroupsModel() {
    _loadGroups();
  }
}
