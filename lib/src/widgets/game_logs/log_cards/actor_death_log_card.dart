import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:refuge_next/src/datasource/models/game_log.dart';

/// 角色死亡日志卡片
class ActorDeathLogCard extends StatelessWidget {
  final GameLog log;
  final VoidCallback? onTap;

  const ActorDeathLogCard({
    Key? key,
    required this.log,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 动态解析数据（延迟解析）
    final parsedData = log.parsedDataDynamic;

    // 判断是否自杀
    final isSuicide = parsedData['is_suicide'] == true;

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
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      isSuicide ? Icons.dangerous : Icons.person_off,
                      color: isSuicide ? Colors.orange : Colors.grey,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isSuicide ? '角色自杀' : '角色死亡',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isSuicide ? Colors.orange : Colors.grey,
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
                  _buildDamageTypeBadge(context, parsedData),
                ],
              ),

              const Divider(height: 16),

              // 被杀者信息
              if (parsedData['victim_name'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.person_off,
                  label: '被杀者',
                  value: parsedData['victim_name'] as String,
                  iconColor: Colors.red,
                ),

              // 杀手信息（如果不是自杀）
              if (!isSuicide && parsedData['killer_name'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.gps_fixed,
                  label: '击杀者',
                  value: parsedData['killer_name'] as String,
                  iconColor: Colors.orange,
                  highlight: true,
                ),

              // 武器信息
              if (parsedData['weapon_name'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.hardware,
                  label: '武器',
                  value: parsedData['weapon_name'] as String,
                  iconColor: Colors.purple,
                ),

              // 位置信息
              if (parsedData['zone'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.location_on,
                  label: '位置',
                  value: parsedData['zone'] as String,
                  iconColor: Colors.blue,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDamageTypeBadge(BuildContext context, Map<String, dynamic> parsedData) {
    final damageType = parsedData['damage_type'] as String?;

    if (damageType == null) {
      return const SizedBox.shrink();
    }

    Color badgeColor;
    IconData badgeIcon;
    String displayText;

    // 根据伤害类型设置颜色、图标和显示文本
    switch (damageType) {
      case 'Bullet':
        badgeColor = Colors.red;
        badgeIcon = Icons.gps_fixed;
        displayText = '子弹击杀';
        break;
      case 'Hazard':
        badgeColor = Colors.orange;
        badgeIcon = Icons.warning;
        displayText = '意外死亡';
        break;
      case 'Crash':
        badgeColor = Colors.orange;
        badgeIcon = Icons.link_off;
        displayText = '碰撞死亡';
        break;
      case 'VehicleDestruction':
        badgeColor = Colors.deepOrange;
        badgeIcon = Icons.local_fire_department;
        displayText = '舰船损坏';
        break;
      case 'Suicide':
        badgeColor = Colors.purple;
        badgeIcon = Icons.dangerous;
        displayText = '自杀';
        break;
      default:
        badgeColor = Colors.grey;
        badgeIcon = Icons.help_outline;
        displayText = damageType;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: badgeColor.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(badgeIcon, size: 12, color: badgeColor),
          const SizedBox(width: 4),
          Text(
            displayText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: badgeColor,
                  fontWeight: FontWeight.bold,
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
    bool highlight = false,
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
                    color: highlight ? Colors.orange : null,
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
