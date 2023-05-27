import 'package:flutter/material.dart';
import 'package:vk/ui/navigation/main_navigation.dart';


class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VK',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.main,
    );
  }
}
