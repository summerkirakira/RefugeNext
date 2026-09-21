import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../datasource/data_model.dart';
import '../../../datasource/models/hangar.dart';
import 'hangar_log_page.dart';

SliverWoltModalSheetPage getHangarLogBottomSheet(
  BuildContext context, {
  HangarItem? item,
}) {
  final targetIds = item == null ? null : {item.id, ...item.idList};
  return SliverWoltModalSheetPage(
    // Wolt 0.11 在分页时用目标页高度约束旧标题栏。保持与详情页一致，
    // 日志工具栏放在固定的 Sliver 中，避免返回详情时 56 -> 1 的布局溢出。
    navBarHeight: 1,
    isTopBarLayerAlwaysVisible: true,
    topBarTitle: const SizedBox.shrink(),
    mainContentSliversBuilder: (_) => [
      SliverPersistentHeader(
        pinned: true,
        delegate: _LogToolbar(
          isItemLog: item != null,
          onBack: () => WoltModalSheet.of(context).showAtIndex(0),
          onClose: () => Navigator.of(context).pop(),
        ),
      ),
      HangarLogPage(targetItemIds: targetIds, item: item),
    ],
  );
}

class _LogToolbar extends SliverPersistentHeaderDelegate {
  _LogToolbar({
    required this.isItemLog,
    required this.onBack,
    required this.onClose,
  });

  final bool isItemLog;
  final VoidCallback onBack;
  final VoidCallback onClose;

  @override
  double get minExtent => 56;
  @override
  double get maxExtent => 56;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: maxExtent,
      child: Material(
        color: colors.surface,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: colors.outlineVariant)),
          ),
          child: Row(
            children: [
              if (isItemLog)
                IconButton(
                  tooltip: '返回物品详情',
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: onBack,
                )
              else
                const SizedBox(width: 16),
              Expanded(
                child: Text(isItemLog ? '物品日志' : '机库日志',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
              ),
              Consumer<MainDataModel>(builder: (context, model, _) {
                return IconButton(
                  tooltip: '刷新日志',
                  onPressed: model.isRefreshingHangarLogs
                      ? null
                      : model.refreshHangarLogs,
                  icon: model.isRefreshingHangarLogs
                      ? const SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.refresh_rounded),
                );
              }),
              IconButton(
                tooltip: '关闭日志',
                icon: const Icon(Icons.close_rounded),
                onPressed: onClose,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _LogToolbar oldDelegate) =>
      isItemLog != oldDelegate.isItemLog ||
      onBack != oldDelegate.onBack ||
      onClose != oldDelegate.onClose;
}
