import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/components/decoraited_container.dart';

import '../../../../domain/entity/frend_response/friend.dart';
import 'friends_model.dart';

class Frends extends StatelessWidget {
  const Frends({super.key});
  @override
  Widget build(BuildContext context) {
    final friendList =
        context.watch<FriendsModel>().friends;
    return ListView.builder(
        itemCount: friendList.length,
        itemBuilder: (context, index) {
          return DecoraitedContainer(
              child: _FriendRow(friend: friendList[index]));
        });
  }
}

class _FriendRow extends StatelessWidget {
  final Friend friend;
  const _FriendRow({Key? key, required this.friend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: SizedBox(
          height: 40,
          child: Stack(children: [
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(friend.photo),
                  radius: 22,
                ),
                const SizedBox(width: 15),
                Text(
                  '${friend.firstName} ${friend.lastName}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(onTap: () {}),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                style: OutlinedButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.phone,
                  color: Colors.blue,
                ),
              ),
              TextButton(
                style: OutlinedButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.message,
                  color: Colors.blue,
                ),
              ),
            ]),
          ]),
        ));
  }
}
