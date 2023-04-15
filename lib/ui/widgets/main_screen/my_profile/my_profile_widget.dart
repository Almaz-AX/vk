import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/components/decoraited_container.dart';

import 'package:vk/ui/widgets/main_screen/friends/friends_model.dart';
import 'package:vk/ui/widgets/main_screen/my_profile/my_profile_model.dart';
import 'package:vk/ui/widgets/main_screen/my_profile/about_user/about_user_widget.dart';
import 'package:vk/ui/widgets/main_screen/my_profile/photos/photos_widget.dart';
import 'package:vk/ui/widgets/main_screen/my_profile/photos/photos_widget_model.dart';

class MyProfileWidget extends StatelessWidget {
  const MyProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const DecoraitedContainer(child: _UserInfo()),
      const _FriendsWidget(),
      const SizedBox(
        height: 10,),
      DecoraitedContainer(child: ChangeNotifierProvider(create: ((context) => PhotosWidgetModel()), child: const PhotoWidget(),)),
    ]);
  }
}

class _FriendsWidget extends StatelessWidget {
  const _FriendsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final friendsCount = context.watch<FriendsModel>().friends.length;

    var friendsWidget = <Widget>[];
    if (friendsCount != 0) {
      final friends = context.watch<FriendsModel>().friends.sublist(0, 3);
      friendsWidget = friends
          .map((friend) => CircleAvatar(
                backgroundImage: NetworkImage(friend.photo),
              ))
          .toList();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Center(
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('ДРУЗЬЯ'),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('$friendsCount'),
                  const Expanded(
                    child: SizedBox(height: 5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: friendsWidget,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ChoiceContent extends StatelessWidget {
  const _ChoiceContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Column(
          children: const [Icon(Icons.camera_alt_outlined), Text('История')],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: const [Icon(Icons.note_alt_outlined), Text('Запись')],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: const [Icon(Icons.photo_album_outlined), Text('Фото')],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: const [Icon(Icons.live_tv), Text('Клип')],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: const [
            Icon(Icons.not_listed_location_outlined),
            Text('Вопрос')
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: const [Icon(Icons.list_alt), Text('Мои желания')],
        ),
        const SizedBox(
          width: 20,
        )
      ]),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userProfile = context.watch<MyProfileModel>().user;
    if (userProfile == null) {
      return const SizedBox(
        child: Text('Ничего не прогрузилось'),
      );
    }
    final photoUri = userProfile.avatarPhoto;
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(photoUri),
          radius: 45,
        ),
        const SizedBox(height: 15),
        TextButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return AboutUser(
                    userProfile: userProfile,
                  );
                });
          },
          child: Column(children: [
            Text(
              '${userProfile.firstName} ${userProfile.lastName}',
              maxLines: 1,
              style: const TextStyle(fontSize: 20, color: Colors.black87),
            ),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.location_on, size: 12, color: Colors.blueGrey),
              const SizedBox(
                width: 5,
              ),
              Text(
                userProfile.homeTown,
                style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
              ),
              const SizedBox(
                width: 7,
              ),
              const Icon(Icons.school, size: 12, color: Colors.blueGrey),
              const SizedBox(
                width: 5,
              ),
              Text(
                userProfile.occupation['name'],
                style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
              )
            ]),
          ]),
        ),
        const SizedBox(height: 5),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            shadowColor: Colors.white,
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add_circle_outline,
                color: Colors.blue,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Опубликовать',
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ),
      ],
    );
  }
}
