// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      handle: json['handle'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      rsiToken: json['rsiToken'] as String,
      profileImage: json['profileImage'] as String,
      referralCode: json['referralCode'] as String,
      referralCount: (json['referralCount'] as num).toInt(),
      referralProspectCount: (json['referralProspectCount'] as num).toInt(),
      usd: (json['usd'] as num).toInt(),
      uec: (json['uec'] as num).toInt(),
      rec: (json['rec'] as num).toInt(),
      hangarValue: (json['hangarValue'] as num).toInt(),
      currentHangarValue: (json['currentHangarValue'] as num).toInt(),
      totalSpent: (json['totalSpent'] as num).toInt(),
      organization: json['organization'] as String?,
      organizationName: json['organizationName'] as String?,
      organizationImage: json['organizationImage'] as String?,
      orgRank: json['orgRank'] as String?,
      orgLevel: (json['orgLevel'] as num).toInt(),
      registerTime: DateTime.parse(json['registerTime'] as String),
      registerTimeString: json['registerTimeString'] as String,
      extra: json['extra'] as String? ?? '',
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'handle': instance.handle,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'rsiToken': instance.rsiToken,
      'profileImage': instance.profileImage,
      'referralCode': instance.referralCode,
      'referralCount': instance.referralCount,
      'referralProspectCount': instance.referralProspectCount,
      'usd': instance.usd,
      'uec': instance.uec,
      'rec': instance.rec,
      'hangarValue': instance.hangarValue,
      'currentHangarValue': instance.currentHangarValue,
      'totalSpent': instance.totalSpent,
      'organization': instance.organization,
      'organizationName': instance.organizationName,
      'organizationImage': instance.organizationImage,
      'orgRank': instance.orgRank,
      'orgLevel': instance.orgLevel,
      'registerTime': instance.registerTime.toIso8601String(),
      'registerTimeString': instance.registerTimeString,
      'extra': instance.extra,
    };
