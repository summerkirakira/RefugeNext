import 'package:refuge_next/src/datasource/models/friend.dart';
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
