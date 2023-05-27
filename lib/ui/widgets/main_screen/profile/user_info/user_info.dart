import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/entity/user.dart';
import '../profile_model.dart';
import 'about_user_widget.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userProfile = context.select<ProfileModel, User?>((profileModel) => profileModel.user);
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
