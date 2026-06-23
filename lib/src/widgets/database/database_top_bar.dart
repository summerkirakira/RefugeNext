import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';
import '../common/status_avatar.dart';
import 'database_search_page.dart';

/// 数据库页顶栏:已登录显示头像 + 「数据库」标题;右上角搜索按钮(跨类别全局搜索)。
class DatabaseTopBar extends StatelessWidget {
  const DatabaseTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MainDataModel>(context).currentUser;
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 0),
        height: 60,
        child: Row(
          children: [
            if (user != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: StatusAvatar(avatarUrl: user.profileImage, size: 40),
              ),
            const Text('数据库', style: TextStyle(fontSize: 24)),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: '搜索',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const DatabaseSearchPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
