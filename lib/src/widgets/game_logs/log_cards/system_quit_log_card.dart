import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:refuge_next/src/datasource/models/game_log.dart';

/// 系统退出日志卡片
class SystemQuitLogCard extends StatelessWidget {
  final GameLog log;
  final VoidCallback? onTap;

  const SystemQuitLogCard({
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
                      color: Colors.pink.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.power_settings_new,
                      color: Colors.pink,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '退出游戏',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
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

              // 退出原因
              if (parsedData['reason'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.description,
                  label: '退出原因',
                  value: parsedData['reason'] as String,
                  iconColor: Colors.red,
                ),

              // 原因代码
              if (parsedData['cause'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.tag,
                  label: '原因代码',
                  value: parsedData['cause'].toString(),
                  iconColor: Colors.orange,
                ),

              // 退出代码
              if (parsedData['exit_code'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.exit_to_app,
                  label: '退出代码',
                  value: parsedData['exit_code'].toString(),
                  iconColor: Colors.blue,
                ),

              // 线程ID
              if (parsedData['thread_id'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.memory,
                  label: '线程ID',
                  value: parsedData['thread_id'].toString(),
                  iconColor: Colors.grey,
                ),

              // 主线程ID
              if (parsedData['main_thread_id'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.memory,
                  label: '主线程ID',
                  value: parsedData['main_thread_id'].toString(),
                  iconColor: Colors.grey,
                ),
            ],
          ),
        ),
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
