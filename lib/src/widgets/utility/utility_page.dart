import 'package:flutter/material.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_full_page.dart';
import 'package:refuge_next/src/widgets/utility/player_search_bottomsheet.dart';
import 'package:refuge_next/src/widgets/utility/promote_bottomsheet.dart';
import 'package:refuge_next/src/widgets/utility/utility_topbar.dart';
import 'package:refuge_next/src/widgets/webview/rsi_webpage.dart';


class FeatureSelectionPage extends StatelessWidget {
  final List<FeatureItem> features = [
    FeatureItem(icon: Icons.search_rounded, title: '玩家搜索', onTap: (context) {
      showPlayerSearchSheet(context);
    }),
    FeatureItem(icon: Icons.bolt_outlined, title: '组件查询', onTap: (context) {
      showToast(message: "该功能未实现~");
    }),
    FeatureItem(icon: Icons.card_giftcard_outlined, title: '礼物兑换', onTap: (context) async {
      final selectedOptions = await ModalSheetUtil.showUseCaseSelector(context);
    }),
    FeatureItem(icon: Icons.rocket_launch_outlined, title: '舰船一览', onTap: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShipFullPage()),
      );
    }),
    FeatureItem(icon: Icons.category_outlined, title: '货运规划', onTap: (context) {
      showToast(message: "该功能未实现~");
    }),
    FeatureItem(icon: Icons.bug_report_outlined, title: '转移账号', onTap: (context) {
      showToast(message: "该功能未实现~");
    }),
  ];

  final List<TargetLinkItem> links = [
    TargetLinkItem(icon: Icons.home_outlined, title: '网页机库', route: 'https://robertsspaceindustries.com/account/pledges'),
    TargetLinkItem(icon: Icons.history, title: '网页回购', route: 'https://robertsspaceindustries.com/account/buy-back-pledges'),
    TargetLinkItem(icon: Icons.groups_3, title: '我的舰队', route: 'https://robertsspaceindustries.com/account/organization'),
    TargetLinkItem(icon: Icons.person_add, title: '邀请计划', route: 'https://robertsspaceindustries.com/referral-program'),

    TargetLinkItem(icon: Icons.forum_outlined, title: '光谱论坛', route: 'https://robertsspaceindustries.com/spectrum/community/SC'),
    TargetLinkItem(icon: Icons.quiz_outlined, title: '服务中心', route: 'https://support.robertsspaceindustries.com/'),
    TargetLinkItem(icon: Icons.account_tree_outlined, title: '路线图', route: 'https://robertsspaceindustries.com/roadmap/progress-tracker/teams/info'),
    TargetLinkItem(icon: Icons.info_outline, title: '服务状态', route: 'https://status.robertsspaceindustries.com/'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 移除默认的 AppBar
      appBar: null,
      // 使用 Column 来组合 UtilityTopBar 和可滚动内容
      body: Column(
        children: [
          // 添加 UtilityTopBar
          UtilityTopBar(),
          // 使用 Expanded 包裹可滚动内容，以填充剩余空间
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(8),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                      ),
                      itemCount: features.length,
                      itemBuilder: (context, index) {
                        return FeatureTile(feature: features[index]);
                      },
                    ),
                    ...links.map((link) => TargetLinkTile(link: link)).toList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}


class TargetLinkTile extends StatelessWidget {
  final TargetLinkItem link;
  const TargetLinkTile({Key? key, required this.link}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(link.icon, color: Theme.of(context).primaryColor),
      title: Text(
        link.title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      onTap: () {
        openRsiWebview(context: context, url: link.route);
      },
    );
  }
}


class FeatureTile extends StatelessWidget {
  final FeatureItem feature;

  const FeatureTile({Key? key, required this.feature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey[300]!, width: 1),
      ),
      child: ListTile(
        leading: Icon(feature.icon, color: Theme.of(context).primaryColor),
        title: Text(
          feature.title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        onTap: () {
          feature.onTap(context);
        },
      ),
    );
  }
}

class FeatureItem {
  final IconData icon;
  final String title;
  final Function(BuildContext) onTap;

  FeatureItem({required this.icon, required this.title, required this.onTap});
}

class TargetLinkItem {
  final IconData icon;
  final String title;
  final String route;

  TargetLinkItem({required this.icon, required this.title, required this.route});
}