import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_query_property.freezed.dart';
part 'credit_query_property.g.dart';

@freezed
class CreditQueryProperty with _$CreditQueryProperty {
  factory CreditQueryProperty({
    required Ledger ledgerCredit,
    required Ledger ledgerUec,
    required Ledger ledgerRec,
    @JsonKey(name: '__typename') required String typename,
  }) = _CreditQueryProperty;

  factory CreditQueryProperty.fromJson(Map<String, dynamic> json) =>
      _$CreditQueryPropertyFromJson(json);
}

@freezed
class Ledger with _$Ledger {
  factory Ledger({
    required String name,
    required Amount amount,
    @JsonKey(name: '__typename') required String typename,
  }) = _Ledger;

  factory Ledger.fromJson(Map<String, dynamic> json) => _$LedgerFromJson(json);
}

@freezed
class Amount with _$Amount {
  factory Amount({
    required int value,
    required Currency currency,
    @JsonKey(name: '__typename') required String typename,
  }) = _Amount;

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);
}

@freezed
class Currency with _$Currency {
  factory Currency({
    required String code,
    required String symbol,
    @JsonKey(name: '__typename') required String typename,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}
