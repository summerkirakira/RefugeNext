// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_payment_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StripePaymentPropertyImpl _$$StripePaymentPropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$StripePaymentPropertyImpl(
      id: json['id'] as String,
      next_action:
          NextAction.fromJson(json['next_action'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StripePaymentPropertyImplToJson(
        _$StripePaymentPropertyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'next_action': instance.next_action,
    };

_$AmountDetailsImpl _$$AmountDetailsImplFromJson(Map<String, dynamic> json) =>
    _$AmountDetailsImpl(
      tip: json['tip'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$AmountDetailsImplToJson(_$AmountDetailsImpl instance) =>
    <String, dynamic>{
      'tip': instance.tip,
    };

_$NextActionImpl _$$NextActionImplFromJson(Map<String, dynamic> json) =>
    _$NextActionImpl(
      alipay_handle_redirect: AlipayHandleRedirect.fromJson(
          json['alipay_handle_redirect'] as Map<String, dynamic>),
      type: json['type'] as String,
    );

Map<String, dynamic> _$$NextActionImplToJson(_$NextActionImpl instance) =>
    <String, dynamic>{
      'alipay_handle_redirect': instance.alipay_handle_redirect,
      'type': instance.type,
    };

_$AlipayHandleRedirectImpl _$$AlipayHandleRedirectImplFromJson(
        Map<String, dynamic> json) =>
    _$AlipayHandleRedirectImpl(
      native_data: json['native_data'] as String,
      native_url: json['native_url'] as String?,
      return_url: json['return_url'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$AlipayHandleRedirectImplToJson(
        _$AlipayHandleRedirectImpl instance) =>
    <String, dynamic>{
      'native_data': instance.native_data,
      'native_url': instance.native_url,
      'return_url': instance.return_url,
      'url': instance.url,
    };
