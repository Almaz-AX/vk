// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vk/ui/widgets/main_screen/profile/user_content/photos/photo_cards_widget.dart';

import 'music/music_widget.dart';

class UserContent extends StatefulWidget {
  UserContent({
    Key? key,
  }) : super(key: key) {
      tabBarViewChildren = [
    const PhotoCards(),
    const Music()
];
  }

  @override
  State<UserContent> createState() => _UserContentState();
}

List<Widget> tabBarViewChildren = [];
final tabs = [const PhotoCardsTab(), const MusicTab()];


class _UserContentState extends State<UserContent>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 366,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(controller: _tabController, tabs: tabs),
          Expanded(
            child: TabBarView(
                controller: _tabController, children: tabBarViewChildren),
          ),
        ],
      ),
    );
  }
}
