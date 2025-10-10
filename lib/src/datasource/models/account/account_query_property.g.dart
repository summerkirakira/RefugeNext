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
      canBeReferred: json['canBeReferred'] as bool,
      createdAt: json['createdAt'] as String,
      email: json['email'] as String,
      hasBeenReferred: json['hasBeenReferred'] as bool,
      hasGamePackage: json['hasGamePackage'] as bool,
      referral_code: json['referral_code'] as String,
      referrerReferralCode: json['referrerReferralCode'] as String,
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String,
      username: json['username'] as String,
      profileUrl: json['profileUrl'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'isAnonymous': instance.isAnonymous,
      'avatar': instance.avatar,
      'badges': instance.badges,
      'displayname': instance.displayname,
      'canBeReferred': instance.canBeReferred,
      'createdAt': instance.createdAt,
      'email': instance.email,
      'hasBeenReferred': instance.hasBeenReferred,
      'hasGamePackage': instance.hasGamePackage,
      'referral_code': instance.referral_code,
      'referrerReferralCode': instance.referrerReferralCode,
      'id': instance.id,
      'nickname': instance.nickname,
      'username': instance.username,
      'profileUrl': instance.profileUrl,
      'status': instance.status,
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
