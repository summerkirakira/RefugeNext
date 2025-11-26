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
  final String? avatarUrl;
  final FriendStatusType statusType;
  final String? signature; // Added signature field
  final String? statusMessage;
  final VoidCallback? onTap;

  const FriendStatusCard({
    super.key,
    required this.name,
    required this.avatarUrl,
    this.statusType = FriendStatusType.offline,
    this.signature, // Initialize signature
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
          padding: const EdgeInsets.all(6.0),
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
                    if (signature != null && signature!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        signature!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.7),
                            ),
                        maxLines: 2, // Allow up to 2 lines for signature
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    if (statusMessage != null && statusMessage!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        statusMessage!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: _getStatusColor(), // Dynamic color for status message
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
        size: 60,
        image: CachedNetworkImageProvider(avatarUrl ?? 'https://cdn.robertsspaceindustries.com/static/images/account/avatar_default_big.jpg'),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _getBadgeContent() {
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

  Color _getStatusColor() {
    switch (statusType) {
      case FriendStatusType.online:
        return Colors.green;
      case FriendStatusType.inGame:
        return Colors.green; // In-game can also be seen as "active" green
      case FriendStatusType.away:
        return Colors.amber;
      case FriendStatusType.doNotDisturb:
        return Colors.red;
      case FriendStatusType.offline:
      default:
        return Colors.grey;
    }
  }
}
