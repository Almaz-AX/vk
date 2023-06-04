import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/auth/auth_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../domain/api_client/api_client.dart';
import '../../../domain/session_data_provider/session_data_provider.dart';
import '../../navigation/main_navigation.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  static final _session = SessionDataProvider();
  final _apiClient = ApiClient();
  static const url =
      // 'https://flutter.dev';
      // https://oauth.vk.com/authorize?client_id=1&display=page&redirect_uri=http://example.com/callback&scope=friends&response_type=token&v=5.131&state=123456
      'https://oauth.vk.com/authorize?client_id=51515340&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&scope=friends,groups,photos&response_type=token&v=5.131';

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
              final token =
                  url.substring(url.indexOf('=') + 1, url.indexOf('&'));
              print(token);
              await _session.saveToken(token).then(
                    (value) => Navigator.pushNamedAndRemoveUntil(
                        context,
                        MainNavigationRouteNames.main,
                        (Route<dynamic> route) => false),
                  );
            }
          }),
        ),
      )
      ..loadRequest(Uri.parse(url));
    print(controller.currentUrl());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebViewWidget(
      controller: controller,
    ));
  }
}
// class Auth extends StatelessWidget {
//   const Auth({super.key});
//   static Widget create() {
//     // return const Auth();
//     return Provider(
//       create: (context) => AuthModel(),
//       lazy: false,
//       child: const Auth(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//       create: (context) => AuthModel(),
//       builder: (context, child) => Scaffold(
//         body: WebViewWidget(controller: context.read<AuthModel>().controller),),);
  
//   }
// }
