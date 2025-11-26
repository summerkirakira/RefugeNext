import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:badges/badges.dart' as badges;

enum FriendStatusType {
  online,
  inGame,
  away,
  doNotDisturb,
  offline,
}

class FriendStatusCard extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final FriendStatusType statusType;
  final String? statusMessage;
  final VoidCallback? onTap;

  const FriendStatusCard({
    super.key,
    required this.name,
    required this.avatarUrl,
    this.statusType = FriendStatusType.offline,
    this.statusMessage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              _buildAvatar(),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    if (statusMessage != null && statusMessage!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        statusMessage!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.7),
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return badges.Badge(
      position: badges.BadgePosition.bottomEnd(bottom: 0, end: 0),
      badgeContent: _getBadgeContent(),
      badgeStyle: _getBadgeStyle(),
      child: AdvancedAvatar(
        size: 50,
        image: CachedNetworkImageProvider(avatarUrl),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _getBadgeContent() {
    // For solid circles, we can use an empty container with size?
    // Or just rely on badgeStyle padding/shape if content is null/empty string.
    // However, badges usually expect some content or specific styling.
    // Let's return a small SizedBox to ensure size consistency if needed, 
    // but badgeStyle controls the visual mostly.
    return const SizedBox(width: 0, height: 0);
  }

  badges.BadgeStyle _getBadgeStyle() {
    switch (statusType) {
      case FriendStatusType.online:
        return const badges.BadgeStyle(
          shape: badges.BadgeShape.circle,
          badgeColor: Colors.green,
          padding: EdgeInsets.all(6),
          elevation: 0,
          borderSide: BorderSide(color: Colors.white, width: 2), 
        );
      case FriendStatusType.inGame:
        return const badges.BadgeStyle(
          shape: badges.BadgeShape.circle,
          badgeColor: Colors.transparent, // Hollow center
          padding: EdgeInsets.all(5), // Adjust size
          elevation: 0,
          borderSide: BorderSide(color: Colors.green, width: 3), // Green ring
        );
      case FriendStatusType.away:
        return const badges.BadgeStyle(
          shape: badges.BadgeShape.circle,
          badgeColor: Colors.amber,
          padding: EdgeInsets.all(6),
          elevation: 0,
          borderSide: BorderSide(color: Colors.white, width: 2),
        );
      case FriendStatusType.doNotDisturb:
        return const badges.BadgeStyle(
          shape: badges.BadgeShape.circle,
          badgeColor: Colors.red,
          padding: EdgeInsets.all(6),
          elevation: 0,
          borderSide: BorderSide(color: Colors.white, width: 2),
        );
      case FriendStatusType.offline:
      default:
        return const badges.BadgeStyle(
          shape: badges.BadgeShape.circle,
          badgeColor: Colors.grey,
          padding: EdgeInsets.all(6),
          elevation: 0,
          borderSide: BorderSide(color: Colors.white, width: 2),
        );
    }
  }
}
