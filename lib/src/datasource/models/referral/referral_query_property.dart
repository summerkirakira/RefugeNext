import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'referral_query_property.freezed.dart';
part 'referral_query_property.g.dart';

// 主响应类
@freezed
class ReferralQueryResponse with _$ReferralQueryResponse {
  const factory ReferralQueryResponse({
    required ReferralData data,
  }) = _ReferralQueryResponse;

  factory ReferralQueryResponse.fromJson(Map<String, dynamic> json) =>
      _$ReferralQueryResponseFromJson(json);
}

// 数据类
@freezed
class ReferralData with _$ReferralData {
  const factory ReferralData({
    required int referralCountByCampaign,
  }) = _ReferralData;

  factory ReferralData.fromJson(Map<String, dynamic> json) =>
      _$ReferralDataFromJson(json);
}