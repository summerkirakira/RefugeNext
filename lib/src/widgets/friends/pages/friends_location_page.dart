import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/widgets/friends/widgets/friend_status_card.dart';
import 'package:refuge_next/src/widgets/friends/utils.dart';

class FriendsLocationPage extends StatelessWidget {
  const FriendsLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainDataModel>(
      builder: (context, dataModel, child) {
        final friends = dataModel.friends ?? [];
        // Filter for friends who are in-game as they are most likely to have location info
        final locationFriends = friends.where((f) {
          final type = getFriendStatusType(f);
          return type == FriendStatusType.inGame;
        }).toList();

        if (locationFriends.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.map_outlined, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  '暂无好友位置信息',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero, // Add this line
          itemCount: locationFriends.length,
          itemBuilder: (context, index) {
            final friend = locationFriends[index];
            return FriendStatusCard(
              name: friend.displayname,
              avatarUrl: friend.avatar,
              statusType: getFriendStatusType(friend),
              signature: friend.signature,
              statusMessage: friend.presence?.info ?? "In Verse",
            );
          },
        );
      },
    );
  }
}
