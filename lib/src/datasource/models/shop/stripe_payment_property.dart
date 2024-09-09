import 'package:freezed_annotation/freezed_annotation.dart';

part 'stripe_payment_property.freezed.dart';
part 'stripe_payment_property.g.dart';

@freezed
class StripePaymentProperty with _$StripePaymentProperty {
  factory StripePaymentProperty({
    required String id,
    // required String object,
    // required int amount,
    // required AmountDetails amountDetails,
    // dynamic automaticPaymentMethods,
    // DateTime? canceledAt,
    // String? cancellationReason,
    // required String captureMethod,
    // required String clientSecret,
    // required String confirmationMethod,
    // required int created,
    // required String currency,
    // String? description,
    // dynamic lastPaymentError,
    // required bool livemode,
    required NextAction next_action,
    // required String paymentMethod,
    // dynamic paymentMethodConfigurationDetails,
    // required List<String> paymentMethodTypes,
    // dynamic processing,
    // String? receiptEmail,
    // String? setupFutureUsage,
    // dynamic shipping,
    // dynamic source,
    // required String status,
  }) = _StripePaymentProperty;

  factory StripePaymentProperty.fromJson(Map<String, dynamic> json) =>
      _$StripePaymentPropertyFromJson(json);
}

@freezed
class AmountDetails with _$AmountDetails {
  factory AmountDetails({
    required Map<String, dynamic> tip,
  }) = _AmountDetails;

  factory AmountDetails.fromJson(Map<String, dynamic> json) =>
      _$AmountDetailsFromJson(json);
}

@freezed
class NextAction with _$NextAction {
  factory NextAction({
    required AlipayHandleRedirect alipay_handle_redirect,
    required String type,
  }) = _NextAction;

  factory NextAction.fromJson(Map<String, dynamic> json) =>
      _$NextActionFromJson(json);
}

@freezed
class AlipayHandleRedirect with _$AlipayHandleRedirect {
  factory AlipayHandleRedirect({
    required String native_data,
    String? native_url,
    required String return_url,
    required String url,
  }) = _AlipayHandleRedirect;

  factory AlipayHandleRedirect.fromJson(Map<String, dynamic> json) =>
      _$AlipayHandleRedirectFromJson(json);
}