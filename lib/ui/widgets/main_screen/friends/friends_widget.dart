import 'package:flutter/material.dart';
import 'package:vk/ui/widgets/components/decoraited_container.dart';

import '../../../../domain/entity/friend.dart';
import '../../../../library/widgets/inherit/provider.dart';
import 'friends_model.dart';

class FriendsWidget extends StatelessWidget {
  const FriendsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final friendList = NotifierProvider.watch<FriendsModel>(context)?.friends;

    if (friendList == null) {
      return const SizedBox(
        height: 15,
        child: Text('Что то пошло не так'),
      );
    }
    return ListView.builder(
        itemCount: friendList.length,
        itemBuilder: (context, index) {
          return DecoraitedContainer(child: _FriendRowWidget(friend: friendList[index]));
        });
  }
}

class _FriendRowWidget extends StatelessWidget {
  final Friend friend;
  const _FriendRowWidget({Key? key, required this.friend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: SizedBox(
          height: 40,
          child: Stack(
          children: [
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
            
            Row( mainAxisAlignment: MainAxisAlignment.end, 
              children: [
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
              ]
              ),
          ]),
        ));
            
  }
}