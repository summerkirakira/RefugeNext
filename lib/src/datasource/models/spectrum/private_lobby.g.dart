// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_lobby.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrivateLobbyImpl _$$PrivateLobbyImplFromJson(Map<String, dynamic> json) =>
    _$PrivateLobbyImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      communityId: json['community_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      color: json['color'] as String?,
      icon: json['icon'] as String?,
      timeCreated: (json['time_created'] as num?)?.toInt(),
      subscriptionKey: json['subscription_key'] as String?,
      leaderId: json['leader_id'] as String?,
      onlineMembersCount: (json['online_members_count'] as num?)?.toInt(),
      lastRead: (json['last_read'] as num?)?.toInt(),
      latest: (json['latest'] as num?)?.toInt(),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => Friend.fromJson(e as Map<String, dynamic>))
          .toList(),
      newMessages: (json['new_messages'] as num?)?.toInt() ?? 0,
      lastMessage: json['last_message'] == null
          ? null
          : LobbyLastMessage.fromJson(
              json['last_message'] as Map<String, dynamic>),
      blockedRecipients: json['blocked_recipients'] as bool? ?? false,
    );

Map<String, dynamic> _$$PrivateLobbyImplToJson(_$PrivateLobbyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'community_id': instance.communityId,
      'name': instance.name,
      'description': instance.description,
      'color': instance.color,
      'icon': instance.icon,
      'time_created': instance.timeCreated,
      'subscription_key': instance.subscriptionKey,
      'leader_id': instance.leaderId,
      'online_members_count': instance.onlineMembersCount,
      'last_read': instance.lastRead,
      'latest': instance.latest,
      'members': instance.members,
      'new_messages': instance.newMessages,
      'last_message': instance.lastMessage,
      'blocked_recipients': instance.blockedRecipients,
    };

_$LobbyLastMessageImpl _$$LobbyLastMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$LobbyLastMessageImpl(
      id: json['id'] as String,
      timeCreated: (json['time_created'] as num?)?.toInt(),
      timeModified: (json['time_modified'] as num?)?.toInt(),
      lobbyId: json['lobby_id'] as String?,
      memberId: json['member_id'] as String?,
      plaintext: json['plaintext'] as String?,
      isErased: json['is_erased'] as bool? ?? false,
    );

Map<String, dynamic> _$$LobbyLastMessageImplToJson(
        _$LobbyLastMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time_created': instance.timeCreated,
      'time_modified': instance.timeModified,
      'lobby_id': instance.lobbyId,
      'member_id': instance.memberId,
      'plaintext': instance.plaintext,
      'is_erased': instance.isErased,
    };
