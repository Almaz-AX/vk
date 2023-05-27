// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import 'package:vk/domain/api_client/api_client.dart';

import '../../../../../../domain/entity/photos_response/photo.dart';

class PhotoCardsModel extends ChangeNotifier {
  String ownerId;
  final _apiClient = ApiClient();
  final _photos = <Photo>[];

  PhotoCardsModel({
    required this.ownerId,
  }) {
    _loadPhotos(ownerId);
  }

  List<Photo> get photos => _photos;

  Future<void> _loadPhotos(String ownerId) async {
    final photoResponse = await _apiClient.getPhotos(ownerId);
    _photos.addAll(photoResponse.photos);
    notifyListeners();
  }
}
