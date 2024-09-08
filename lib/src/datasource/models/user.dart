import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@unfreezed
class User with _$User {
  factory User({
    required String handle,
    required String name,
    required String email,
    required String password,
    required String rsiToken,
    required String profileImage,
    required String referralCode,
    required int referralCount,
    required int referralProspectCount,
    required int usd,
    required int uec,
    required int rec,
    required int hangarValue,
    required int currentHangarValue,
    required int totalSpent,
    String? organization,
    String? organizationName,
    String? organizationImage,
    String? orgRank,
    required int orgLevel,
    required DateTime registerTime,
    required String registerTimeString,
    @Default('') String extra,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
