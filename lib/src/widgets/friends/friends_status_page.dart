import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/library.dart';
import 'package:refuge_next/src/widgets/friends/friends_top_bar.dart';
import 'package:refuge_next/src/widgets/friends/pages/friends_location_page.dart';
import 'package:refuge_next/src/widgets/friends/pages/friends_online_page.dart';
import 'package:refuge_next/src/widgets/friends/pages/friends_offline_page.dart';

class FriendsStatusPage extends StatefulWidget {
  const FriendsStatusPage({super.key});

  @override
  State<FriendsStatusPage> createState() => _FriendsStatusPageState();
}

class _FriendsStatusPageState extends State<FriendsStatusPage> {
  final PageController _controller = PageController();
  final CustomTabBarController _tabBarController = CustomTabBarController();
  // final List<String> _titles = ["好友位置", "在线", "离线"];
  final List<String> _titles = ["在线", "离线"];
  final List<Widget> _pages = const [
    // FriendsLocationPage(),
    FriendsOnlinePage(),
    FriendsOfflinePage(),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget getTabbarChild(BuildContext context, int index) {
    return TabBarItem(
      index: index,
      transform: ColorsTransform(
          highlightColor: Theme.of(context).primaryColor,
          normalColor: Theme.of(context).colorScheme.onSurface,
          builder: (context, color) {
            return Container(
              padding: const EdgeInsets.all(2),
              alignment: Alignment.center,
              constraints: const BoxConstraints(minWidth: 60),
              child: (Text(
                _titles[index],
                style: TextStyle(fontSize: 14, color: color),
              )),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const FriendsTopBar(),
          Center(
            child: SizedBox(
              width: 120, // Adjusted width to accommodate 3 items
              child: CustomTabBar(
                tabBarController: _tabBarController,
                height: 30,
                itemCount: _titles.length,
                builder: getTabbarChild,
                indicator: StandardIndicator(
                  color: Theme.of(context).primaryColor,
                  radius: const BorderRadius.all(Radius.circular(5)),
                  width: 40,
                ),
                pageController: _controller,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return _pages[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}