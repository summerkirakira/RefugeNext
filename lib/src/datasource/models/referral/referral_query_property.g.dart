// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_query_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralQueryResponseImpl _$$ReferralQueryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferralQueryResponseImpl(
      data: ReferralData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReferralQueryResponseImplToJson(
        _$ReferralQueryResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$ReferralDataImpl _$$ReferralDataImplFromJson(Map<String, dynamic> json) =>
    _$ReferralDataImpl(
      referralCountByCampaign: (json['referralCountByCampaign'] as num).toInt(),
    );

Map<String, dynamic> _$$ReferralDataImplToJson(_$ReferralDataImpl instance) =>
    <String, dynamic>{
      'referralCountByCampaign': instance.referralCountByCampaign,
    };
