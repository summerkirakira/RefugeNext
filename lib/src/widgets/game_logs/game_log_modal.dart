import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/datasource/models/game_log.dart';
import 'package:refuge_next/src/widgets/game_logs/log_filters.dart';
import 'package:refuge_next/src/widgets/game_logs/log_card_factory.dart';

/// 游戏日志查看器Modal
class GameLogModal {
  static const int _pageSize = 20;
  static const double _loadMoreThreshold = 200.0;

  static void show(BuildContext context) {
    WoltModalSheet.show<void>(
      context: context,
      pageListBuilder: (modalSheetContext) {
        return [_buildMainPage(modalSheetContext)];
      },
    );
  }

  static WoltModalSheetPage _buildMainPage(BuildContext context) {
    final contentKey = GlobalKey<_GameLogContentState>();

    return WoltModalSheetPage(
      backgroundColor: Theme.of(context).colorScheme.surface,
      hasSabGradient: false,
      topBarTitle: Text(
        '游戏日志',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      isTopBarLayerAlwaysVisible: true,
      trailingNavBarWidget: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _SyncButton(contentKey: contentKey),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      child: _GameLogContent(key: contentKey),
    );
  }
}

class _GameLogContent extends StatefulWidget {
  const _GameLogContent({Key? key}) : super(key: key);

  @override
  State<_GameLogContent> createState() => _GameLogContentState();
}

class _GameLogContentState extends State<_GameLogContent> {
  final List<GameLog> _logs = [];

  LogFilter _filter = const LogFilter();
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  int _currentOffset = 0;

  @override
  void initState() {
    super.initState();
    _loadInitialLogs();
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final metrics = notification.metrics;
      if (metrics.pixels >= metrics.maxScrollExtent - GameLogModal._loadMoreThreshold) {
        if (!_isLoadingMore && _hasMore) {
          _loadMoreLogs();
        }
      }
    }
    return false;
  }

  Future<void> _loadInitialLogs() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _currentOffset = 0;
      _logs.clear();
      _hasMore = true;
    });

    try {
      final dataModel = Provider.of<MainDataModel>(context, listen: false);
      final logs = await dataModel.queryGameLogsWithPagination(
        searchKeyword: _filter.searchKeyword,
        logType: _filter.logType,
        startTime: _filter.startDate,
        endTime: _filter.endDate,
        result: _filter.result,
        limit: GameLogModal._pageSize,
        offset: 0,
      );

      setState(() {
        _logs.addAll(logs);
        _currentOffset = logs.length;
        _hasMore = logs.length >= GameLogModal._pageSize;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading logs: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loadMoreLogs() async {
    if (_isLoadingMore || !_hasMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    try {
      final dataModel = Provider.of<MainDataModel>(context, listen: false);
      final logs = await dataModel.queryGameLogsWithPagination(
        searchKeyword: _filter.searchKeyword,
        logType: _filter.logType,
        startTime: _filter.startDate,
        endTime: _filter.endDate,
        result: _filter.result,
        limit: GameLogModal._pageSize,
        offset: _currentOffset,
      );

      setState(() {
        _logs.addAll(logs);
        _currentOffset += logs.length;
        _hasMore = logs.length >= GameLogModal._pageSize;
        _isLoadingMore = false;
      });
    } catch (e) {
      print('Error loading more logs: $e');
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  void _onFilterChanged(LogFilter newFilter) {
    setState(() {
      _filter = newFilter;
    });
    _loadInitialLogs();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _onScrollNotification,
      child: Column(
        children: [
          // 搜索和过滤组件
          LogFilters(
            filter: _filter,
            onFilterChanged: _onFilterChanged,
          ),

          const Divider(height: 1),

          // 日志列表
          _buildLogList(),
        ],
      ),
    );
  }

  Widget _buildLogList() {
    if (_isLoading) {
      return Padding(
        padding: const EdgeInsets.all(40.0),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_logs.isEmpty) {
      return _buildEmptyState();
    }

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _logs.length + (_isLoadingMore ? 1 : 0) + (!_hasMore && _logs.isNotEmpty ? 1 : 0),
          itemBuilder: (context, index) {
            // 加载更多指示器
            if (index == _logs.length) {
              if (_isLoadingMore) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (!_hasMore) {
                return _buildEndOfList();
              }
            }

            // 日志卡片
            final log = _logs[index];
            return LogCardFactory.createCard(
              log,
              onTap: () => _showLogDetail(context, log),
            );
          },
        ),
        // 底部间距，确保列表可以完全滚动
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.article_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              '没有找到日志',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              '尝试调整搜索或过滤条件',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEndOfList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Center(
        child: Text(
          '已加载全部日志 (${_logs.length} 条)',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ),
    );
  }

  void _showLogDetail(BuildContext context, GameLog log) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              LogCardFactory.getTypeIcon(log.logType),
              color: LogCardFactory.getTypeColor(log.logType),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(log.subType ?? log.logType),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('时间', log.timestamp.toString()),
              if (log.playerName != null)
                _buildDetailRow('玩家', log.playerName!),
              if (log.playerId != null)
                _buildDetailRow('玩家ID', log.playerId!),
              if (log.entityName != null)
                _buildDetailRow('实体', log.entityName!),
              if (log.entityClass != null)
                _buildDetailRow('实体类型', log.entityClass!),
              if (log.location != null)
                _buildDetailRow('位置', log.location!),
              if (log.action != null)
                _buildDetailRow('操作', log.action!),
              if (log.result != null)
                _buildDetailRow('结果', log.result!),
              if (log.elapsed != null)
                _buildDetailRow('耗时', '${log.elapsed!.toStringAsFixed(2)}ms'),
              if (log.requestId != null)
                _buildDetailRow('请求ID', log.requestId.toString()),
              const Divider(height: 24),
              Text(
                '原始内容',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(
                  log.content,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontFamily: 'monospace',
                      ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Expanded(
            child: SelectableText(
              value,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}

/// 同步日志按钮
class _SyncButton extends StatefulWidget {
  final GlobalKey<_GameLogContentState> contentKey;

  const _SyncButton({required this.contentKey});

  @override
  State<_SyncButton> createState() => _SyncButtonState();
}

class _SyncButtonState extends State<_SyncButton> {
  bool _isSyncing = false;

  Future<void> _syncLogs() async {
    if (_isSyncing) return;

    setState(() {
      _isSyncing = true;
    });

    try {
      final dataModel = Provider.of<MainDataModel>(context, listen: false);
      await dataModel.syncGameLogsWithServer();

      // 同步完成后刷新日志列表
      widget.contentKey.currentState?._loadInitialLogs();
    } catch (e) {
      print('Error syncing logs: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isSyncing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isSyncing) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      );
    }

    return IconButton(
      icon: const Icon(Icons.sync),
      tooltip: '同步日志',
      onPressed: _syncLogs,
    );
  }
}
