// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vk/ui/widgets/components/decoraited_container.dart';
import 'package:vk/ui/widgets/main_screen/friends/friends_model.dart';
import 'package:vk/ui/widgets/main_screen/profile/profile_model.dart';
import 'package:vk/ui/widgets/main_screen/profile/user_content/photos/photo_cards_model.dart';
import 'package:vk/ui/widgets/main_screen/profile/user_content/user_content.dart';
import 'package:vk/ui/widgets/main_screen/profile/user_info/user_info.dart';
import 'package:vk/ui/widgets/main_screen/profile/wall/wall.dart';

import '../../../../domain/entity/frend_response/friend.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final friends = context.read<FriendsModel>().friends;
    return ListView(children: [
      const DecoraitedContainer(
        child: UserInfo(),
      ),
      const SizedBox(
        height: 10,
      ),
      DecoraitedContainer(
        child: _Friends(friends: friends ),
        ),
      const SizedBox(
        height: 10,
      ),
      DecoraitedContainer(
        child: ChangeNotifierProvider(
          create: (context) => PhotoCardsModel(
            ownerId: context.read<ProfileModel>().user?.id.toString()?? ''),
          child: UserContent()),
      ),
      const SizedBox(
        height: 10,
      ),
      const DecoraitedContainer(child: Wall()),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}

class _Friends extends StatelessWidget {
  final List<Friend> friends;
  const _Friends({
    Key? key,
    required this.friends,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var friends = context.watch<FriendsModel>().friends;
    final friendsCount = friends.length;
    var friendsWidget = <Widget>[];

    if (friends.isNotEmpty) {
      if (friends.length > 3) {
        friends = friends.sublist(0, 3);
      }
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
