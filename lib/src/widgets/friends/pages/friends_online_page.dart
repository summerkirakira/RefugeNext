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
        final onlineFriends = friends.where((f) {
          final type = getFriendStatusType(f);
          return type != FriendStatusType.offline;
        }).toList();

        if (onlineFriends.isEmpty) {
          return const Center(
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
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero, // Add this line
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
        );
      },
    );
  }
}
