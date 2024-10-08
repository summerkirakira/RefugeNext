import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    _controllers = List<AnimationController>.generate(4, (int index) {
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
          icon: Icon(
              Provider.of<MainDataModel>(context).selectedPage == 0 ?
          Icons.home_rounded : Icons.home_outlined),
          label: '机库',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business_rounded),
          label: '商店',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Provider.of<MainDataModel>(context).selectedPage == 2 ?
              Icons.build_circle_rounded : Icons.build_circle_outlined),
          label: '工具',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Provider.of<MainDataModel>(context).selectedPage == 3 ?
              Icons.account_circle_rounded : Icons.account_circle_outlined),
          label: '我的',
        ),
      ],
      currentIndex: context.watch<MainDataModel>().selectedPage,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.onSurface,
      onTap: (int index) {
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