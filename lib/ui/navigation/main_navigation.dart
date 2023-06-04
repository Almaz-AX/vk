import 'package:vk/ui/widgets/load_screen/load_screen.dart';
import 'package:vk/ui/widgets/main_screen/profile/user_content/photos/photo_full_widget.dart';

import '../widgets/auth/auth.dart';
import '../widgets/main_screen/main_screen.dart';

abstract class MainNavigationRouteNames {
  static const loader = '/';
  static const auth = '/auth';
  static const main = '/main';
  static const photo = '/main/photo/';
}

class MainNavigation {
  final routes = {
    MainNavigationRouteNames.loader: (context) => LoadScreen.create(),
    MainNavigationRouteNames.auth: (context) => Auth(),
    MainNavigationRouteNames.main: (context) => MainScreen.create(),
    MainNavigationRouteNames.photo: (context) => const PhotoFull(),
  };
}
