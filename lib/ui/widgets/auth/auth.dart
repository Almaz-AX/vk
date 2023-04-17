import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../domain/session_data_provider/session_data_provider.dart';
import '../../navigation/main_navigation.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  static const url =
      'https://oauth.vk.com/authorize?client_id=51515340&display=mobile&scope=friends,groups,photos&response_type=token&v=5.131';

  static final session = SessionDataProvider();

  late final controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: ((
            url,
          ) async {
            if (url.contains('access_token')) {
              await session
                  .saveToken(
                      url.substring(url.indexOf('=') + 1, url.indexOf('&')))
                  .then((value) => Navigator.pushNamed(
                      context, MainNavigationRouteNames.main));
            }
          }),
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Авторизация'),
        ),
        body: WebViewWidget(controller: controller));
  }
}
