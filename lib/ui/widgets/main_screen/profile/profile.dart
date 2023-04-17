import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/components/decoraited_container.dart';

import 'package:vk/ui/widgets/main_screen/friends/friends_model.dart';
import 'package:vk/ui/widgets/main_screen/profile/profile_model.dart';
import 'package:vk/ui/widgets/main_screen/profile/about_user/about_user_widget.dart';
import 'package:vk/ui/widgets/main_screen/profile/user_content/user_content.dart';
import 'package:vk/ui/widgets/main_screen/profile/wall/wall.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      DecoraitedContainer(child: _UserInfo()),
      SizedBox(
        height: 10,
      ),
      DecoraitedContainer(child: _Friends()),
      SizedBox(
        height: 10,
      ),
      DecoraitedContainer(
        child: UserContent(),
      ),
      SizedBox(
        height: 10,
      ),
      DecoraitedContainer(child: Wall()),
      SizedBox(
        height: 10,
      ),
    ]);
  }
}

class _Friends extends StatelessWidget {
  const _Friends({
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
      child: SizedBox(
        height: 40,
        width: double.infinity,
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

class _UserInfo extends StatelessWidget {
  const _UserInfo({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userProfile = context.watch<ProfileModel>().user;
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
