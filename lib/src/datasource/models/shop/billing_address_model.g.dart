// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillingAddressImpl _$$BillingAddressImplFromJson(Map<String, dynamic> json) =>
    _$BillingAddressImpl(
      store: Store.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BillingAddressImplToJson(
        _$BillingAddressImpl instance) =>
    <String, dynamic>{
      'store': instance.store,
    };

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
      addressBook: (json['addressBook'] as List<dynamic>)
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      cart: Cart.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      'addressBook': instance.addressBook,
      'cart': instance.cart,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: json['id'] as String,
      defaultBilling: json['defaultBilling'] as bool,
      defaultShipping: json['defaultShipping'] as bool,
      company: json['company'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      addressLine: json['addressLine'] as String,
      postalCode: json['postalCode'] as String,
      phone: json['phone'] as String,
      city: json['city'] as String,
      country: Destination.fromJson(json['country'] as Map<String, dynamic>),
      region: Destination.fromJson(json['region'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'defaultBilling': instance.defaultBilling,
      'defaultShipping': instance.defaultShipping,
      'company': instance.company,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'addressLine': instance.addressLine,
      'postalCode': instance.postalCode,
      'phone': instance.phone,
      'city': instance.city,
      'country': instance.country,
      'region': instance.region,
    };

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      totals: CartTotal.fromJson(json['totals'] as Map<String, dynamic>),
      shippingAddress: json['shippingAddress'] == null
          ? null
          : Address.fromJson(json['shippingAddress'] as Map<String, dynamic>),
      billingAddress: json['billingAddress'] == null
          ? null
          : Address.fromJson(json['billingAddress'] as Map<String, dynamic>),
      shippingRequired: json['shippingRequired'] as bool,
      billingRequired: json['billingRequired'] as bool,
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'totals': instance.totals,
      'shippingAddress': instance.shippingAddress,
      'billingAddress': instance.billingAddress,
      'shippingRequired': instance.shippingRequired,
      'billingRequired': instance.billingRequired,
    };

_$CartTotalImpl _$$CartTotalImplFromJson(Map<String, dynamic> json) =>
    _$CartTotalImpl(
      discount: (json['discount'] as num).toDouble(),
      shipping: (json['shipping'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      subTotal: (json['subTotal'] as num).toDouble(),
      tax1: CartTax.fromJson(json['tax1'] as Map<String, dynamic>),
      tax2: CartTax.fromJson(json['tax2'] as Map<String, dynamic>),
      coupon: CartCoupon.fromJson(json['coupon'] as Map<String, dynamic>),
      credits: Credits.fromJson(json['credits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CartTotalImplToJson(_$CartTotalImpl instance) =>
    <String, dynamic>{
      'discount': instance.discount,
      'shipping': instance.shipping,
      'total': instance.total,
      'subTotal': instance.subTotal,
      'tax1': instance.tax1,
      'tax2': instance.tax2,
      'coupon': instance.coupon,
      'credits': instance.credits,
    };

_$CartTaxImpl _$$CartTaxImplFromJson(Map<String, dynamic> json) =>
    _$CartTaxImpl(
      name: json['name'] as String?,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$CartTaxImplToJson(_$CartTaxImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
    };

_$CartCouponImpl _$$CartCouponImplFromJson(Map<String, dynamic> json) =>
    _$CartCouponImpl(
      amount: (json['amount'] as num).toDouble(),
      allowed: json['allowed'] as bool,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$CartCouponImplToJson(_$CartCouponImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'allowed': instance.allowed,
      'code': instance.code,
    };

_$CreditsImpl _$$CreditsImplFromJson(Map<String, dynamic> json) =>
    _$CreditsImpl(
      amount: (json['amount'] as num).toDouble(),
      nativeAmount:
          Money.fromJson(json['nativeAmount'] as Map<String, dynamic>),
      applicable: json['applicable'] as bool,
      maxApplicable: (json['maxApplicable'] as num).toDouble(),
    );

Map<String, dynamic> _$$CreditsImplToJson(_$CreditsImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'nativeAmount': instance.nativeAmount,
      'applicable': instance.applicable,
      'maxApplicable': instance.maxApplicable,
    };

_$MoneyImpl _$$MoneyImplFromJson(Map<String, dynamic> json) => _$MoneyImpl(
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$MoneyImplToJson(_$MoneyImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

_$DestinationImpl _$$DestinationImplFromJson(Map<String, dynamic> json) =>
    _$DestinationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      requireRegion: json['requireRegion'] as bool?,
      hasRegion: json['hasRegion'] as bool?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$DestinationImplToJson(_$DestinationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'requireRegion': instance.requireRegion,
      'hasRegion': instance.hasRegion,
      'code': instance.code,
    };
