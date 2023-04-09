import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/library/widgets/inherit/provider.dart';
import 'package:vk/ui/widgets/main_screen/friends/friends_model.dart';
import 'package:vk/ui/widgets/main_screen/friends/friends_widget.dart';
import 'package:vk/ui/widgets/main_screen/groups/groups_model.dart';
import 'package:vk/ui/widgets/main_screen/groups/groups_widget.dart';
import 'package:vk/ui/widgets/main_screen/my_profile/my_profile_model.dart';
import 'package:vk/ui/widgets/main_screen/my_profile/my_profile_widget.dart';

class MainFeedWidget extends StatefulWidget {
  const MainFeedWidget({super.key});

  @override
  State<MainFeedWidget> createState() => _MainFeedWidgetState();
}

class _MainFeedWidgetState extends State<MainFeedWidget> {
  int _selectedTab = 0;
  final myProfileModel = MyProfileModel();
  final friendsModel = FriendsModel();
  final groupsModel = GroupsModel();
  List<String> widgetOptions = ['Друзья', 'Сообщества', 'Профиль'];

  void _onItemTapped(int index)  {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void initState() {
    super.initState();
    myProfileModel.loadUserProfile();
    friendsModel.loadFriendList();
    groupsModel.loadGroups();
    
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(widgetOptions[_selectedTab]),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          NotifierProvider(model: friendsModel, child: const FriendsWidget()),
          NotifierProvider(model:groupsModel, child: const GroupsWidget()),
          MultiProvider(
              providers: [ChangeNotifierProvider.value(value: myProfileModel,),
                          ChangeNotifierProvider.value(value: friendsModel,),
                          ],
              child: const MyProfileWidget())
        ],
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
