import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../datasource/data_model.dart';


class MainNavigationRail extends StatefulWidget {
  @override
  _MainNavigationRailState createState() => _MainNavigationRailState();
}


class _MainNavigationRailState extends State<MainNavigationRail> with TickerProviderStateMixin {

  late List<AnimationController> _controllers;


  @override
  void initState() {
    super.initState();
    _controllers = List<AnimationController>.generate(5, (int index) {
      return AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      );
    });
  }


  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: context.watch<MainDataModel>().selectedPage,
      onDestinationSelected: (int index) {
        if (index == 0) {
          context.read<MainDataModel>().clearUnreadMessages();
        }
        context.read<MainDataModel>().updateSelectedPage(index);

        for (var i = 0; i < _controllers.length; i++) {
          if (i == index) {
            _controllers[i].forward();
          } else {
            _controllers[i].reverse();
          }
        }
      },
      labelType: NavigationRailLabelType.selected,
      groupAlignment: 0.0,
      destinations: [
        NavigationRailDestination(
          icon: badges.Badge(
            showBadge: context.watch<MainDataModel>().unreadMessageCount > 0,
            badgeContent: Text(
              context.watch<MainDataModel>().unreadMessageCount.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.red,
              padding: EdgeInsets.all(4),
            ),
            child: const Icon(Icons.people_outline_outlined),
          ),
          selectedIcon: badges.Badge(
            showBadge: context.watch<MainDataModel>().unreadMessageCount > 0,
            badgeContent: Text(
              context.watch<MainDataModel>().unreadMessageCount.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.red,
              padding: EdgeInsets.all(4),
            ),
            child: const Icon(Icons.people_rounded),
          ),
          label: const Text('好友'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.business_rounded),
          selectedIcon: Icon(Icons.business_rounded),
          label: Text('商店'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home_filled),
          label: Text('机库'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.build_circle_outlined),
          selectedIcon: Icon(Icons.build_circle_rounded),
          label: Text('工具'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.account_circle_outlined),
          selectedIcon: Icon(Icons.account_circle_rounded),
          label: Text('我的'),
        ),
      ],
    );
  }

}