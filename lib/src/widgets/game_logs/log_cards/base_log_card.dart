import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:refuge_next/src/datasource/models/game_log.dart';

/// 基础日志卡片组件
class BaseLogCard extends StatelessWidget {
  final GameLog log;
  final VoidCallback? onTap;

  const BaseLogCard({
    Key? key,
    required this.log,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 头部：时间戳 + 类型标签
              _buildHeader(context),
              const SizedBox(height: 8),

              // 主要内容区域
              _buildMainContent(context),

              // 元数据区域（玩家、实体等）
              if (_hasMetadata())
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: _buildMetadata(context),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // 时间戳
        Row(
          children: [
            Icon(
              Icons.access_time,
              size: 14,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(width: 4),
            Text(
              _formatTimestamp(log.timestamp),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ],
        ),

        // 类型标签
        _buildTypeChip(context),
      ],
    );
  }

  Widget _buildTypeChip(BuildContext context) {
    final color = _getTypeColor(context);
    final label = log.subType ?? log.logType;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Text(
      log.content,
      style: Theme.of(context).textTheme.bodyMedium,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildMetadata(BuildContext context) {
    final metadataItems = <Widget>[];

    // 玩家信息
    if (log.playerName != null) {
      metadataItems.add(_buildMetadataItem(
        context,
        icon: Icons.person,
        label: log.playerName!,
      ));
    }

    // 实体信息
    if (log.entityName != null) {
      metadataItems.add(_buildMetadataItem(
        context,
        icon: Icons.inventory_2,
        label: log.entityName!,
      ));
    }

    // 位置信息
    if (log.location != null) {
      metadataItems.add(_buildMetadataItem(
        context,
        icon: Icons.location_on,
        label: log.location!,
      ));
    }

    // 结果信息
    if (log.result != null) {
      metadataItems.add(_buildMetadataItem(
        context,
        icon: log.result == 'Success' ? Icons.check_circle : Icons.error,
        label: log.result!,
        color: log.result == 'Success' ? Colors.green : Colors.red,
      ));
    }

    if (metadataItems.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 12,
      runSpacing: 4,
      children: metadataItems,
    );
  }

  Widget _buildMetadataItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    Color? color,
  }) {
    final itemColor = color ?? Theme.of(context).colorScheme.onSurfaceVariant;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: itemColor),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: itemColor,
              ),
        ),
      ],
    );
  }

  bool _hasMetadata() {
    return log.playerName != null ||
        log.entityName != null ||
        log.location != null ||
        log.result != null;
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays == 0) {
      // 今天：显示时间
      return DateFormat('HH:mm:ss').format(timestamp);
    } else if (difference.inDays == 1) {
      // 昨天
      return '昨天 ${DateFormat('HH:mm').format(timestamp)}';
    } else if (difference.inDays < 7) {
      // 一周内：显示星期
      return '${_getWeekday(timestamp)} ${DateFormat('HH:mm').format(timestamp)}';
    } else {
      // 更早：显示日期
      return DateFormat('MM/dd HH:mm').format(timestamp);
    }
  }

  String _getWeekday(DateTime date) {
    const weekdays = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
    return weekdays[date.weekday - 1];
  }

  Color _getTypeColor(BuildContext context) {
    switch (log.logType) {
      case LogTypes.inventory:
        return Colors.blue;
      case LogTypes.attachment:
        return Colors.orange;
      case LogTypes.login:
        return Colors.green;
      case LogTypes.gameVersion:
        return Colors.purple;
      case LogTypes.physics:
        return Colors.teal;
      case LogTypes.error:
        return Colors.red;
      case LogTypes.warning:
        return Colors.amber;
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }
}
