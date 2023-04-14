import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SessionDatatProviderKeys {
  static const _apiKey = 'api_key';
}

class SessionDataProvider {
  static final SessionDataProvider _sessionDataProvider =
      SessionDataProvider._internal();
  final _storage = const FlutterSecureStorage();

  factory SessionDataProvider() {
    return _sessionDataProvider;
  }
  SessionDataProvider._internal();

  Future<String?> token() async {
    return (await _storage.read(key: SessionDatatProviderKeys._apiKey));
  }

  Future<void> saveToken(String value) async {
    return (await _storage.write(
        key: SessionDatatProviderKeys._apiKey, value: value));
  }
}

