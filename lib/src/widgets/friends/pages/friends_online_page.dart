import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/widgets/friends/widgets/friend_status_card.dart';
import 'package:refuge_next/src/widgets/friends/utils.dart';

class FriendsOnlinePage extends StatelessWidget {
  const FriendsOnlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainDataModel>(
      builder: (context, dataModel, child) {
        final friends = dataModel.friends ?? [];
        final onlineFriends = dataModel.sortFriends(
          friends.where((f) {
            final type = getFriendStatusType(f);
            return type != FriendStatusType.offline;
          }).toList(),
        );

        return RefreshIndicator(
          onRefresh: () async => await context.read<MainDataModel>().updateFriends(),
          child: onlineFriends.isEmpty
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
                              Icon(Icons.online_prediction, size: 64, color: Colors.grey),
                              SizedBox(height: 16),
                              Text(
                                '暂无在线好友',
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
                  itemCount: onlineFriends.length,
                  itemBuilder: (context, index) {
                    final friend = onlineFriends[index];
                    return FriendStatusCard(
                      name: friend.displayname,
                      avatarUrl: friend.avatar,
                      statusType: getFriendStatusType(friend),
                      signature: friend.signature,
                      statusMessage: friend.presence?.info ?? friend.presence!.status,
                    );
                  },
                ),
        );
      },
    );
  }
}
