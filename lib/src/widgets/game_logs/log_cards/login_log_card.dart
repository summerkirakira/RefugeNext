import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:refuge_next/src/datasource/models/game_log.dart';

/// 登录相关日志卡片
class LoginLogCard extends StatelessWidget {
  final GameLog log;
  final VoidCallback? onTap;

  const LoginLogCard({
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
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.login,
                      color: Colors.green,
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
                              log.subType ?? '登录操作',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
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

              // 状态信息（来自parsedData）
              if (parsedData['status_description'] != null)
                _buildStatusRow(
                  context,
                  parsedData['status'] as String?,
                  parsedData['status_description'] as String,
                ),

              // 玩家信息
              if (log.playerName != null)
                _buildInfoRow(
                  context,
                  icon: Icons.account_circle,
                  label: '玩家',
                  value: log.playerName!,
                ),

              // 玩家ID
              if (log.playerId != null)
                _buildInfoRow(
                  context,
                  icon: Icons.fingerprint,
                  label: '玩家ID',
                  value: log.playerId!,
                ),

              // 版本标识符（来自parsedData）
              if (parsedData['version_identifier'] != null)
                _buildInfoRow(
                  context,
                  icon: Icons.tag,
                  label: '版本标识',
                  value: parsedData['version_identifier'] as String,
                ),

              // 请求ID
              if (log.requestId != null)
                _buildInfoRow(
                  context,
                  icon: Icons.confirmation_number,
                  label: '请求ID',
                  value: log.requestId.toString(),
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

  Widget _buildStatusRow(
    BuildContext context,
    String? status,
    String description,
  ) {
    IconData icon;
    Color color;

    // 根据状态设置图标和颜色
    switch (status) {
      case 'Started':
        icon = Icons.play_circle;
        color = Colors.blue;
        break;
      case 'Completed':
        icon = Icons.check_circle;
        color = Colors.green;
        break;
      case 'Failed':
        icon = Icons.cancel;
        color = Colors.red;
        break;
      default:
        icon = Icons.info;
        color = Colors.grey;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 16,
            color: color,
          ),
          const SizedBox(width: 8),
          Text(
            '状态: ',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          Expanded(
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
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
