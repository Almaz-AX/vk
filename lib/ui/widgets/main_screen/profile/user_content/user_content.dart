import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk/ui/widgets/main_screen/profile/user_content/photos/photo_cards_widget.dart';
import 'package:vk/ui/widgets/main_screen/profile/user_content/photos/photo_cards_widget_model.dart';

import 'music/music_widget.dart';



class UserContent extends StatefulWidget {
  const UserContent({
    Key? key,
  }) : super(key: key);

  @override
  State<UserContent> createState() => _UserContentState();
}

class _UserContentState extends State<UserContent>
    with TickerProviderStateMixin {

  late TabController _tabController;

  final tabBarViewChildren = <Widget>[
              ChangeNotifierProvider(
                create: ((context) => PhotoCardsWidgetModel()),
                child: const PhotoCards(),
              ),
              const Music()
            ];
  
  final tabs = [const PhotoCardsTab(),
                const MusicTab(),
            ];

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
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            controller: _tabController,
            tabs: tabs
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: tabBarViewChildren),
          ),
        ],
      ),
    );
  }
}

