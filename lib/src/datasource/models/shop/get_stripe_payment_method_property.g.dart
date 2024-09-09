// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_stripe_payment_method_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetStripePaymentMethodPropertyImpl
    _$$GetStripePaymentMethodPropertyImplFromJson(Map<String, dynamic> json) =>
        _$GetStripePaymentMethodPropertyImpl(
          order: OrderData.fromJson(json['order'] as Map<String, dynamic>),
          customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$GetStripePaymentMethodPropertyImplToJson(
        _$GetStripePaymentMethodPropertyImpl instance) =>
    <String, dynamic>{
      'order': instance.order,
      'customer': instance.customer,
    };

_$OrderDataImpl _$$OrderDataImplFromJson(Map<String, dynamic> json) =>
    _$OrderDataImpl(
      payment: Payment.fromJson(json['payment'] as Map<String, dynamic>),
      order: OrderDetails.fromJson(json['order'] as Map<String, dynamic>),
      billingAddress: PostalAddress.fromJson(
          json['billingAddress'] as Map<String, dynamic>),
      shippingAddress: json['shippingAddress'] == null
          ? null
          : PostalAddress.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
      context: StoreContext.fromJson(json['context'] as Map<String, dynamic>),
      totals: CartTotal.fromJson(json['totals'] as Map<String, dynamic>),
      savedCards: json['savedCards'] as List<dynamic>? ?? const [],
      typeName: json['typeName'] as String? ?? 'TyOrderQueries',
    );

Map<String, dynamic> _$$OrderDataImplToJson(_$OrderDataImpl instance) =>
    <String, dynamic>{
      'payment': instance.payment,
      'order': instance.order,
      'billingAddress': instance.billingAddress,
      'shippingAddress': instance.shippingAddress,
      'context': instance.context,
      'totals': instance.totals,
      'savedCards': instance.savedCards,
      'typeName': instance.typeName,
    };

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      apiKey: ApiKey.fromJson(json['apiKey'] as Map<String, dynamic>),
      typeName: json['typeName'] as String? ?? 'PaymentContext',
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'apiKey': instance.apiKey,
      'typeName': instance.typeName,
    };

_$ApiKeyImpl _$$ApiKeyImplFromJson(Map<String, dynamic> json) => _$ApiKeyImpl(
      value: json['value'] as String,
      typeName: json['typeName'] as String? ?? 'ApiKey',
    );

Map<String, dynamic> _$$ApiKeyImplToJson(_$ApiKeyImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'typeName': instance.typeName,
    };

_$OrderDetailsImpl _$$OrderDetailsImplFromJson(Map<String, dynamic> json) =>
    _$OrderDetailsImpl(
      id: json['id'] as String,
      recurring: json['recurring'] as bool,
      slug: json['slug'] as String,
      paymentMethod: StripeIntentMethod.fromJson(
          json['paymentMethod'] as Map<String, dynamic>),
      typeName: json['typeName'] as String? ?? 'TyOrder',
    );

Map<String, dynamic> _$$OrderDetailsImplToJson(_$OrderDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recurring': instance.recurring,
      'slug': instance.slug,
      'paymentMethod': instance.paymentMethod,
      'typeName': instance.typeName,
    };

_$StripeIntentMethodImpl _$$StripeIntentMethodImplFromJson(
        Map<String, dynamic> json) =>
    _$StripeIntentMethodImpl(
      clientSecret: json['clientSecret'] as String,
      typeName: json['typeName'] as String? ?? 'StripeIntentMethod',
    );

Map<String, dynamic> _$$StripeIntentMethodImplToJson(
        _$StripeIntentMethodImpl instance) =>
    <String, dynamic>{
      'clientSecret': instance.clientSecret,
      'typeName': instance.typeName,
    };

_$PostalAddressImpl _$$PostalAddressImplFromJson(Map<String, dynamic> json) =>
    _$PostalAddressImpl(
      id: json['id'] as String,
      typeName: json['typeName'] as String? ?? 'PostalAddress',
    );

Map<String, dynamic> _$$PostalAddressImplToJson(_$PostalAddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'typeName': instance.typeName,
    };

_$StoreContextImpl _$$StoreContextImplFromJson(Map<String, dynamic> json) =>
    _$StoreContextImpl(
      pricing: PricingContext.fromJson(json['pricing'] as Map<String, dynamic>),
      typeName: json['typeName'] as String? ?? 'StoreContext',
    );

Map<String, dynamic> _$$StoreContextImplToJson(_$StoreContextImpl instance) =>
    <String, dynamic>{
      'pricing': instance.pricing,
      'typeName': instance.typeName,
    };

_$PricingContextImpl _$$PricingContextImplFromJson(Map<String, dynamic> json) =>
    _$PricingContextImpl(
      currencyCode: json['currencyCode'] as String,
      typeName: json['typeName'] as String? ?? 'PricingContext',
    );

Map<String, dynamic> _$$PricingContextImplToJson(
        _$PricingContextImpl instance) =>
    <String, dynamic>{
      'currencyCode': instance.currencyCode,
      'typeName': instance.typeName,
    };

_$CartTotalImpl _$$CartTotalImplFromJson(Map<String, dynamic> json) =>
    _$CartTotalImpl(
      total: (json['total'] as num).toInt(),
      typeName: json['typeName'] as String? ?? 'TyCartTotal',
    );

Map<String, dynamic> _$$CartTotalImplToJson(_$CartTotalImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'typeName': instance.typeName,
    };

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      typeName: json['typeName'] as String? ?? 'TyCustomer',
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'typeName': instance.typeName,
    };
