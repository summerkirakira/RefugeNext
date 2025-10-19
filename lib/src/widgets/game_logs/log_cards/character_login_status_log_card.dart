import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:refuge_next/src/datasource/models/game_log.dart';

/// 角色登录状态日志卡片
class CharacterLoginStatusLogCard extends StatelessWidget {
  final GameLog log;
  final VoidCallback? onTap;

  const CharacterLoginStatusLogCard({
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
                      Icons.account_circle,
                      color: Colors.purple,
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
                              log.subType ?? '角色登录状态',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                  ),
                            ),
                            if (parsedData['state'] != null) ...[
                              const SizedBox(width: 8),
                              _buildStateChip(context, parsedData),
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

              // 角色名称（主要信息）
              if (parsedData['character_name'] != null)
                _buildCharacterNameRow(
                  context,
                  parsedData['character_name'] as String,
                ),

              // 账户ID
              if (parsedData['account_id'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.badge,
                  label: '账户ID',
                  value: parsedData['account_id'] as String,
                  iconColor: Colors.blue,
                ),

              // GEID (Global Entity ID)
              if (parsedData['geid'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.fingerprint,
                  label: 'GEID',
                  value: parsedData['geid'] as String,
                  iconColor: Colors.purple,
                ),

              // 创建时间
              if (parsedData['created_at_date'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.calendar_today,
                  label: '创建时间',
                  value: _formatDate(parsedData['created_at_date'] as DateTime),
                  iconColor: Colors.orange,
                ),

              // 更新时间
              if (parsedData['updated_at_date'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.update,
                  label: '更新时间',
                  value: _formatDate(parsedData['updated_at_date'] as DateTime),
                  iconColor: Colors.cyan,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStateChip(BuildContext context, Map<String, dynamic> parsedData) {
    final state = parsedData['state'] as String;
    final stateDescription = parsedData['state_description'] as String;

    Color chipColor;
    IconData chipIcon;

    // 根据状态设置颜色和图标
    switch (state) {
      case 'STATE_CURRENT':
        chipColor = Colors.green;
        chipIcon = Icons.check_circle;
        break;
      case 'STATE_INACTIVE':
        chipColor = Colors.orange;
        chipIcon = Icons.pause_circle;
        break;
      case 'STATE_DELETED':
        chipColor = Colors.red;
        chipIcon = Icons.cancel;
        break;
      default:
        chipColor = Colors.grey;
        chipIcon = Icons.info;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: chipColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            chipIcon,
            size: 12,
            color: chipColor,
          ),
          const SizedBox(width: 4),
          Text(
            stateDescription,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: chipColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterNameRow(BuildContext context, String characterName) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.person,
            size: 16,
            color: Colors.green,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              characterName,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
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

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return '今天 ${DateFormat('HH:mm:ss').format(date)}';
    } else if (difference.inDays == 1) {
      return '昨天 ${DateFormat('HH:mm:ss').format(date)}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}天前 ${DateFormat('HH:mm').format(date)}';
    } else {
      return DateFormat('yyyy/MM/dd HH:mm').format(date);
    }
  }
}
