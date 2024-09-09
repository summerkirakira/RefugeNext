// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_validation_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartValidationPropertyImpl _$$CartValidationPropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$CartValidationPropertyImpl(
      cart: Cart.fromJson(json['cart'] as Map<String, dynamic>),
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      typeName: json['typeName'] as String? ?? 'TyStore',
    );

Map<String, dynamic> _$$CartValidationPropertyImplToJson(
        _$CartValidationPropertyImpl instance) =>
    <String, dynamic>{
      'cart': instance.cart,
      'order': instance.order,
      'typeName': instance.typeName,
    };

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      mutations:
          CartMutations.fromJson(json['mutations'] as Map<String, dynamic>),
      flow: CheckoutFlow.fromJson(json['flow'] as Map<String, dynamic>),
      typeName: json['typeName'] as String? ?? 'TyShoppingCart',
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'mutations': instance.mutations,
      'flow': instance.flow,
      'typeName': instance.typeName,
    };

_$CartMutationsImpl _$$CartMutationsImplFromJson(Map<String, dynamic> json) =>
    _$CartMutationsImpl(
      validate: json['validate'] as String,
      typeName: json['typeName'] as String? ?? 'CartMutations',
    );

Map<String, dynamic> _$$CartMutationsImplToJson(_$CartMutationsImpl instance) =>
    <String, dynamic>{
      'validate': instance.validate,
      'typeName': instance.typeName,
    };

_$CheckoutFlowImpl _$$CheckoutFlowImplFromJson(Map<String, dynamic> json) =>
    _$CheckoutFlowImpl(
      steps: (json['steps'] as List<dynamic>)
          .map((e) => CartStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      current: Current.fromJson(json['current'] as Map<String, dynamic>),
      typeName: json['typeName'] as String? ?? 'TyCheckoutFlow',
    );

Map<String, dynamic> _$$CheckoutFlowImplToJson(_$CheckoutFlowImpl instance) =>
    <String, dynamic>{
      'steps': instance.steps,
      'current': instance.current,
      'typeName': instance.typeName,
    };

_$CurrentImpl _$$CurrentImplFromJson(Map<String, dynamic> json) =>
    _$CurrentImpl(
      orderCreated: json['orderCreated'] as bool,
    );

Map<String, dynamic> _$$CurrentImplToJson(_$CurrentImpl instance) =>
    <String, dynamic>{
      'orderCreated': instance.orderCreated,
    };

_$CartStepImpl _$$CartStepImplFromJson(Map<String, dynamic> json) =>
    _$CartStepImpl(
      step: json['step'] as String,
      action: json['action'] as String?,
      finalStep: json['finalStep'] as bool? ?? false,
      active: json['active'] as bool? ?? false,
      orderCreated: json['orderCreated'] as bool?,
      typeName: json['typeName'] as String? ?? 'TyCartStep',
    );

Map<String, dynamic> _$$CartStepImplToJson(_$CartStepImpl instance) =>
    <String, dynamic>{
      'step': instance.step,
      'action': instance.action,
      'finalStep': instance.finalStep,
      'active': instance.active,
      'orderCreated': instance.orderCreated,
      'typeName': instance.typeName,
    };

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      slug: json['slug'] as String,
      typeName: json['typeName'] as String? ?? 'TyOrder',
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'typeName': instance.typeName,
    };
