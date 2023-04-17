import 'package:flutter/material.dart';
import 'package:vk/library/widgets/inherit/provider.dart';
import 'package:vk/ui/widgets/components/decoraited_container.dart';
import 'package:vk/ui/widgets/main_screen/groups/groups_model.dart';
import '../../../../domain/entity/group_response/group.dart';

class Groups extends StatelessWidget {
  const Groups({super.key});

  @override
  Widget build(BuildContext context) {
    final groupList = NotifierProvider.watch<GroupsModel>(context)?.groups;
    if (groupList == null) {
      return const SizedBox(
        height: 15,
        child: Text('Что-то пошло не так'),
      );
    }
    return ListView.builder(
        itemCount: groupList.length,
        itemBuilder: (context, index) {
          return DecoraitedContainer(
              child: _GroupsRow(group: groupList[index]));
        });
  }
}

class _GroupsRow extends StatelessWidget {
  final Group group;
  const _GroupsRow({Key? key, required this.group}) : super(key: key);

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
                  backgroundImage: NetworkImage(group.photo),
                  radius: 22,
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: Text(
                    group.name,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(onTap: () {}),
            ),
          ]),
        ));
  }
}
