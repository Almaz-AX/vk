import 'package:vk/domain/api_client/api_client.dart';

class MyAppWidgetModel {
  final auth = ApiClient();
  bool _isAuth = false;

  get isAuth => _isAuth;

  Future<void> checkAuth() async {
    final token = await auth.getToken();
    _isAuth = token != null ? true : false;
  }
}
