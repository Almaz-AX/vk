// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:io';

import 'package:flutter_login_vk/flutter_login_vk.dart';
import 'package:vk/domain/entity/friends_response.dart';
import 'package:vk/domain/entity/user.dart';

import '../entity/gruop_response.dart';

class ApiClient {
  late VKLogin vk;
  var errorText = '';
  VKAccessToken? _token;
  static const _host = 'https://api.vk.com';
  static const _apiVersion = 'v=5.131';
  final _client = HttpClient();

  Future<void> _initSDK() async {
    // Create an instance of VKLogin
    vk = VKLogin();
    // Initialize
    await vk.initSdk();
  }

  Future<String> getToken() async {
    await _initSDK();
    _token = await vk.accessToken;
    _token ??= await signIn();
    return _token!.token;
  }

  Future<VKAccessToken> signIn() async {
    final res = await vk.logIn(scope: [
      VKScope.friends,
      VKScope.groups,
    ]);
    res.toString();
    final VKLoginResult? result = res.asValue?.value;
    if (result == null) {
      throw NullThrownError();
    }

    final VKAccessToken? _token = result.accessToken;
    if (_token == null) {
      throw NullThrownError();
    }
    return _token;
  }

  Future<User> getUserProfile() async {
    final json = await _getResponseToJson(
        uri:
            '${_host}/method/users.get?fields=bdate,photo_100,city,home_town,counters,domain,online,occupation,relatives');
    final userResponse = User.fromJson(json['response'][0]);
    return userResponse;
    //  _getResponseToJson(uri: '${_host}/method/users.get?fields=bdate,photo_100,home_town,counters,domain,online,occupation,relatives')
  }

  Future<FriendsResponse> getFriends() async {
    final json = await _getResponseToJson(
        uri: '${_host}/method/friends.get?fields=photo_100');
    final friendsResponse = FriendsResponse.fromJson(json['response']);
    return friendsResponse;
  }

  Future<GroupResponse> getGroup() async {
    final json =
        await _getResponseToJson(uri: '${_host}/method/groups.get?extended=1');
    final groupResponse = GroupResponse.fromJson(json['response']);
    return groupResponse;
  }

  Future<GroupResponse> getPhotos() async {
    final json =
        await _getResponseToJson(uri: '${_host}/method/groups.get?extended=1');
    final groupResponse = GroupResponse.fromJson(json['response']);
    return groupResponse;
  }

  Future<Map<String, dynamic>> _getResponseToJson({required String uri}) async {
    final token = await getToken();
    final tokenString = 'access_token=${token}';
    final url = Uri.parse('${uri}&${tokenString}&${_apiVersion}');
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);

    return json;
  }
}
