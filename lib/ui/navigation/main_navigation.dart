import 'package:flutter/material.dart';

import '../widgets/auth/auth.dart';
import '../widgets/main_screen/main_screen.dart';

abstract class MainNavigationRouteNames {
  static const auth = 'auth';
  static const main = '/';
}

class MainNavigation {
  initialRoute(bool isAuth) =>
      isAuth ? MainNavigationRouteNames.auth : MainNavigationRouteNames.auth;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (context) => const Auth(),
    MainNavigationRouteNames.main: (context) => const MainFeedWidget(),
  };
}
