import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:refuge_next/src/datasource/models/game_log.dart';
import 'package:refuge_next/src/repo/translation.dart';

/// 载具控制日志卡片
class VehicleControlLogCard extends StatelessWidget {
  final GameLog log;
  final VoidCallback? onTap;

  const VehicleControlLogCard({
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
                      color: Colors.deepOrange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.control_camera,
                      color: Colors.deepOrange,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '载具控制',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
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

              // 载具信息
              if (parsedData['vehicle_name'] != null || parsedData['vehicle_full_name'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.rocket_launch,
                  label: '载具',
                  value: _translateVehicleName(parsedData),
                  iconColor: Colors.green,
                  highlight: true,
                  highlightColor: Colors.green,
                ),

              // 动作描述
              if (parsedData['action_description'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.description,
                  label: '动作',
                  value: parsedData['action_description'] as String,
                  iconColor: Colors.blue,
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _translateVehicleName(Map<String, dynamic> parsedData) {
    final translationRepo = TranslationRepo();

    // 优先使用原始完整名称
    final fullName = parsedData['vehicle_full_name'] as String?;
    if (fullName != null) {
      return translationRepo.translateInGameVehicleName(fullName);
    }

    // 降级到清理后的名称（向后兼容）
    final cleanName = parsedData['vehicle_name'] as String?;
    return cleanName ?? '';
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    Color? iconColor,
    bool highlight = false,
    Color? highlightColor,
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
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
                    color: highlight ? (highlightColor ?? Colors.green) : null,
                  ),
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
