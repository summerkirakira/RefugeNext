import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:refuge_next/src/datasource/models/game_log.dart';

/// 载具摧毁日志卡片
class VehicleDestructionLogCard extends StatelessWidget {
  final GameLog log;
  final VoidCallback? onTap;

  const VehicleDestructionLogCard({
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
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.local_fire_department,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '载具摧毁',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
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
                  _buildDamageLevelBadge(context, parsedData),
                ],
              ),

              const Divider(height: 16),

              // 载具信息
              if (parsedData['vehicle_name'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.rocket_launch,
                  label: '载具',
                  value: parsedData['vehicle_name'] as String,
                  iconColor: Colors.blue,
                ),

              // 驾驶员信息
              if (parsedData['driver_name'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.person,
                  label: '驾驶员',
                  value: parsedData['driver_name'] as String,
                  iconColor: Colors.green,
                ),

              // 攻击者信息
              if (parsedData['attacker_name'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.gps_fixed,
                  label: '攻击者',
                  value: parsedData['attacker_name'] as String,
                  iconColor: Colors.red,
                  highlight: parsedData['attacker_name'] != parsedData['driver_name'],
                ),

              // 伤害等级
              if (parsedData['destroy_from'] != null && parsedData['destroy_to'] != null)
                _buildDamageProgress(context, parsedData),

              // 位置信息
              if (parsedData['zone'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.location_on,
                  label: '位置',
                  value: parsedData['zone'] as String,
                  iconColor: Colors.purple,
                ),

              // 速度信息
              if (parsedData['speed'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.speed,
                  label: '速度',
                  value: '${(parsedData['speed'] as double).toStringAsFixed(2)} m/s',
                  iconColor: Colors.orange,
                ),

              // 战斗类型
              if (parsedData['combat_type'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.shield,
                  label: '类型',
                  value: _translateCombatType(parsedData['combat_type'] as String?),
                  iconColor: Colors.amber,
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDamageStateText(int level) {
    switch (level) {
      case 0:
        return '正常';
      case 1:
        return '软死亡';
      case 2:
        return '摧毁';
      default:
        return '未知($level)';
    }
  }

  String _translateCombatType(String? type) {
    if (type == null) return '';

    switch (type) {
      case 'Combat':
        return '战斗';
      case 'Collision':
        return '碰撞';
      case 'SelfDestruct':
        return '自毁';
      default:
        return type; // 未知类型保持原文
    }
  }

  Widget _buildDamageLevelBadge(BuildContext context, Map<String, dynamic> parsedData) {
    final destroyTo = parsedData['destroy_to'] as int?;

    if (destroyTo == null) {
      return const SizedBox.shrink();
    }

    Color badgeColor;
    if (destroyTo >= 2) {
      badgeColor = Colors.red;
    } else if (destroyTo >= 1) {
      badgeColor = Colors.orange;
    } else {
      badgeColor = Colors.grey;
    }

    final stateText = _getDamageStateText(destroyTo);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: badgeColor.withOpacity(0.4)),
      ),
      child: Text(
        stateText,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: badgeColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildDamageProgress(BuildContext context, Map<String, dynamic> parsedData) {
    final destroyFrom = parsedData['destroy_from'] as int;
    final destroyTo = parsedData['destroy_to'] as int;
    const maxLevel = 5; // 假设最大伤害等级为5

    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.health_and_safety,
                size: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 8),
              Text(
                '伤害等级: ',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              Text(
                '$destroyFrom → $destroyTo',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: destroyTo >= 4 ? Colors.red : Colors.orange,
                    ),
              ),
            ],
          ),
          // const SizedBox(height: 6),
          // Row(
          //   children: List.generate(maxLevel, (index) {
          //     final level = index + 1;
          //     Color barColor;
          //
          //     if (level <= destroyFrom) {
          //       // 之前的伤害等级
          //       barColor = Colors.orange.withOpacity(0.3);
          //     } else if (level <= destroyTo) {
          //       // 新增的伤害等级
          //       barColor = Colors.red;
          //     } else {
          //       // 未达到的等级
          //       barColor = Colors.grey.withOpacity(0.2);
          //     }
          //
          //     return Expanded(
          //       child: Container(
          //         height: 4,
          //         margin: EdgeInsets.only(right: index < maxLevel - 1 ? 4 : 0),
          //         decoration: BoxDecoration(
          //           color: barColor,
          //           borderRadius: BorderRadius.circular(2),
          //         ),
          //       ),
          //     );
          //   }),
          // ),
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
                    color: highlight ? Colors.red : null,
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
