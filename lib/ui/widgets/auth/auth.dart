import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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

  final controller = WebViewController();
  @override
  void initState() {
    super.initState();
    controller
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: ((
            url,
          ) async {
            print(url);
            if (url.contains('access_token')) {
              await session
                  .saveToken(
                      url.substring(url.indexOf('=') + 1, url.indexOf('&')))
                  .then((value) => Navigator.pushNamedAndRemoveUntil(
                      context,
                      MainNavigationRouteNames.main,
                      (Route<dynamic> route) => false));
            }
          }),
        ),
      )
      ..loadRequest(Uri.parse(url));
    FlutterNativeSplash.remove();
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
