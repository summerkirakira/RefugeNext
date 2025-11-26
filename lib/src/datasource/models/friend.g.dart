// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendImpl _$$FriendImplFromJson(Map<String, dynamic> json) => _$FriendImpl(
      id: json['id'] as String,
      displayname: json['displayname'] as String,
      nickname: json['nickname'] as String,
      avatar: json['avatar'] as String?,
      signature: json['signature'] as String?,
      meta: json['meta'] == null
          ? null
          : FriendMeta.fromJson(json['meta'] as Map<String, dynamic>),
      isGM: json['isGM'] as bool? ?? false,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      presence: json['presence'] == null
          ? null
          : FriendPresence.fromJson(json['presence'] as Map<String, dynamic>),
      commonCommunities: (json['common_communities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$FriendImplToJson(_$FriendImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayname': instance.displayname,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'signature': instance.signature,
      'meta': instance.meta,
      'isGM': instance.isGM,
      'spoken_languages': instance.spokenLanguages,
      'presence': instance.presence,
      'common_communities': instance.commonCommunities,
    };

_$FriendMetaImpl _$$FriendMetaImplFromJson(Map<String, dynamic> json) =>
    _$FriendMetaImpl(
      badges: (json['badges'] as List<dynamic>?)
          ?.map((e) => FriendBadge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FriendMetaImplToJson(_$FriendMetaImpl instance) =>
    <String, dynamic>{
      'badges': instance.badges,
    };

_$FriendBadgeImpl _$$FriendBadgeImplFromJson(Map<String, dynamic> json) =>
    _$FriendBadgeImpl(
      name: json['name'] as String,
      icon: json['icon'] as String,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$FriendBadgeImplToJson(_$FriendBadgeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'url': instance.url,
    };

_$FriendPresenceImpl _$$FriendPresenceImplFromJson(Map<String, dynamic> json) =>
    _$FriendPresenceImpl(
      info: json['info'] as String?,
      since: (json['since'] as num?)?.toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$FriendPresenceImplToJson(
        _$FriendPresenceImpl instance) =>
    <String, dynamic>{
      'info': instance.info,
      'since': instance.since,
      'status': instance.status,
    };
