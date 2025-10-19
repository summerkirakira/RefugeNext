import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:refuge_next/src/datasource/models/game_log.dart';

/// 库存相关日志卡片
class InventoryLogCard extends StatelessWidget {
  final GameLog log;
  final VoidCallback? onTap;

  const InventoryLogCard({
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
              // 头部
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.inventory_2,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              log.subType ?? '库存操作',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                            ),
                            if (log.result != null) ...[
                              const SizedBox(width: 8),
                              _buildResultChip(context),
                            ],
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _formatTimestamp(log.timestamp),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const Divider(height: 16),

              // 物品信息
              if (log.entityName != null)
                _buildInfoRow(
                  context,
                  icon: Icons.shopping_bag,
                  label: '物品',
                  value: log.entityName!,
                ),

              // 动作信息
              if (log.action != null)
                _buildInfoRow(
                  context,
                  icon: Icons.sync_alt,
                  label: '操作',
                  value: log.action!,
                ),

              // 库存ID
              if (log.inventoryId != null)
                _buildInfoRow(
                  context,
                  icon: Icons.tag,
                  label: '库存ID',
                  value: log.inventoryId!,
                ),

              // 位置信息
              if (log.location != null)
                _buildInfoRow(
                  context,
                  icon: Icons.location_on,
                  label: '位置',
                  value: log.location!,
                ),

              // 耗时信息
              if (log.elapsed != null)
                _buildInfoRow(
                  context,
                  icon: Icons.timer,
                  label: '耗时',
                  value: '${log.elapsed!.toStringAsFixed(2)}ms',
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultChip(BuildContext context) {
    final isSuccess = log.result == 'Success';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: isSuccess ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSuccess ? Icons.check_circle : Icons.error,
            size: 12,
            color: isSuccess ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 4),
          Text(
            log.result!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isSuccess ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 16,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays == 0) {
      return DateFormat('HH:mm:ss').format(timestamp);
    } else if (difference.inDays == 1) {
      return '昨天 ${DateFormat('HH:mm').format(timestamp)}';
    } else {
      return DateFormat('MM/dd HH:mm').format(timestamp);
    }
  }
}
