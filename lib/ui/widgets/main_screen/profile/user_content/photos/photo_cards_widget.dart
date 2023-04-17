import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/main_screen/profile/user_content/photos/photo_cards_widget_model.dart';

class PhotoCards extends StatelessWidget {
  const PhotoCards({super.key});

  @override
  Widget build(BuildContext context) {
    var photoList = context.watch<PhotoCardsWidgetModel>().photos;
    if (photoList.length > 6) {
      photoList = photoList.sublist(0, 6);
    }
    final photoWidgets = <Widget>[];
    for (final photo in photoList) {
      final widget = Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 1.5),
          child: Container(
            width: 126,
            height: 126,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Image.network(
                  photo.sizes[3].url,
                  fit: BoxFit.cover,
                )),
          ));
      photoWidgets.add(widget);
    }
    return Column(
      children: [
        Wrap(children: photoWidgets,),
        const SizedBox(height: 10,),
        Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Column(
            children: [
              TextButton( onPressed: (){},
              child: Row(children: const [
                SizedBox(height: 10,),
                Icon(Icons.add),
                SizedBox(width: 15,),
                Text('Загрузить фото'),
                ]
                ),),
            ],
          ),
            Column(
              children: [
                TextButton(onPressed: (){}, 
                child: Row(mainAxisSize: MainAxisSize.max,children: const [
                Text('Показать все'),
                SizedBox(width: 10,),
                Icon(Icons.chevron_right),
                SizedBox(width: 10,)
                ],)
                ),
              ],
            )]),
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
