import 'package:flutter/material.dart';
import 'package:vk/domain/api_client/api_client.dart';
import 'package:vk/domain/entity/user.dart';

class ProfileModel with ChangeNotifier {

  final ApiClient _apiClient = ApiClient();
  User? _user;

  User? get user => _user;

  

  Future<void> _loadUserProfile() async {
    _user = await _apiClient.getUserProfile();
    notifyListeners();

    // int? getUserId() {
    //   return _user?.id;
    // }
  }

  ProfileModel() {
    _loadUserProfile();
  }
}
