import 'package:vk/ui/widgets/main_screen/profile/user_content/photos/photo_full_widget.dart';

import '../widgets/auth/auth.dart';
import '../widgets/main_screen/main_screen.dart';

abstract class MainNavigationRouteNames {
  static const auth = 'auth';
  static const main = '/';
  static const photo = 'photo/';
}

class MainNavigation {
  final routes = {
    MainNavigationRouteNames.auth: (context) => const Auth(),
    MainNavigationRouteNames.main: (context) => MainScreen.create(),
    MainNavigationRouteNames.photo: (context) => const PhotoFull(),
  };
}
