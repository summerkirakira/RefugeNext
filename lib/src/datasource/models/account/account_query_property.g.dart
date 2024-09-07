// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_query_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountQueryPropertyImpl _$$AccountQueryPropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountQueryPropertyImpl(
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AccountQueryPropertyImplToJson(
        _$AccountQueryPropertyImpl instance) =>
    <String, dynamic>{
      'account': instance.account,
    };

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      isAnonymous: json['isAnonymous'] as bool,
      avatar: json['avatar'] as String?,
      badges: (json['badges'] as List<dynamic>?)
          ?.map((e) => Badge.fromJson(e as Map<String, dynamic>))
          .toList(),
      displayname: json['displayname'] as String,
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'isAnonymous': instance.isAnonymous,
      'avatar': instance.avatar,
      'badges': instance.badges,
      'displayname': instance.displayname,
      'id': instance.id,
      'nickname': instance.nickname,
    };

_$BadgeImpl _$$BadgeImplFromJson(Map<String, dynamic> json) => _$BadgeImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$BadgeImplToJson(_$BadgeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
