import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:vk/domain/api_client/api_client.dart';
import 'package:vk/domain/session_data_provider/session_data_provider.dart';
import 'package:vk/ui/navigation/main_navigation.dart';

import '../../../domain/entity/user_response/user_response.dart';

class LoadScreenModel {
  final BuildContext context;
  final _apiClient = ApiClient();
  final _session = SessionDataProvider();
  late final UserResponse _userResponse;

  LoadScreenModel(this.context) {
    _initialScreen(context);
    // WidgetsBinding.instance.addPersistentFrameCallback(
    //   (timeStamp) => _initialScreen(context),
    // );
  }

  Future<void> _initialScreen(context) async {
    final token = await _session.token();
    _goToAuthScreen(context);
    //   final token = await _session.token();
    //   if (token == null) {
    //     _goToAuthScreen(context);
    //     return;
    //   }

    //   _userResponse = await _apiClient.getUserProfile();
    //   if (_userResponse.error != null) {
    //     _goToAuthScreen(context);
    //     return;
    //   }
    //   _goToMainScreen(context);
  }

  void _goToAuthScreen(context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        MainNavigationRouteNames.auth, (route) => false);
    // Navigator.popAndPushNamed(context, MainNavigationRouteNames.auth);
    // Navigator.pushNamedAndRemoveUntil(
    //     context, MainNavigationRouteNames.auth, (route) => false);
    FlutterNativeSplash.remove();
  }

  void _goToMainScreen(context) {
    Navigator.pushNamedAndRemoveUntil(
        context, MainNavigationRouteNames.main, (route) => false);
  }
}
