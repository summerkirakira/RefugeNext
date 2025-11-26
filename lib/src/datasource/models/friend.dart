import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend.freezed.dart';
part 'friend.g.dart';

@unfreezed
class Friend with _$Friend {
  factory Friend({
    required String id,
    required String displayname,
    required String nickname,
    required String avatar,
    String? signature,
    FriendMeta? meta,
    @Default(false) bool isGM,
    @JsonKey(name: 'spoken_languages') List<String>? spokenLanguages,
    FriendPresence? presence,
    @JsonKey(name: 'common_communities') List<String>? commonCommunities,
  }) = _Friend;

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
}

@unfreezed
class FriendMeta with _$FriendMeta {
  factory FriendMeta({
    List<FriendBadge>? badges,
  }) = _FriendMeta;

  factory FriendMeta.fromJson(Map<String, dynamic> json) => _$FriendMetaFromJson(json);
}

@unfreezed
class FriendBadge with _$FriendBadge {
  factory FriendBadge({
    required String name,
    required String icon,
    String? url,
  }) = _FriendBadge;

  factory FriendBadge.fromJson(Map<String, dynamic> json) => _$FriendBadgeFromJson(json);
}

@unfreezed
class FriendPresence with _$FriendPresence {
  factory FriendPresence({
    String? info,
    int? since,
    required String status,
  }) = _FriendPresence;

  factory FriendPresence.fromJson(Map<String, dynamic> json) => _$FriendPresenceFromJson(json);
}
