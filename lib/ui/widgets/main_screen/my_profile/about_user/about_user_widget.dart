import 'package:flutter/material.dart';

import '../../../../../domain/entity/user.dart';

class AboutUser extends StatelessWidget {
  final User userProfile;
  const AboutUser({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Подробнее',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              const Icon(
                Icons.alternate_email,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(userProfile.domain),
            ],
          ),
        ),
        const Divider(height: 2,),
        _BreifInformation(userProfile: userProfile),
        const Divider(height: 2,),
        _Social(userProfile: userProfile),
        const Divider(height: 2,),
        const _Presents()
      ],
    );
  }
}

class _Presents extends StatelessWidget {
  const _Presents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(12),
      child: Row(children: [
        const Text('Подарки'),
        const SizedBox(width: 10,),
        const Text('30'),
        const Expanded(child: SizedBox()),
        TextButton(
          onPressed: () {},
          child: const Text('Показать все'))
      ]),
    );
  }
}

class _BreifInformation extends StatelessWidget {
  final User userProfile;
  const _BreifInformation({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              const Icon(
                Icons.card_giftcard_rounded,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'День рождения: ${userProfile.bDate}',
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const Icon(
                Icons.home_rounded,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Город: ${userProfile.city.title}',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const Icon(
                Icons.school,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                userProfile.occupation['name'],
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              const Icon(
                Icons.contactless_outlined,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${userProfile.counters['followers']} подписчиков',
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Social extends StatelessWidget {
  final User userProfile;
  const _Social({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              const Icon(Icons.person_outline),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Друзья',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Expanded(child: SizedBox()),
              Text('${userProfile.counters['friends']}'),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              const Icon(Icons.people_outline),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Подписки',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Expanded(child: SizedBox()),
              Text('${userProfile.counters['pages']}'),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              const Icon(Icons.groups_outlined),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Cooбщества',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Expanded(child: SizedBox()),
              Text('${userProfile.counters['groups']}'),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: const [
              Icon(Icons.people_outline),
              SizedBox(
                width: 10,
              ),
              Text(
                'Желания',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        ),
      ]),
    );
  }
}
