import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    _controllers = List<AnimationController>.generate(3, (int index) {
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
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home_filled),
          label: Text('机库'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.business_rounded),
          selectedIcon: Icon(Icons.business_rounded),
          label: Text('商店'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.account_circle_outlined),
          selectedIcon: Icon(Icons.account_circle_rounded),
          label: Text('我的'),
        ),
      ],
    );
  }

}