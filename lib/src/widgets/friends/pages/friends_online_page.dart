import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../datasource/data_model.dart';
import '../widgets/friend_status_card.dart';

class FriendsOnlinePage extends StatelessWidget {
  const FriendsOnlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - in a real app, this would come from a provider or API
    final mockAvatarUrl = context.select<MainDataModel, String?>((m) => m.currentUser?.profileImage) ?? '';
    
    return ListView(
      padding: const EdgeInsets.only(top: 8),
      children: [
        FriendStatusCard(
          name: 'Cirno',
          avatarUrl: mockAvatarUrl,
          statusType: FriendStatusType.online,
          statusMessage: 'Online',
        ),
        FriendStatusCard(
          name: 'Reimu Hakurei',
          avatarUrl: mockAvatarUrl,
          statusType: FriendStatusType.inGame,
          statusMessage: 'Playing Star Citizen - PU',
        ),
        FriendStatusCard(
          name: 'Marisa Kirisame',
          avatarUrl: mockAvatarUrl,
          statusType: FriendStatusType.away,
          statusMessage: 'Away for 10 mins',
        ),
        FriendStatusCard(
          name: 'Sakuya Izayoi',
          avatarUrl: mockAvatarUrl,
          statusType: FriendStatusType.doNotDisturb,
          statusMessage: 'Do Not Disturb',
        ),
      ],
    );
  }
}
