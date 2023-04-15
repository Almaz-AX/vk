import 'package:flutter/material.dart';
import 'package:vk/domain/api_client/api_client.dart';

import '../../../../domain/entity/frend_response/friend.dart';


class FriendsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _friends = <Friend>[];

  List<Friend> get friends => List.unmodifiable(_friends);

  Future<void> loadFriendList() async {
    final friends = await _apiClient.getFriends();
    _friends.addAll(friends.friendList);
    notifyListeners();
  }
}
