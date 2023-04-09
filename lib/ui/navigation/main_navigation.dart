import 'package:flutter/material.dart';

import '../widgets/auth/auth_widget.dart';
import '../widgets/main_screen/main_screen.dart';

abstract class MainNavigationRouteNames {
  static const auth = 'auth';
  static const main = 'auth';
}

class MainNavigation {
  initialRoute(bool isAuth) =>
      isAuth ? MainNavigationRouteNames.main : MainNavigationRouteNames.auth;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (context) => const AuthWidget(),
    MainNavigationRouteNames.main: (context) => const MainFeedWidget(),
  };
}
