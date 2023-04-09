import 'package:flutter/material.dart';
import 'package:vk/ui/widgets/my_app/my_app_widget.dart';
import 'package:vk/ui/widgets/my_app/my_app_widget_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppWidgetModel();
  await model.checkAuth();
  final app = MyApp(model: model);
  runApp(app);
}
