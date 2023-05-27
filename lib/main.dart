import 'package:flutter/material.dart';
import 'package:vk/ui/widgets/my_app/my_app_widget.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  const app = MyApp();
  runApp(app);
}
