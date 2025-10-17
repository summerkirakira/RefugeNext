import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:refuge_next/src/datasource/models/game_log.dart';

/// 游戏版本日志卡片
class GameVersionLogCard extends StatelessWidget {
  final GameLog log;
  final VoidCallback? onTap;

  const GameVersionLogCard({
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
                      color: Colors.purple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.info,
                      color: Colors.purple,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '游戏版本',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
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

              // 版本标识符
              if (parsedData['version_identifier'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.fingerprint,
                  label: '版本标识',
                  value: parsedData['version_identifier'] as String,
                  iconColor: Colors.purple,
                ),

              // GameVersion
              if (parsedData['game_version'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.info,
                  label: 'GameVersion',
                  value: parsedData['game_version'].toString(),
                  iconColor: Colors.blue,
                ),

              // DataCore
              if (parsedData['data_core'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.storage,
                  label: 'DataCore',
                  value: parsedData['data_core'].toString(),
                  iconColor: Colors.green,
                ),

              // ClassRegistry
              if (parsedData['class_registry'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.class_,
                  label: 'ClassRegistry',
                  value: parsedData['class_registry'].toString(),
                  iconColor: Colors.orange,
                ),

              // Archetypes
              if (parsedData['archetypes'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.category,
                  label: 'Archetypes',
                  value: parsedData['archetypes'].toString(),
                  iconColor: Colors.cyan,
                ),

              // Components
              if (parsedData['components'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.widgets,
                  label: 'Components',
                  value: parsedData['components'].toString(),
                  iconColor: Colors.amber,
                ),

              // OC
              if (parsedData['oc'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.label,
                  label: 'OC',
                  value: parsedData['oc'].toString(),
                  iconColor: Colors.pink,
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
