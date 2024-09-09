// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stepper_query_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StepperQueryPropertyImpl _$$StepperQueryPropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$StepperQueryPropertyImpl(
      store: Store.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StepperQueryPropertyImplToJson(
        _$StepperQueryPropertyImpl instance) =>
    <String, dynamic>{
      'store': instance.store,
    };

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
      context: StoreContext.fromJson(json['context'] as Map<String, dynamic>),
      cart: Cart.fromJson(json['cart'] as Map<String, dynamic>),
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      typeName: json['typeName'] as String? ?? 'TyStore',
    );

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      'context': instance.context,
      'cart': instance.cart,
      'order': instance.order,
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

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      hasRecurring: json['hasRecurring'] as bool,
      lineItemsQties: (json['lineItemsQties'] as num).toInt(),
      flow: CheckoutFlow.fromJson(json['flow'] as Map<String, dynamic>),
      typeName: json['typeName'] as String? ?? 'TyShoppingCart',
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'hasRecurring': instance.hasRecurring,
      'lineItemsQties': instance.lineItemsQties,
      'flow': instance.flow,
      'typeName': instance.typeName,
    };

_$CartLineItemImpl _$$CartLineItemImplFromJson(Map<String, dynamic> json) =>
    _$CartLineItemImpl(
      id: json['id'] as String,
      skuId: json['skuId'] as String,
      identifier: json['identifier'] as String?,
      taxDescription: (json['taxDescription'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sku: Sku.fromJson(json['sku'] as Map<String, dynamic>),
      unitPriceWithTax: BrowsePrice.fromJson(
          json['unitPriceWithTax'] as Map<String, dynamic>),
      qty: (json['qty'] as num).toInt(),
      discounts: json['discounts'] as List<dynamic>? ?? const [],
      typeName: json['typeName'] as String? ?? 'BaseCartLineItem',
    );

Map<String, dynamic> _$$CartLineItemImplToJson(_$CartLineItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'skuId': instance.skuId,
      'identifier': instance.identifier,
      'taxDescription': instance.taxDescription,
      'sku': instance.sku,
      'unitPriceWithTax': instance.unitPriceWithTax,
      'qty': instance.qty,
      'discounts': instance.discounts,
      'typeName': instance.typeName,
    };

_$SkuImpl _$$SkuImplFromJson(Map<String, dynamic> json) => _$SkuImpl(
      id: json['id'] as String,
      productId: json['productId'] as String,
      title: json['title'] as String,
      label: json['label'] as String,
      subtitle: json['subtitle'] as String,
      url: json['url'] as String,
      type: json['type'] as String,
      frequency: json['frequency'] as String,
      isWarbond: json['isWarbond'] as bool?,
      isPackage: json['isPackage'] as bool? ?? false,
      gameItems: (json['gameItems'] as List<dynamic>?)
              ?.map((e) => BaseGameItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stock: Stock.fromJson(json['stock'] as Map<String, dynamic>),
      media: ItemMedia.fromJson(json['media'] as Map<String, dynamic>),
      maxQty: (json['maxQty'] as num).toInt(),
      minQty: (json['minQty'] as num).toInt(),
      publicType:
          SkuPublicType.fromJson(json['publicType'] as Map<String, dynamic>),
      nativePrice:
          BrowsePrice.fromJson(json['nativePrice'] as Map<String, dynamic>),
      price: BrowseTaxedPrice.fromJson(json['price'] as Map<String, dynamic>),
      typeName: json['typeName'] as String? ?? 'TySku',
    );

Map<String, dynamic> _$$SkuImplToJson(_$SkuImpl instance) => <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'title': instance.title,
      'label': instance.label,
      'subtitle': instance.subtitle,
      'url': instance.url,
      'type': instance.type,
      'frequency': instance.frequency,
      'isWarbond': instance.isWarbond,
      'isPackage': instance.isPackage,
      'gameItems': instance.gameItems,
      'stock': instance.stock,
      'media': instance.media,
      'maxQty': instance.maxQty,
      'minQty': instance.minQty,
      'publicType': instance.publicType,
      'nativePrice': instance.nativePrice,
      'price': instance.price,
      'typeName': instance.typeName,
    };

_$BaseGameItemImpl _$$BaseGameItemImplFromJson(Map<String, dynamic> json) =>
    _$BaseGameItemImpl(
      typeName: json['typeName'] as String? ?? 'BaseGameItem',
    );

Map<String, dynamic> _$$BaseGameItemImplToJson(_$BaseGameItemImpl instance) =>
    <String, dynamic>{
      'typeName': instance.typeName,
    };

_$StockImpl _$$StockImplFromJson(Map<String, dynamic> json) => _$StockImpl(
      unlimited: json['unlimited'] as bool,
      show: json['show'] as bool,
      available: json['available'] as bool,
      backOrder: json['backOrder'] as bool,
      qty: (json['qty'] as num).toInt(),
      backOrderQty: (json['backOrderQty'] as num).toInt(),
      level: json['level'] as String,
      typeName: json['typeName'] as String? ?? 'TyStock',
    );

Map<String, dynamic> _$$StockImplToJson(_$StockImpl instance) =>
    <String, dynamic>{
      'unlimited': instance.unlimited,
      'show': instance.show,
      'available': instance.available,
      'backOrder': instance.backOrder,
      'qty': instance.qty,
      'backOrderQty': instance.backOrderQty,
      'level': instance.level,
      'typeName': instance.typeName,
    };

_$ItemMediaImpl _$$ItemMediaImplFromJson(Map<String, dynamic> json) =>
    _$ItemMediaImpl(
      thumbnail:
          ItemMediaDerived.fromJson(json['thumbnail'] as Map<String, dynamic>),
      typeName: json['typeName'] as String? ?? 'TyItemMedia',
    );

Map<String, dynamic> _$$ItemMediaImplToJson(_$ItemMediaImpl instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'typeName': instance.typeName,
    };

_$ItemMediaDerivedImpl _$$ItemMediaDerivedImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemMediaDerivedImpl(
      storeSmall: json['storeSmall'] as String,
      typeName: json['typeName'] as String? ?? 'TyItemMediaDerived',
    );

Map<String, dynamic> _$$ItemMediaDerivedImplToJson(
        _$ItemMediaDerivedImpl instance) =>
    <String, dynamic>{
      'storeSmall': instance.storeSmall,
      'typeName': instance.typeName,
    };

_$SkuPublicTypeImpl _$$SkuPublicTypeImplFromJson(Map<String, dynamic> json) =>
    _$SkuPublicTypeImpl(
      code: json['code'] as String,
      label: json['label'] as String,
      typeName: json['typeName'] as String? ?? 'SkuPublicType',
    );

Map<String, dynamic> _$$SkuPublicTypeImplToJson(_$SkuPublicTypeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'typeName': instance.typeName,
    };

_$BrowsePriceImpl _$$BrowsePriceImplFromJson(Map<String, dynamic> json) =>
    _$BrowsePriceImpl(
      amount: (json['amount'] as num).toInt(),
      discounted: (json['discounted'] as num?)?.toInt(),
      typeName: json['typeName'] as String? ?? 'TyBrowsePrice',
    );

Map<String, dynamic> _$$BrowsePriceImplToJson(_$BrowsePriceImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'discounted': instance.discounted,
      'typeName': instance.typeName,
    };

_$BrowseTaxedPriceImpl _$$BrowseTaxedPriceImplFromJson(
        Map<String, dynamic> json) =>
    _$BrowseTaxedPriceImpl(
      amount: (json['amount'] as num).toInt(),
      discounted: (json['discounted'] as num?)?.toInt(),
      taxDescription: (json['taxDescription'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      typeName: json['typeName'] as String? ?? 'TyBrowseTaxedPrice',
    );

Map<String, dynamic> _$$BrowseTaxedPriceImplToJson(
        _$BrowseTaxedPriceImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'discounted': instance.discounted,
      'taxDescription': instance.taxDescription,
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
