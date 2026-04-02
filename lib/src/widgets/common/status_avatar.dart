import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import '../../datasource/data_model.dart';

class StatusAvatar extends StatelessWidget {
  final String avatarUrl;
  final double size;

  const StatusAvatar({
    super.key,
    required this.avatarUrl,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    final status = context.watch<MainDataModel>().currentPresenceStatus;

    return PopupMenuButton<String>(
      onSelected: (value) {
        context.read<MainDataModel>().setPresenceStatus(value);
      },
      offset: Offset(0, size + 8),
      itemBuilder: (context) => const [
        PopupMenuItem(value: 'online', child: _StatusMenuItem(label: '在线', color: Colors.green)),
        PopupMenuItem(value: 'away', child: _StatusMenuItem(label: '离开', color: Colors.amber)),
        PopupMenuItem(value: 'do_not_disturb', child: _StatusMenuItem(label: '勿扰', color: Colors.red)),
        PopupMenuItem(value: 'playing', child: _StatusMenuItem(label: '游戏中', color: Colors.blue)),
        PopupMenuItem(value: 'invisible', child: _StatusMenuItem(label: '隐身', color: Colors.grey)),
      ],
      child: badges.Badge(
        position: badges.BadgePosition.bottomEnd(bottom: 0, end: 0),
        badgeContent: const SizedBox(width: 0, height: 0),
        badgeStyle: badges.BadgeStyle(
          shape: badges.BadgeShape.circle,
          badgeColor: _statusColor(status),
          padding: EdgeInsets.all(size * 0.15),
          elevation: 0,
          borderSide: BorderSide(
            color: Theme.of(context).scaffoldBackgroundColor,
            width: 2,
          ),
        ),
        child: AdvancedAvatar(
          name: 'User',
          size: size,
          image: CachedNetworkImageProvider(avatarUrl),
          decoration: const BoxDecoration(shape: BoxShape.circle),
        ),
      ),
    );
  }

  static Color _statusColor(String status) {
    switch (status) {
      case 'online':
        return Colors.green;
      case 'away':
        return Colors.amber;
      case 'do_not_disturb':
        return Colors.red;
      case 'playing':
        return Colors.blue;
      case 'invisible':
      default:
        return Colors.grey;
    }
  }
}

class _StatusMenuItem extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusMenuItem({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 10),
        Text(label),
      ],
    );
  }
}
