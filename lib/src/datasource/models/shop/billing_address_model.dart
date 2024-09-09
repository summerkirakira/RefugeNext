import 'package:freezed_annotation/freezed_annotation.dart';

part 'billing_address_model.freezed.dart';
part 'billing_address_model.g.dart';

@freezed
class BillingAddress with _$BillingAddress {
  factory BillingAddress({
    required Store store,
  }) = _BillingAddress;

  factory BillingAddress.fromJson(Map<String, dynamic> json) => _$BillingAddressFromJson(json);
}

@freezed
class Store with _$Store {
  factory Store({
    required List<Address> addressBook,
    required Cart cart,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}

@freezed
class Address with _$Address {
  factory Address({
    required String id,
    required bool defaultBilling,
    required bool defaultShipping,
    required String company,
    required String firstname,
    required String lastname,
    required String addressLine,
    required String postalCode,
    required String phone,
    required String city,
    required Destination country,
    required Destination region,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
class Cart with _$Cart {
  factory Cart({
    required CartTotal totals,
    Address? shippingAddress,
    Address? billingAddress,
    required bool shippingRequired,
    required bool billingRequired,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class CartTotal with _$CartTotal {
  factory CartTotal({
    required double discount,
    required double shipping,
    required double total,
    required double subTotal,
    required CartTax tax1,
    required CartTax tax2,
    required CartCoupon coupon,
    required Credits credits,
  }) = _CartTotal;

  factory CartTotal.fromJson(Map<String, dynamic> json) => _$CartTotalFromJson(json);
}

@freezed
class CartTax with _$CartTax {
  factory CartTax({
    String? name,
    required double amount,
  }) = _CartTax;

  factory CartTax.fromJson(Map<String, dynamic> json) => _$CartTaxFromJson(json);
}

@freezed
class CartCoupon with _$CartCoupon {
  factory CartCoupon({
    required double amount,
    required bool allowed,
    String? code,
  }) = _CartCoupon;

  factory CartCoupon.fromJson(Map<String, dynamic> json) => _$CartCouponFromJson(json);
}

@freezed
class Credits with _$Credits {
  factory Credits({
    required double amount,
    required Money nativeAmount,
    required bool applicable,
    required double maxApplicable,
  }) = _Credits;

  factory Credits.fromJson(Map<String, dynamic> json) => _$CreditsFromJson(json);
}

@freezed
class Money with _$Money {
  factory Money({
    required double value,
  }) = _Money;

  factory Money.fromJson(Map<String, dynamic> json) => _$MoneyFromJson(json);
}

@freezed
class Destination with _$Destination {
  factory Destination({
    required String id,
    required String name,
    bool? requireRegion,
    bool? hasRegion,
    String? code,
  }) = _Destination;

  factory Destination.fromJson(Map<String, dynamic> json) => _$DestinationFromJson(json);
}
