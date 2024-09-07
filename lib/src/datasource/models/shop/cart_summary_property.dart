import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_summary_property.freezed.dart';
part 'cart_summary_property.g.dart';

@freezed
class CartSummaryProperty with _$CartSummaryProperty {
  factory CartSummaryProperty({
    required Account account,
    required Store store,
  }) = _CartSummaryProperty;

  factory CartSummaryProperty.fromJson(Map<String, dynamic> json) => _$CartSummaryPropertyFromJson(json);
}

@freezed
class Account with _$Account {
  factory Account({
    required bool isAnonymous,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
}

@freezed
class Store with _$Store {
  factory Store({
    required Cart cart,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}

@freezed
class Cart with _$Cart {
  factory Cart({
    required Totals totals,
    required Flow flow,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class Totals with _$Totals {
  factory Totals({
    required int discount,
    required int shipping,
    required int total,
    required int subTotal,
    required Tax tax1,
    required Tax tax2,
    required Coupon coupon,
    required Credits credits,
  }) = _Totals;

  factory Totals.fromJson(Map<String, dynamic> json) => _$TotalsFromJson(json);
}

@freezed
class Tax with _$Tax {
  factory Tax({
    String? name,
    required int amount,
  }) = _Tax;

  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);
}

@freezed
class Coupon with _$Coupon {
  factory Coupon({
    required int amount,
    required bool allowed,
    String? code,
  }) = _Coupon;

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);
}

@freezed
class Credits with _$Credits {
  factory Credits({
    required int amount,
    int? nativeAmount,
    required bool applicable,
    required int maxApplicable,
  }) = _Credits;

  factory Credits.fromJson(Map<String, dynamic> json) => _$CreditsFromJson(json);
}

@freezed
class Flow with _$Flow {
  factory Flow({
    required List<CartStep> steps,
    required Current current,
  }) = _Flow;

  factory Flow.fromJson(Map<String, dynamic> json) => _$FlowFromJson(json);
}

@freezed
class CartStep with _$CartStep {
  factory CartStep({
    required String step,
    String? action,
    required bool finalStep,
    required bool active,
    @JsonKey(name: '__typename') String? typeName,
  }) = _CartStep;

  factory CartStep.fromJson(Map<String, dynamic> json) => _$CartStepFromJson(json);
}

@freezed
class Current with _$Current {
  factory Current({
    required bool orderCreated,
  }) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);
}
