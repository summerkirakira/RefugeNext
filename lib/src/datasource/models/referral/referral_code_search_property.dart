import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'referral_code_search_property.freezed.dart';
part 'referral_code_search_property.g.dart';

// 主响应类
@freezed
class ReferralCodeSearchResponse with _$ReferralCodeSearchResponse {
  const factory ReferralCodeSearchResponse({
    required ReferralCode referralCode,
  }) = _ReferralCodeSearchResponse;

  factory ReferralCodeSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$ReferralCodeSearchResponseFromJson(json);
}

// 推荐码类
@freezed
class ReferralCode with _$ReferralCode {
  const factory ReferralCode({
    required ReferralCodeValidationPayload validate,
    @JsonKey(name: '__typename') String? typename,
  }) = _ReferralCode;

  factory ReferralCode.fromJson(Map<String, dynamic> json) =>
      _$ReferralCodeFromJson(json);
}

// 推荐码验证载荷类
@freezed
class ReferralCodeValidationPayload with _$ReferralCodeValidationPayload {
  const factory ReferralCodeValidationPayload({
    required bool isValid,
    required String displayname,
    required String handle,
    required String avatar,
    required ReferralCodeValidationNextReward nextReward,
    required bool cantValidateCaptcha,
    @JsonKey(name: '__typename') String? typename,
  }) = _ReferralCodeValidationPayload;

  factory ReferralCodeValidationPayload.fromJson(Map<String, dynamic> json) =>
      _$ReferralCodeValidationPayloadFromJson(json);
}

// 下一个奖励类
@freezed
class ReferralCodeValidationNextReward with _$ReferralCodeValidationNextReward {
  const factory ReferralCodeValidationNextReward({
    required String title,
    required String image,
    @JsonKey(name: '__typename') String? typename,
  }) = _ReferralCodeValidationNextReward;

  factory ReferralCodeValidationNextReward.fromJson(Map<String, dynamic> json) =>
      _$ReferralCodeValidationNextRewardFromJson(json);
}