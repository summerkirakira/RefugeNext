// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_summary_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartSummaryPropertyImpl _$$CartSummaryPropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$CartSummaryPropertyImpl(
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
      store: Store.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CartSummaryPropertyImplToJson(
        _$CartSummaryPropertyImpl instance) =>
    <String, dynamic>{
      'account': instance.account,
      'store': instance.store,
    };

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      isAnonymous: json['isAnonymous'] as bool,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'isAnonymous': instance.isAnonymous,
    };

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
      cart: Cart.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      'cart': instance.cart,
    };

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      totals: Totals.fromJson(json['totals'] as Map<String, dynamic>),
      flow: Flow.fromJson(json['flow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'totals': instance.totals,
      'flow': instance.flow,
    };

_$TotalsImpl _$$TotalsImplFromJson(Map<String, dynamic> json) => _$TotalsImpl(
      discount: (json['discount'] as num).toInt(),
      shipping: (json['shipping'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      subTotal: (json['subTotal'] as num).toInt(),
      tax1: Tax.fromJson(json['tax1'] as Map<String, dynamic>),
      tax2: Tax.fromJson(json['tax2'] as Map<String, dynamic>),
      coupon: Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
      credits: Credits.fromJson(json['credits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TotalsImplToJson(_$TotalsImpl instance) =>
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

_$TaxImpl _$$TaxImplFromJson(Map<String, dynamic> json) => _$TaxImpl(
      name: json['name'] as String?,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$$TaxImplToJson(_$TaxImpl instance) => <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
    };

_$CouponImpl _$$CouponImplFromJson(Map<String, dynamic> json) => _$CouponImpl(
      amount: (json['amount'] as num).toInt(),
      allowed: json['allowed'] as bool,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$CouponImplToJson(_$CouponImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'allowed': instance.allowed,
      'code': instance.code,
    };

_$CreditsImpl _$$CreditsImplFromJson(Map<String, dynamic> json) =>
    _$CreditsImpl(
      amount: (json['amount'] as num).toInt(),
      nativeAmount: (json['nativeAmount'] as num?)?.toInt(),
      applicable: json['applicable'] as bool,
      maxApplicable: (json['maxApplicable'] as num).toInt(),
    );

Map<String, dynamic> _$$CreditsImplToJson(_$CreditsImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'nativeAmount': instance.nativeAmount,
      'applicable': instance.applicable,
      'maxApplicable': instance.maxApplicable,
    };

_$FlowImpl _$$FlowImplFromJson(Map<String, dynamic> json) => _$FlowImpl(
      steps: (json['steps'] as List<dynamic>)
          .map((e) => CartStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      current: Current.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FlowImplToJson(_$FlowImpl instance) =>
    <String, dynamic>{
      'steps': instance.steps,
      'current': instance.current,
    };

_$CartStepImpl _$$CartStepImplFromJson(Map<String, dynamic> json) =>
    _$CartStepImpl(
      step: json['step'] as String,
      action: json['action'] as String?,
      finalStep: json['finalStep'] as bool,
      active: json['active'] as bool,
      typeName: json['__typename'] as String?,
    );

Map<String, dynamic> _$$CartStepImplToJson(_$CartStepImpl instance) =>
    <String, dynamic>{
      'step': instance.step,
      'action': instance.action,
      'finalStep': instance.finalStep,
      'active': instance.active,
      '__typename': instance.typeName,
    };

_$CurrentImpl _$$CurrentImplFromJson(Map<String, dynamic> json) =>
    _$CurrentImpl(
      orderCreated: json['orderCreated'] as bool,
    );

Map<String, dynamic> _$$CurrentImplToJson(_$CurrentImpl instance) =>
    <String, dynamic>{
      'orderCreated': instance.orderCreated,
    };
