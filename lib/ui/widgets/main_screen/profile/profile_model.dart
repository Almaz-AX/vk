import 'package:flutter/material.dart';
import 'package:vk/domain/api_client/api_client.dart';
import 'package:vk/domain/entity/error_response.dart';

import '../../../../domain/entity/user_response/user.dart';

class ProfileModel with ChangeNotifier {
  final ApiClient _apiClient = ApiClient();
  User? _user;
  ErrorResponse? _error;

  User? get user => _user;
  ErrorResponse? get error => _error;

  Future<void> _loadUserProfile() async {
    final userResponse = await _apiClient.getUserProfile();
    _user = userResponse.response?.first;
    _error = userResponse.error;
    notifyListeners();

    // int? getUserId() {
    //   return _user?.id;
    // }
  }

  ProfileModel() {
    _loadUserProfile();
  }
}
