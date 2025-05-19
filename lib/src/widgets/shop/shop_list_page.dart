import 'package:flutter_custom_tab_bar/library.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datasource/data_model.dart';


class ShopListPage extends StatefulWidget {
  @override
  _ShopListPageState createState() => _ShopListPageState();

  final List<Widget> children;
  final List<String> titles;

  ShopListPage({Key? key, required this.children, required this.titles}) : super(key: key);

}


class _ShopListPageState extends State<ShopListPage> {

  final PageController _controller = PageController();
  final CustomTabBarController _tabBarController = CustomTabBarController();

  @override
  void initState() {
    super.initState();
    
    // 添加页面切换监听
    _tabBarController.addListener(() {
      switch (_tabBarController.currentIndex) {
        case 0: // 舰船
          context.read<MainDataModel>().updateActivePageIndex(100);
          break;
        case 1: // 涂装
          context.read<MainDataModel>().updateActivePageIndex(101);
          break;
        case 2: // 装备
          context.read<MainDataModel>().updateActivePageIndex(102);
          break;
        case 3: // 订阅
          context.read<MainDataModel>().updateActivePageIndex(103);
          break;
        case 4: // 游戏包
          context.read<MainDataModel>().updateActivePageIndex(104);
          break;
        case 5: // 附加
          context.read<MainDataModel>().updateActivePageIndex(105);
          break;
        case 6: // 组合包
          context.read<MainDataModel>().updateActivePageIndex(106);
          break;
        case 7: // UEC
          context.read<MainDataModel>().updateActivePageIndex(107);
          break;
        case 8: // 礼品卡
          context.read<MainDataModel>().updateActivePageIndex(108);
          break;
        case 9: // 组合包
          context.read<MainDataModel>().updateActivePageIndex(109);
          break;
        default:
          break;
      }
    });
  }

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
              // width: 280,
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