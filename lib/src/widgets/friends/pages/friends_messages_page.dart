import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:badges/badges.dart' as badges;
import '../../../datasource/data_model.dart';
import '../../../datasource/models/spectrum/private_lobby.dart';
import '../../../datasource/models/friend.dart';
import '../widgets/chat_detail_page.dart';

class FriendsMessagesPage extends StatelessWidget {
  const FriendsMessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainDataModel>(
      builder: (context, dataModel, child) {
        final lobbies = dataModel.privateLobbies ?? [];
        final currentHandle = dataModel.currentUser?.handle;

        return RefreshIndicator(
          onRefresh: () async => await context.read<MainDataModel>().updateFriends(),
          child: lobbies.isEmpty
              ? LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: constraints.maxHeight),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.chat_bubble_outline, size: 64, color: Colors.grey),
                              SizedBox(height: 16),
                              Text('暂无私聊消息', style: TextStyle(color: Colors.grey, fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: lobbies.length,
                  itemBuilder: (context, index) {
                    final lobby = lobbies[index];
                    final otherMember = _getOtherMember(lobby, currentHandle);
                    return _LobbyCard(
                      lobby: lobby,
                      otherMember: otherMember,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatDetailPage(
                              lobby: lobby,
                              currentUserHandle: currentHandle ?? '',
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
        );
      },
    );
  }

  static Friend? _getOtherMember(PrivateLobby lobby, String? currentHandle) {
    if (lobby.members == null || currentHandle == null) return null;
    for (final m in lobby.members!) {
      if (m.nickname != currentHandle) return m;
    }
    return lobby.members!.isNotEmpty ? lobby.members!.first : null;
  }
}

class _LobbyCard extends StatelessWidget {
  final PrivateLobby lobby;
  final Friend? otherMember;
  final VoidCallback onTap;

  const _LobbyCard({
    required this.lobby,
    required this.otherMember,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final name = otherMember?.displayname ?? '未知用户';
    final avatar = otherMember?.avatar ??
        'https://cdn.robertsspaceindustries.com/static/images/account/avatar_default_big.jpg';
    final lastText = lobby.lastMessage?.plaintext ?? '';
    final time = _formatTime(lobby.lastMessage?.timeCreated);
    final unread = lobby.newMessages;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            badges.Badge(
              showBadge: unread > 0,
              badgeContent: Text(
                unread.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.red,
                padding: EdgeInsets.all(4),
              ),
              child: CircleAvatar(
                radius: 24,
                backgroundImage: CachedNetworkImageProvider(avatar),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (otherMember?.nickname != null) ...[
                        const SizedBox(width: 6),
                        Text(
                          '@${otherMember!.nickname}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.4),
                              ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lastText,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.6),
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (time.isNotEmpty)
              Text(
                time,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.4),
                      fontSize: 11,
                    ),
              ),
          ],
        ),
      ),
    );
  }

  static String _formatTime(int? timestamp) {
    if (timestamp == null) return '';
    final dt = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final now = DateTime.now();
    if (dt.year == now.year && dt.month == now.month && dt.day == now.day) {
      return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    }
    return '${dt.month}/${dt.day}';
  }
}
