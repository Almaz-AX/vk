import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:vk/domain/api_client/api_client.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../domain/session_data_provider/session_data_provider.dart';

class AuthModel {
  static final _session = SessionDataProvider();
  final _apiClient = ApiClient();

  static const url =
      'https://flutter.dev';
      // 'https://oauth.vk.com/authorize?client_id=51515340&display=mobile&scope=friends,groups,photos&response_type=token&v=5.131';

  final controller = WebViewController()..loadRequest(Uri.parse(url));

  Future<void> saveToken(String redirectUrl) async {
    final token = redirectUrl.substring(
        redirectUrl.indexOf('=') + 1, redirectUrl.indexOf('&'));
    await _session.saveToken(token);
  }

  void getAuthPage() async {
    // controller.loadRequest(Uri.parse(url));
    // controller.currentUrl();
    // notifyListeners();
  }

  AuthModel() {
    // getAuthPage();
    FlutterNativeSplash.remove();
  }
}
