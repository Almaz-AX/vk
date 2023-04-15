import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/main_screen/my_profile/photos/photos_widget_model.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    Key? key,
  }) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider(
      create: ((context) => PhotosWidgetModel()),
      child: const PhotoWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var photoList = context.watch<PhotosWidgetModel>().photos;
    if (photoList.length > 6) {
      photoList = photoList.sublist(0, 6);
    }
    List<Widget> photoWidget = [];
    for (final photo in photoList) {
      final a = Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(image: NetworkImage(photo.sizes[1].url)),
          ));
      photoWidget.add(a);
    }
    return Column(
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
        const SizedBox(
          height: 10,
        ),
        const _PhotoCards(),
      ],
      
    );
  }
}

class _PhotoCards extends StatelessWidget {
  const _PhotoCards({super.key});

  @override
  Widget build(BuildContext context) {
   var photoList = context.watch<PhotosWidgetModel>().photos;
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
                child: Image.network(photo.sizes[3].url, fit: BoxFit.cover, )
              ),
            )
          );
      photoWidgets.add(widget);
    }
    return Wrap(children: photoWidgets,);
  }
}