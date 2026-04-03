import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/widgets/friends/widgets/friend_status_card.dart';
import 'package:refuge_next/src/widgets/friends/utils.dart';
import 'package:refuge_next/src/widgets/friends/widgets/friend_sort_bar.dart';
import 'package:refuge_next/src/widgets/friends/widgets/chat_detail_page.dart';
import 'package:refuge_next/src/network/api_service.dart';
import 'package:refuge_next/src/funcs/toast.dart';

class FriendsOfflinePage extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState>? refreshKey;
  const FriendsOfflinePage({super.key, this.refreshKey});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainDataModel>(
      builder: (context, dataModel, child) {
        final friends = dataModel.friends ?? [];
        final offlineFriends = dataModel.sortFriends(
          friends.where((f) {
            final type = getFriendStatusType(f);
            return type == FriendStatusType.offline;
          }).toList(),
        );

        return Column(
          children: [
            FriendSortBar(count: offlineFriends.length),
            Expanded(
              child: RefreshIndicator(
                key: refreshKey,
                onRefresh: () async => await context.read<MainDataModel>().updateFriends(),
                child: offlineFriends.isEmpty
                    ? LayoutBuilder(
                        builder: (context, constraints) {
                          return SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: constraints.maxHeight,
                              ),
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.cloud_off, size: 64, color: Colors.grey),
                                    SizedBox(height: 16),
                                    Text(
                                      '暂无离线好友',
                                      style: TextStyle(color: Colors.grey, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const AlwaysScrollableScrollPhysics(), // Ensure it's always scrollable
                        itemCount: offlineFriends.length,
                        itemBuilder: (context, index) {
                          final friend = offlineFriends[index];
                          return FriendStatusCard(
                            name: friend.displayname,
                            avatarUrl: friend.avatar,
                            statusType: getFriendStatusType(friend),
                            signature: friend.signature,
                            statusMessage: friend.presence?.info ?? friend.presence!.status,
                            onTap: () async {
                              final lobby = await RsiApiClient().getLobbyInfo(friend.nickname);
                              if (lobby != null && context.mounted) {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (_) => ChatDetailPage(
                                    lobby: lobby,
                                    currentUserHandle: dataModel.currentUser?.handle ?? '',
                                  ),
                                ));
                              } else {
                                showToast(message: '无法打开聊天');
                              }
                            },
                            onLongPress: () => showRemoveFriendDialog(context, friend),
                          );
                        },
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
