import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:refuge_next/src/datasource/models/game_log.dart';

/// 跃迁驱动日志卡片
class JumpDriveLogCard extends StatelessWidget {
  final GameLog log;
  final VoidCallback? onTap;

  const JumpDriveLogCard({
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
                      color: Colors.yellow.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.flash_on,
                      color: Colors.yellow,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '跃迁驱动',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow,
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

              // 状态
              if (parsedData['state'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.toggle_on,
                  label: '状态',
                  value: parsedData['state'] as String,
                  iconColor: Colors.blue,
                ),

              // 位置
              if (parsedData['location'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.location_on,
                  label: '位置',
                  value: parsedData['location'] as String,
                  iconColor: Colors.purple,
                ),

              // 权限状态
              if (parsedData['authority'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.admin_panel_settings,
                  label: '权限',
                  value: parsedData['authority'] as String,
                  iconColor: Colors.orange,
                ),

              // 跃迁驱动设备
              if (parsedData['jump_drive_name'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.hardware,
                  label: '跃迁驱动',
                  value: parsedData['jump_drive_name'] as String,
                  iconColor: Colors.cyan,
                ),

              // 所属飞船
              if (parsedData['parent_ship'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.rocket_launch,
                  label: '所属飞船',
                  value: parsedData['parent_ship'] as String,
                  iconColor: Colors.green,
                ),

              // 区域
              if (parsedData['zone'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.place,
                  label: '区域',
                  value: parsedData['zone'] as String,
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
