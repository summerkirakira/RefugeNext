// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_list_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralRecruitsListImpl _$$ReferralRecruitsListImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferralRecruitsListImpl(
      recruitsCount: (json['recruitsCount'] as num).toInt(),
      prospectsCount: (json['prospectsCount'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              ReferralRecruitListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      typename: json['__typename'] as String?,
    );

Map<String, dynamic> _$$ReferralRecruitsListImplToJson(
        _$ReferralRecruitsListImpl instance) =>
    <String, dynamic>{
      'recruitsCount': instance.recruitsCount,
      'prospectsCount': instance.prospectsCount,
      'data': instance.data,
      '__typename': instance.typename,
    };

_$ReferralRecruitListDataImpl _$$ReferralRecruitListDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferralRecruitListDataImpl(
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      nickname: json['nickname'] as String,
      avatar: json['avatar'] as String,
      enlistedOn: json['enlistedOn'] as String,
      convertedOn: json['convertedOn'] as String?,
      typename: json['__typename'] as String?,
    );

Map<String, dynamic> _$$ReferralRecruitListDataImplToJson(
        _$ReferralRecruitListDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'enlistedOn': instance.enlistedOn,
      'convertedOn': instance.convertedOn,
      '__typename': instance.typename,
    };
