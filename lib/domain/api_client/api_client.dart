// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:io';


import 'package:vk/domain/entity/photos_response/photo_response.dart';
import 'package:vk/domain/entity/user_response/user_response.dart';

import 'package:vk/domain/session_data_provider/session_data_provider.dart';

import '../entity/frend_response/friends_response.dart';
import '../entity/group_response/gruop_response.dart';
import '../entity/user_response/user.dart';

class ApiClient {
  final _session = SessionDataProvider();
  var errorText = '';
  static const _host = 'https://api.vk.com';
  static const _apiVersion = 'v=5.131';
  final _client = HttpClient();

  Future<String> getToken() async {
    final token = await _session.token();
    if (token == null) {
      throw Exception();
    }
    return token;
  }

  bool tokenIsValid() {
    return false;
  }

  Future<UserResponse> getUserProfile() async {
    final json = await _getResponseToJson(
        uri:
            '${_host}/method/users.get?fields=bdate,photo_100,city,home_town,counters,domain,online,occupation,relatives');
    final userResponse = UserResponse.fromJson(json);
    return userResponse;
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

    Future<PhotoResponse> getPhotos([String ownerId = '']) async {
      final json = await _getResponseToJson(
          uri: '${_host}/method/photos.getAll?owner_id = ${ownerId}');
      final photoResponse = PhotoResponse.fromJson(json['response']);
      return photoResponse;
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
