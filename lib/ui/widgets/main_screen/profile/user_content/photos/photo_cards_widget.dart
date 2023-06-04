import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/navigation/main_navigation.dart';
import 'package:vk/ui/widgets/main_screen/profile/user_content/photos/photo_cards_model.dart';

class PhotoCards extends StatelessWidget {
  const PhotoCards({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var photoList = context.watch<PhotoCardsModel>().photos;
    if (photoList.length > 6) {
      photoList = photoList.sublist(0, 6);
    }
    final photoWidgets = <Widget>[];
    for (final photo in photoList) {
      final widget = Padding(
          padding: EdgeInsets.symmetric(vertical: width/250, horizontal: width/ 250),
          child: InkWell(
            onTap: () =>
                Navigator.pushNamed(context, MainNavigationRouteNames.photo),
            child: Container(
              width: width/ 3.3,
              height: width/ 3.3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Image.network(
                    photo.sizes[3].url,
                    fit: BoxFit.cover,
                  )),
            ),
          ));
      photoWidgets.add(widget);
    }
    return Column(
      children: [
        Wrap(
          children: photoWidgets,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Row(children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.add),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Загрузить фото'),
                    ]),
                  ),
                ],
              ),
              Column(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text('Показать все'),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.chevron_right),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      )),
                ],
              )
            ]),
      ],
    );
  }
}

class PhotoCardsTab extends StatelessWidget {
  const PhotoCardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Icon(Icons.photo, color: Colors.blue),
          SizedBox(
            width: 10,
          ),
          Text('Фото', style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}
