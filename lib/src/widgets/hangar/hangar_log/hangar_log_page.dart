import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../datasource/data_model.dart';
import '../../../datasource/models/hangar.dart';
import '../../../repo/translation.dart';
import 'hangar_log_entry.dart';

/// 直接参与弹窗的 Sliver 滚动，避免嵌套列表一次构建所有日志。
class HangarLogPage extends StatefulWidget {
  const HangarLogPage({super.key, this.targetItemIds, this.item});

  final Set<int>? targetItemIds;
  final HangarItem? item;

  @override
  State<HangarLogPage> createState() => _HangarLogPageState();
}

class _HangarLogPageState extends State<HangarLogPage> {
  int _limit = 50;
  final _expandedIds = <String>{};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<MainDataModel>().refreshHangarLogs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainDataModel>();
    final logs = model.getHangarLogsByTargetIds(widget.targetItemIds);
    final count = logs.length < _limit ? logs.length : _limit;
    final colors = Theme.of(context).colorScheme;
    final item = widget.item;
    final itemName = item == null
        ? null
        : model.enableHangarTranslation
            ? item.chineseName ?? item.name
            : item.name;
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (itemName != null) ...[
                      Text(itemName,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                    ],
                    Text(
                      '${widget.targetItemIds != null && widget.targetItemIds!.length > 1 ? '${widget.targetItemIds!.length} 件物品 · ' : ''}共 ${logs.length} 条记录',
                      style: TextStyle(
                          color: colors.onSurfaceVariant, fontSize: 12),
                    ),
                    if (model.hangarLogError != null && logs.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: _RefreshError(message: model.hangarLogError!),
                      ),
                  ],
                ),
              );
            }
            if (index == count + 1) {
              if (logs.isEmpty) {
                return _EmptyLogs(
                  loading: model.isRefreshingHangarLogs,
                  error: model.hangarLogError,
                );
              }
              if (count < logs.length) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Center(
                    child: TextButton.icon(
                      onPressed: () => setState(() => _limit += 50),
                      icon: const Icon(Icons.expand_more_rounded),
                      label: Text('加载更多（剩余 ${logs.length - count} 条）'),
                    ),
                  ),
                );
              }
              return const SizedBox(height: 8);
            }
            final logIndex = index - 1;
            final log = logs[logIndex];
            final date = DateTime.fromMillisecondsSinceEpoch(log.time);
            final startOfDay = logIndex == 0 ||
                !DateUtils.isSameDay(
                    date,
                    DateTime.fromMillisecondsSinceEpoch(
                        logs[logIndex - 1].time));
            final endOfDay = logIndex == count - 1 ||
                !DateUtils.isSameDay(
                    date,
                    DateTime.fromMillisecondsSinceEpoch(
                        logs[logIndex + 1].time));
            final entry = HangarLogEntry(log,
                translate: model.enableHangarTranslation
                    ? TranslationRepo().getTranslationSync
                    : (value) => value);
            return Column(
              key: ValueKey(log.id),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (startOfDay)
                  Padding(
                    padding: EdgeInsets.only(
                        top: logIndex == 0 ? 0 : 12, bottom: 14),
                    child: Text(DateFormat('yyyy年M月d日').format(date),
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: colors.onSurfaceVariant)),
                  ),
                _TimelineEntry(
                  entry: entry,
                  showName: item == null,
                  showId: (widget.targetItemIds?.length ?? 0) > 1,
                  showLine: !endOfDay,
                  expanded: _expandedIds.contains(log.id),
                  onToggle: () => setState(() {
                    if (!_expandedIds.add(log.id)) _expandedIds.remove(log.id);
                  }),
                ),
              ],
            );
          },
          childCount: count + 2,
        ),
      ),
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  const _TimelineEntry({
    required this.entry,
    required this.showName,
    required this.showId,
    required this.showLine,
    required this.expanded,
    required this.onToggle,
  });

  final HangarLogEntry entry;
  final bool showName;
  final bool showId;
  final bool showLine;
  final bool expanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final log = entry.log;
    final time = DateFormat('HH:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(log.time));
    final accent = log.type == 'RECLAIMED' ? colors.tertiary : colors.primary;
    return Stack(
      children: [
        if (showLine)
          Positioned(
            left: 15,
            top: 36,
            bottom: 0,
            child: Container(width: 1, color: colors.outlineVariant),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  color: accent.withValues(alpha: .10),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(entry.icon, size: 18, color: accent),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Semantics(
                      button: true,
                      expanded: expanded,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: onToggle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(entry.title,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Text(time,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: colors.onSurfaceVariant)),
                                  const SizedBox(width: 4),
                                  Icon(
                                      expanded
                                          ? Icons.expand_less_rounded
                                          : Icons.expand_more_rounded,
                                      size: 18,
                                      color: colors.onSurfaceVariant),
                                ],
                              ),
                              if (showName) ...[
                                const SizedBox(height: 6),
                                Text(entry.name,
                                    style: const TextStyle(fontSize: 14)),
                              ],
                              if (entry.summary != null) ...[
                                const SizedBox(height: 6),
                                Text(entry.summary!,
                                    style: TextStyle(
                                        height: 1.5,
                                        fontSize: 13,
                                        color: colors.onSurfaceVariant)),
                              ],
                              if (entry.amount != null || showId) ...[
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 6,
                                  children: [
                                    if (entry.amount != null)
                                      Text(
                                          '${entry.amountLabel} ${entry.amount}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: accent)),
                                    if (showId && log.target != null)
                                      Text('#${log.target}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: colors.onSurfaceVariant)),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (expanded)
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: colors.surfaceContainerLow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SelectionArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (final field in entry.details)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(field.$1,
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: colors.onSurfaceVariant)),
                                      const SizedBox(height: 2),
                                      Text(field.$2,
                                          style: const TextStyle(fontSize: 13)),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _RefreshError extends StatelessWidget {
  const _RefreshError({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        children: [
          Text(message,
              style: TextStyle(color: Theme.of(context).colorScheme.error)),
          TextButton(
            onPressed: context.watch<MainDataModel>().isRefreshingHangarLogs
                ? null
                : context.read<MainDataModel>().refreshHangarLogs,
            child: const Text('重试'),
          ),
        ],
      );
}

class _EmptyLogs extends StatelessWidget {
  const _EmptyLogs({required this.loading, this.error});
  final bool loading;
  final String? error;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          if (loading)
            const SizedBox.square(
                dimension: 28, child: CircularProgressIndicator(strokeWidth: 2))
          else
            Icon(
                error == null ? Icons.history_rounded : Icons.cloud_off_rounded,
                size: 32,
                color: colors.onSurfaceVariant),
          const SizedBox(height: 12),
          if (!loading && error != null)
            _RefreshError(message: error!)
          else
            Text(loading ? '正在加载日志…' : '暂无日志记录',
                style: TextStyle(color: colors.onSurfaceVariant)),
        ],
      ),
    );
  }
}
