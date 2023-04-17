import 'package:flutter/material.dart';
import 'package:vk/domain/api_client/api_client.dart';
import 'package:vk/domain/entity/user.dart';

class ProfileModel extends ChangeNotifier {
  final ApiClient apiClient = ApiClient();
  User? _user;

  User? get user => _user;

  Future<void> loadUserProfile() async {
    _user = await apiClient.getUserProfile();
    notifyListeners();

    int? getUserId() {
      return _user?.id;
    }
  }
}
