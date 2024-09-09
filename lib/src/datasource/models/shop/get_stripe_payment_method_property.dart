import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_stripe_payment_method_property.freezed.dart';
part 'get_stripe_payment_method_property.g.dart';

@freezed
class GetStripePaymentMethodProperty with _$GetStripePaymentMethodProperty {
  factory GetStripePaymentMethodProperty({
    required OrderData order,
    required Customer customer,
  }) = _GetStripePaymentMethodProperty;

  factory GetStripePaymentMethodProperty.fromJson(Map<String, dynamic> json) =>
      _$GetStripePaymentMethodPropertyFromJson(json);
}

@freezed
class OrderData with _$OrderData {
  factory OrderData({
    required Payment payment,
    required OrderDetails order,
    required PostalAddress billingAddress,
    PostalAddress? shippingAddress,
    required StoreContext context,
    required CartTotal totals,
    @Default([]) List<dynamic> savedCards,
    @Default('TyOrderQueries') String typeName,
  }) = _OrderData;

  factory OrderData.fromJson(Map<String, dynamic> json) => _$OrderDataFromJson(json);
}

@freezed
class Payment with _$Payment {
  factory Payment({
    required ApiKey apiKey,
    @Default('PaymentContext') String typeName,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);
}

@freezed
class ApiKey with _$ApiKey {
  factory ApiKey({
    required String value,
    @Default('ApiKey') String typeName,
  }) = _ApiKey;

  factory ApiKey.fromJson(Map<String, dynamic> json) => _$ApiKeyFromJson(json);
}

@freezed
class OrderDetails with _$OrderDetails {
  factory OrderDetails({
    required String id,
    required bool recurring,
    required String slug,
    required StripeIntentMethod paymentMethod,
    @Default('TyOrder') String typeName,
  }) = _OrderDetails;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => _$OrderDetailsFromJson(json);
}

@freezed
class StripeIntentMethod with _$StripeIntentMethod {
  factory StripeIntentMethod({
    required String clientSecret,
    @Default('StripeIntentMethod') String typeName,
  }) = _StripeIntentMethod;

  factory StripeIntentMethod.fromJson(Map<String, dynamic> json) => _$StripeIntentMethodFromJson(json);
}

@freezed
class PostalAddress with _$PostalAddress {
  factory PostalAddress({
    required String id,
    @Default('PostalAddress') String typeName,
  }) = _PostalAddress;

  factory PostalAddress.fromJson(Map<String, dynamic> json) => _$PostalAddressFromJson(json);
}

@freezed
class StoreContext with _$StoreContext {
  factory StoreContext({
    required PricingContext pricing,
    @Default('StoreContext') String typeName,
  }) = _StoreContext;

  factory StoreContext.fromJson(Map<String, dynamic> json) => _$StoreContextFromJson(json);
}

@freezed
class PricingContext with _$PricingContext {
  factory PricingContext({
    required String currencyCode,
    @Default('PricingContext') String typeName,
  }) = _PricingContext;

  factory PricingContext.fromJson(Map<String, dynamic> json) => _$PricingContextFromJson(json);
}

@freezed
class CartTotal with _$CartTotal {
  factory CartTotal({
    required int total,
    @Default('TyCartTotal') String typeName,
  }) = _CartTotal;

  factory CartTotal.fromJson(Map<String, dynamic> json) => _$CartTotalFromJson(json);
}

@freezed
class Customer with _$Customer {
  factory Customer({
    required int id,
    required String email,
    @Default('TyCustomer') String typeName,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
}