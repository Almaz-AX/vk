import 'package:flutter/material.dart';
import 'package:vk/ui/navigation/main_navigation.dart';
import 'package:vk/ui/widgets/my_app/my_app_widget_model.dart';

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  final MyAppWidgetModel model;
  const MyApp({super.key, required this.model,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VK',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(model.isAuth),
    );
  }
}
