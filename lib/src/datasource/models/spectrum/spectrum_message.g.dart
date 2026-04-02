// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spectrum_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpectrumMessageImpl _$$SpectrumMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$SpectrumMessageImpl(
      id: json['id'] as String,
      timeCreated: (json['time_created'] as num?)?.toInt(),
      memberId: json['member_id'] as String?,
      lobbyId: json['lobby_id'] as String?,
      plaintext: json['plaintext'] as String?,
      member: json['member'] == null
          ? null
          : SpectrumMessageMember.fromJson(
              json['member'] as Map<String, dynamic>),
      lobby: json['lobby'] == null
          ? null
          : SpectrumMessageLobby.fromJson(
              json['lobby'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SpectrumMessageImplToJson(
        _$SpectrumMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time_created': instance.timeCreated,
      'member_id': instance.memberId,
      'lobby_id': instance.lobbyId,
      'plaintext': instance.plaintext,
      'member': instance.member,
      'lobby': instance.lobby,
    };

_$SpectrumMessageMemberImpl _$$SpectrumMessageMemberImplFromJson(
        Map<String, dynamic> json) =>
    _$SpectrumMessageMemberImpl(
      id: json['id'] as String,
      displayname: json['displayname'] as String,
      nickname: json['nickname'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$SpectrumMessageMemberImplToJson(
        _$SpectrumMessageMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayname': instance.displayname,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
    };

_$SpectrumMessageLobbyImpl _$$SpectrumMessageLobbyImplFromJson(
        Map<String, dynamic> json) =>
    _$SpectrumMessageLobbyImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$SpectrumMessageLobbyImplToJson(
        _$SpectrumMessageLobbyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
    };
