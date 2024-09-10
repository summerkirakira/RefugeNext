import 'package:flutter_custom_tab_bar/library.dart';
import 'package:flutter/material.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_page.dart';


class HangarBuybackPage extends StatefulWidget {
  @override
  _HangarBuybackPageState createState() => _HangarBuybackPageState();

  final List<Widget> children;
  final List<String> titles;

  HangarBuybackPage({Key? key, required this.children, required this.titles}) : super(key: key);

}


class _HangarBuybackPageState extends State<HangarBuybackPage> {

  final PageController _controller = PageController();
  final CustomTabBarController _tabBarController = CustomTabBarController();

  @override
  void initState() {
    super.initState();
  }


  Widget getTabbarChild(BuildContext context, int index) {
    return TabBarItem(
      index: index,
      transform: ColorsTransform(
          highlightColor: Theme.of(context).primaryColor,
          normalColor: Theme.of(context).colorScheme.onSurface,
          builder: (context, color) {
            return Container(
              padding: EdgeInsets.all(2),
              alignment: Alignment.center,
              constraints: BoxConstraints(minWidth: 60),
              child: (Text(
                widget.titles[index],
                style: TextStyle(fontSize: 14, color: color),
              )),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Expanded(child: Column(
        children: [
          Center(
            child: Container(
              width: 120,
              child: CustomTabBar(
                tabBarController: _tabBarController,
                height: 30,
                itemCount: widget.titles.length,
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
          SizedBox(height: 5),
          Expanded(
              child: PageView.builder(
                  controller: _controller,
                  itemCount: widget.titles.length,
                  itemBuilder: (context, index) {
                    return widget.children[index];
                  }))
        ]
    ));
  }
}