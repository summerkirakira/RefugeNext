import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';
import '../../funcs/toast.dart';
import '../../repo/game_version_manager.dart';
import '../../repo/wiki_data_sync.dart';
import '../common/status_avatar.dart';
import 'database_search_page.dart';

/// 数据库页顶栏:已登录显示头像 + 「数据库」标题;右上角数据同步按钮 + 搜索按钮。
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
            const Text('终端', style: TextStyle(fontSize: 24)),
            const Spacer(),
            const _WikiSyncButton(),
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

/// 数据同步按钮:检测到有数据集「缺失/有更新」时显示角标,
/// 点击直接下载缺失/有更新的数据,完成后 toast 提示。
class _WikiSyncButton extends StatefulWidget {
  const _WikiSyncButton();

  @override
  State<_WikiSyncButton> createState() => _WikiSyncButtonState();
}

class _WikiSyncButtonState extends State<_WikiSyncButton> {
  int _pending = 0;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _inspect();
  }

  Future<void> _inspect() async {
    final list =
        await WikiDataSync().inspect(version: GameVersionManager().version);
    if (!mounted) return;
    setState(() => _pending = list.where((s) => s.needsDownload).length);
  }

  Future<void> _sync() async {
    if (_busy) return;
    if (_pending == 0) {
      showToast(message: '数据已是最新');
      return;
    }
    setState(() => _busy = true);
    showToast(message: '开始下载数据…');
    final result =
        await WikiDataSync().syncMissing(version: GameVersionManager().version);
    if (!mounted) return;
    setState(() => _busy = false);
    if (result.failed.isEmpty) {
      showToast(message: '数据更新完成，共 ${result.succeeded.length} 项');
    } else {
      showToast(
          message: '更新完成，成功 ${result.succeeded.length} 项，'
              '失败 ${result.failed.length} 项');
    }
    await _inspect();
  }

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      showBadge: _pending > 0 && !_busy,
      badgeContent: Text('$_pending',
          style: const TextStyle(color: Colors.white, fontSize: 10)),
      child: IconButton(
        icon: _busy
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2))
            : const Icon(Icons.cloud_sync),
        tooltip: '下载数据',
        onPressed: _busy ? null : _sync,
      ),
    );
  }
}
