// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_code_search_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralCodeSearchResponseImpl _$$ReferralCodeSearchResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferralCodeSearchResponseImpl(
      referralCode:
          ReferralCode.fromJson(json['referralCode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReferralCodeSearchResponseImplToJson(
        _$ReferralCodeSearchResponseImpl instance) =>
    <String, dynamic>{
      'referralCode': instance.referralCode,
    };

_$ReferralCodeImpl _$$ReferralCodeImplFromJson(Map<String, dynamic> json) =>
    _$ReferralCodeImpl(
      validate: ReferralCodeValidationPayload.fromJson(
          json['validate'] as Map<String, dynamic>),
      typename: json['__typename'] as String?,
    );

Map<String, dynamic> _$$ReferralCodeImplToJson(_$ReferralCodeImpl instance) =>
    <String, dynamic>{
      'validate': instance.validate,
      '__typename': instance.typename,
    };

_$ReferralCodeValidationPayloadImpl
    _$$ReferralCodeValidationPayloadImplFromJson(Map<String, dynamic> json) =>
        _$ReferralCodeValidationPayloadImpl(
          isValid: json['isValid'] as bool,
          displayname: json['displayname'] as String,
          handle: json['handle'] as String,
          avatar: json['avatar'] as String,
          nextReward: ReferralCodeValidationNextReward.fromJson(
              json['nextReward'] as Map<String, dynamic>),
          cantValidateCaptcha: json['cantValidateCaptcha'] as bool,
          typename: json['__typename'] as String?,
        );

Map<String, dynamic> _$$ReferralCodeValidationPayloadImplToJson(
        _$ReferralCodeValidationPayloadImpl instance) =>
    <String, dynamic>{
      'isValid': instance.isValid,
      'displayname': instance.displayname,
      'handle': instance.handle,
      'avatar': instance.avatar,
      'nextReward': instance.nextReward,
      'cantValidateCaptcha': instance.cantValidateCaptcha,
      '__typename': instance.typename,
    };

_$ReferralCodeValidationNextRewardImpl
    _$$ReferralCodeValidationNextRewardImplFromJson(
            Map<String, dynamic> json) =>
        _$ReferralCodeValidationNextRewardImpl(
          title: json['title'] as String,
          image: json['image'] as String,
          typename: json['__typename'] as String?,
        );

Map<String, dynamic> _$$ReferralCodeValidationNextRewardImplToJson(
        _$ReferralCodeValidationNextRewardImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      '__typename': instance.typename,
    };
