import 'package:freezed_annotation/freezed_annotation.dart';
import '../friend.dart';

part 'private_lobby.freezed.dart';
part 'private_lobby.g.dart';

@unfreezed
class PrivateLobby with _$PrivateLobby {
  factory PrivateLobby({
    required String id,
    required String type,
    @JsonKey(name: 'community_id') String? communityId,
    String? name,
    String? description,
    String? color,
    String? icon,
    @JsonKey(name: 'time_created') int? timeCreated,
    @JsonKey(name: 'subscription_key') String? subscriptionKey,
    @JsonKey(name: 'leader_id') String? leaderId,
    @JsonKey(name: 'online_members_count') int? onlineMembersCount,
    @JsonKey(name: 'last_read') int? lastRead,
    int? latest,
    List<Friend>? members,
    @JsonKey(name: 'new_messages') @Default(0) int newMessages,
    @JsonKey(name: 'last_message') LobbyLastMessage? lastMessage,
    @JsonKey(name: 'blocked_recipients') @Default(false) bool blockedRecipients,
  }) = _PrivateLobby;

  factory PrivateLobby.fromJson(Map<String, dynamic> json) => _$PrivateLobbyFromJson(json);
}

@unfreezed
class LobbyLastMessage with _$LobbyLastMessage {
  factory LobbyLastMessage({
    required String id,
    @JsonKey(name: 'time_created') int? timeCreated,
    @JsonKey(name: 'time_modified') int? timeModified,
    @JsonKey(name: 'lobby_id') String? lobbyId,
    @JsonKey(name: 'member_id') String? memberId,
    String? plaintext,
    @JsonKey(name: 'is_erased') @Default(false) bool isErased,
  }) = _LobbyLastMessage;

  factory LobbyLastMessage.fromJson(Map<String, dynamic> json) => _$LobbyLastMessageFromJson(json);
}
