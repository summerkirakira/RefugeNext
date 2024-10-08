import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_query_property.freezed.dart';
part 'account_query_property.g.dart';

@freezed
class AccountQueryProperty with _$AccountQueryProperty {
  factory AccountQueryProperty({
    required Account account,
  }) = _AccountQueryProperty;

  factory AccountQueryProperty.fromJson(Map<String, dynamic> json) =>
      _$AccountQueryPropertyFromJson(json);
}

@freezed
class Account with _$Account {
  factory Account({
    required bool isAnonymous,
    required String? avatar,
    required List<Badge>? badges,
    required String displayname,
    required int id,
    required String nickname,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

@freezed
class Badge with _$Badge {
  factory Badge({
    int? id,
    String? title,
  }) = _Badge;

  factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);
}
