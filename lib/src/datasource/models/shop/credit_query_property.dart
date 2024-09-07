import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_query_property.freezed.dart';
part 'credit_query_property.g.dart';

@freezed
class CreditQueryProperty with _$CreditQueryProperty {
  factory CreditQueryProperty({
    required Customer customer,
    required Store store,
  }) = _CreditQueryProperty;

  factory CreditQueryProperty.fromJson(Map<String, dynamic> json) =>
      _$CreditQueryPropertyFromJson(json);
}

@freezed
class Customer with _$Customer {
  factory Customer({
    required Ledger ledger,
    @JsonKey(name: '__typename') required String typename,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
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

@freezed
class Store with _$Store {
  factory Store({
    required Cart cart,
    @JsonKey(name: '__typename') required String typename,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}

@freezed
class Cart with _$Cart {
  factory Cart({
    required Totals totals,
    @JsonKey(name: '__typename') required String typename,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class Totals with _$Totals {
  factory Totals({
    required Credits credits,
    @JsonKey(name: '__typename') required String typename,
  }) = _Totals;

  factory Totals.fromJson(Map<String, dynamic> json) => _$TotalsFromJson(json);
}

@freezed
class Credits with _$Credits {
  factory Credits({
    required bool applicable,
    required int maxApplicable,
    required int amount,
    @JsonKey(name: '__typename') required String typename,
  }) = _Credits;

  factory Credits.fromJson(Map<String, dynamic> json) =>
      _$CreditsFromJson(json);
}
