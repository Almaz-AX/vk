import 'package:flutter/cupertino.dart';
import 'package:vk/domain/api_client/api_client.dart';
import '../../../../../../domain/entity/photos_response/photo.dart';

class PhotoCardsWidgetModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _photos = <Photo>[];

  List<Photo> get photos => _photos;

  Future<void> _loadPhotos() async {
    final photoResponse = await _apiClient.getPhotos();
    _photos.addAll(photoResponse.photos);
    notifyListeners();
  }

  PhotoCardsWidgetModel() {
    _loadPhotos();
  }
}
