import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/main_screen/friends/friends_model.dart';
import 'package:vk/ui/widgets/main_screen/friends/friends.dart';
import 'package:vk/ui/widgets/main_screen/groups/groups_model.dart';
import 'package:vk/ui/widgets/main_screen/groups/groups.dart';
import 'package:vk/ui/widgets/main_screen/profile/profile.dart';
import 'package:vk/ui/widgets/main_screen/profile/profile_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static Widget create() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FriendsModel(),
        ),
        ChangeNotifierProvider(
              create: (context) => GroupsModel(),),
        ChangeNotifierProvider(
          create: (context) => ProfileModel(),
        ),
      ],
      child: const MainScreen(),
    );
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;

  List<String> widgetOptions = ['Друзья', 'Сообщества', 'Профиль'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetOptions[_selectedTab]),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: const [Frends(), Groups(), Profile()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Друзья'),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups), label: 'Сообщества'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
