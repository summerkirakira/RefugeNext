import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../datasource/data_model.dart';


class MainNavigationBar extends StatefulWidget {
  @override
  _MainNavigationBarState createState() => _MainNavigationBarState();
}


class _MainNavigationBarState extends State<MainNavigationBar> with TickerProviderStateMixin  {

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
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
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
            child: Icon(
                Provider.of<MainDataModel>(context).selectedPage == 0 ?
                Icons.people_rounded : Icons.people_outline_outlined),
          ),
          label: '好友',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business_rounded),
          label: '商店',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Provider.of<MainDataModel>(context).selectedPage == 2 ?
              Icons.home_rounded : Icons.home_outlined),
          label: '机库',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Provider.of<MainDataModel>(context).selectedPage == 3 ?
              Icons.build_circle_rounded : Icons.build_circle_outlined),
          label: '工具',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Provider.of<MainDataModel>(context).selectedPage == 4 ?
              Icons.account_circle_rounded : Icons.account_circle_outlined),
          label: '我的',
        ),
      ],
      currentIndex: context.watch<MainDataModel>().selectedPage,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.onSurface,
      onTap: (int index) {
        if (index == 0) {
          context.read<MainDataModel>().clearUnreadMessages();
        }
        context.read<MainDataModel>().updateSelectedPage(index);

        // for (var i = 0; i < _controllers.length; i++) {
        //   if (i == index) {
        //     _controllers[i].forward();
        //   } else {
        //     _controllers[i].reverse();
        //   }
        // }


      },
    );
  }

}