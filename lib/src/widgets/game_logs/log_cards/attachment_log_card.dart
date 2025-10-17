import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:refuge_next/src/datasource/models/game_log.dart';

/// 装备相关日志卡片
class AttachmentLogCard extends StatelessWidget {
  final GameLog log;
  final VoidCallback? onTap;

  const AttachmentLogCard({
    Key? key,
    required this.log,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 动态解析数据（延迟解析）
    final parsedData = log.parsedDataDynamic;

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
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.hardware,
                      color: Colors.orange,
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
                              log.subType ?? '装备操作',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
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

              // 玩家信息
              if (log.playerName != null)
                _buildInfoRow(
                  context,
                  icon: Icons.person,
                  label: '玩家',
                  value: log.playerName!,
                  iconColor: Colors.blue,
                ),

              // 装备信息（优先使用parsedData）
              if (parsedData['attachment_name'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.settings,
                  label: '装备',
                  value: parsedData['attachment_name'] as String,
                  iconColor: Colors.purple,
                )
              else if (log.entityClass != null)
                _buildInfoRow(
                  context,
                  icon: Icons.settings,
                  label: '装备',
                  value: log.entityClass!,
                  iconColor: Colors.purple,
                ),

              // 状态（来自parsedData）
              if (parsedData['status'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.check_circle_outline,
                  label: '状态',
                  value: parsedData['status'] as String,
                  iconColor: Colors.green,
                ),

              // 端口位置（来自parsedData）
              if (parsedData['port'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.location_on,
                  label: '端口',
                  value: parsedData['port'] as String,
                  iconColor: Colors.teal,
                ),

              // 耗时信息
              if (log.elapsed != null)
                _buildInfoRow(
                  context,
                  icon: Icons.timer,
                  label: '耗时',
                  value: '${log.elapsed!.toStringAsFixed(2)}ms',
                  iconColor: Colors.grey,
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
    Color? iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 16,
            color: iconColor ?? Theme.of(context).colorScheme.onSurfaceVariant,
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
