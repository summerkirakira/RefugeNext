import 'package:flutter/material.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/repo/base/versioned_list_repo.dart';

/// 版本化仓库通用测试页。
///
/// 适用于任意 [VersionedItemsRepo] 实现(持有存储的仓库或过滤视图):
/// 拉取真实数据、按游戏版本写入本地、版本切换与读取。
/// 新仓库只需在 DebugPage 注册一个入口,传入 repo 与条目展示 builder
/// 即可。仅作开发调试用。
class VersionedRepoTestPage<E> extends StatefulWidget {
  const VersionedRepoTestPage({
    super.key,
    required this.title,
    required this.repo,
    required this.itemBuilder,
  });

  /// 页面标题,如 `Ship Matrix`。
  final String title;

  final VersionedItemsRepo<E> repo;

  /// 单条数据的展示组件(通常返回 ListTile)。
  final Widget Function(BuildContext context, E item) itemBuilder;

  @override
  State<VersionedRepoTestPage<E>> createState() =>
      _VersionedRepoTestPageState<E>();
}

class _VersionedRepoTestPageState<E> extends State<VersionedRepoTestPage<E>> {
  bool _loading = false;
  String? _selectedVersion;
  List<String> _localVersions = [];
  List<E> _items = [];
  String _log = '';

  @override
  void initState() {
    super.initState();
    _loadLocal();
  }

  void _appendLog(String message) {
    setState(() {
      _log = '[${TimeOfDay.now().format(context)}] $message\n$_log';
    });
  }

  /// 仅读本地数据,不发网络请求。
  Future<void> _loadLocal() async {
    setState(() => _loading = true);
    try {
      final versions = await widget.repo.listLocalVersions();
      final selected = await widget.repo.getSelectedVersion();
      final items = await widget.repo.getItems();
      setState(() {
        _localVersions = versions;
        _selectedVersion = selected;
        _items = items;
      });
      _appendLog('读取本地: 版本=$selected, 共 ${items.length} 条');
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _checkForUpdate() async {
    setState(() => _loading = true);
    try {
      final latest = await widget.repo.fetchLatestVersion();
      final hasUpdate = await widget.repo.checkForUpdate();
      _appendLog('最新游戏版本: ${latest ?? '获取失败'}, '
          '${hasUpdate ? '本地无该版本数据,可刷新' : '本地已有该版本数据'}');
      if (hasUpdate) {
        showToast(message: '检测到新版本 $latest,可刷新');
      }
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _refresh() async {
    setState(() => _loading = true);
    _appendLog('开始从 Wiki API 拉取 ${widget.title}...');
    try {
      final stopwatch = Stopwatch()..start();
      await widget.repo.refresh();
      stopwatch.stop();
      await _loadLocal();
      _appendLog('刷新完成,耗时 ${stopwatch.elapsedMilliseconds}ms');
      showToast(message: '刷新完成,共 ${_items.length} 条');
    } catch (e) {
      _appendLog('刷新失败: $e');
      showToast(message: '刷新失败: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _switchVersion(String version) async {
    setState(() => _loading = true);
    try {
      await widget.repo.switchVersion(version);
      await _loadLocal();
      _appendLog('已切换到版本 $version');
    } catch (e) {
      _appendLog('切换失败: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} 存储测试'),
        actions: [
          if (_loading)
            const Padding(
              padding: EdgeInsets.all(14),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          _buildControlCard(),
          _buildLogCard(),
          const Divider(height: 1),
          Expanded(child: _buildItemList()),
        ],
      ),
    );
  }

  Widget _buildControlCard() {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('当前版本: ${_selectedVersion ?? '无'}    '
                '本地数据: ${_items.length} 条'),
            const SizedBox(height: 8),
            if (_localVersions.isNotEmpty)
              Wrap(
                spacing: 8,
                children: _localVersions
                    .map((v) => ChoiceChip(
                          label: Text(v),
                          selected: v == _selectedVersion,
                          onSelected: _loading
                              ? null
                              : (selected) {
                                  if (selected) _switchVersion(v);
                                },
                        ))
                    .toList(),
              ),
            const SizedBox(height: 8),
            Row(
              children: [
                FilledButton.icon(
                  onPressed: _loading ? null : _checkForUpdate,
                  icon: const Icon(Icons.update, size: 18),
                  label: const Text('检测更新'),
                ),
                const SizedBox(width: 8),
                FilledButton.icon(
                  onPressed: _loading ? null : _refresh,
                  icon: const Icon(Icons.cloud_download, size: 18),
                  label: const Text('拉取并保存'),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: _loading ? null : _loadLocal,
                  icon: const Icon(Icons.storage, size: 18),
                  label: const Text('读本地'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogCard() {
    if (_log.isEmpty) return const SizedBox.shrink();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Text(
          _log,
          style: const TextStyle(fontSize: 11, fontFamily: 'monospace'),
        ),
      ),
    );
  }

  Widget _buildItemList() {
    if (_items.isEmpty) {
      return const Center(child: Text('本地暂无数据,点击「拉取并保存」获取'));
    }
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) =>
          widget.itemBuilder(context, _items[index]),
    );
  }
}
