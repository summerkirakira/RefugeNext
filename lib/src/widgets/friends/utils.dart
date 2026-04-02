import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/datasource/models/friend.dart';
import 'package:refuge_next/src/network/api_service.dart';
import 'package:refuge_next/src/widgets/friends/widgets/friend_status_card.dart';

FriendStatusType getFriendStatusType(Friend friend) {
  final status = friend.presence?.status;
  if (status == null) return FriendStatusType.offline;

  switch (status) {
    case 'online':
      return FriendStatusType.online;
    case 'playing':
      return FriendStatusType.inGame;
    case 'away':
      return FriendStatusType.away;
    case 'dnd':
      return FriendStatusType.doNotDisturb;
    case 'offline':
    default:
      return FriendStatusType.offline;
  }
}

void showRemoveFriendDialog(BuildContext context, Friend friend) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('删除好友'),
      content: Text('确定要删除好友 ${friend.displayname} (@${friend.nickname}) 吗？'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text('取消'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(ctx);
            final success = await RsiApiClient().removeFriend(friend.id);
            if (success && context.mounted) {
              final friends = context.read<MainDataModel>().friends;
              friends?.removeWhere((f) => f.id == friend.id);
              context.read<MainDataModel>().notifyListeners();
            }
          },
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: const Text('删除'),
        ),
      ],
    ),
  );
}
