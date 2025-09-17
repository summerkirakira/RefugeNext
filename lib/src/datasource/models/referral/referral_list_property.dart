import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'referral_list_property.freezed.dart';
part 'referral_list_property.g.dart';

// 主响应类
@freezed
class ReferralRecruitsList with _$ReferralRecruitsList {
  const factory ReferralRecruitsList({
    required int recruitsCount,
    required int prospectsCount,
    required List<ReferralRecruitListData> data,
    @JsonKey(name: '__typename') String? typename,
  }) = _ReferralRecruitsList;

  factory ReferralRecruitsList.fromJson(Map<String, dynamic> json) =>
      _$ReferralRecruitsListFromJson(json);
}

// 招募数据类
@freezed
class ReferralRecruitListData with _$ReferralRecruitListData {
  const factory ReferralRecruitListData({
    required String id,
    required String displayName,
    required String nickname,
    required String avatar,
    required String enlistedOn,
    String? convertedOn,
    @JsonKey(name: '__typename') String? typename,
  }) = _ReferralRecruitListData;

  factory ReferralRecruitListData.fromJson(Map<String, dynamic> json) =>
      _$ReferralRecruitListDataFromJson(json);
}