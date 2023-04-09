import 'package:flutter/material.dart';

class MyPhoto {
  final AssetImage photo;
  int likes;
  List<String>? comments;
  MyPhoto({
    required this.photo,
    this.likes = 0,
    this.comments,
  });
}

class PhotosState extends StatelessWidget {
  final photoList = [MyPhoto(photo: const AssetImage('assets/avatar.webp'))];

  Widget build(BuildContext context) {
    List<Widget> photoWidget = [];
    for (final _ in photoList) {
      final a = Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 1.5),
        child: Container(
            width: 110,
            height: 110,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(image: const AssetImage('assets/avatar.webp')))),
      );
      photoWidget.add(a);
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: <Widget>[
            const Text('Фотографии'),
            const SizedBox(
              width: 10,
            ),
            Text('${photoList.length}'),
            const Expanded(
                child: SizedBox(
              height: 15,
            )),
            const Icon(Icons.chevron_right),
          ],
        ),
        SizedBox(height: 223,)
      ],
    );
  }
}
