// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreDataImpl _$$StoreDataImplFromJson(Map<String, dynamic> json) =>
    _$StoreDataImpl(
      store: Store.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoreDataImplToJson(_$StoreDataImpl instance) =>
    <String, dynamic>{
      'store': instance.store,
    };

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
      context: Context.fromJson(json['context'] as Map<String, dynamic>),
      cart: Cart.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      'context': instance.context,
      'cart': instance.cart,
    };

_$ContextImpl _$$ContextImplFromJson(Map<String, dynamic> json) =>
    _$ContextImpl(
      pricing: Pricing.fromJson(json['pricing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContextImplToJson(_$ContextImpl instance) =>
    <String, dynamic>{
      'pricing': instance.pricing,
    };

_$PricingImpl _$$PricingImplFromJson(Map<String, dynamic> json) =>
    _$PricingImpl(
      currencyCode: json['currencyCode'] as String,
    );

Map<String, dynamic> _$$PricingImplToJson(_$PricingImpl instance) =>
    <String, dynamic>{
      'currencyCode': instance.currencyCode,
    };

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      hasRecurring: json['hasRecurring'] as bool,
      hasDigital: json['hasDigital'] as bool,
      lineItems: (json['lineItems'] as List<dynamic>)
          .map((e) => LineItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'hasRecurring': instance.hasRecurring,
      'hasDigital': instance.hasDigital,
      'lineItems': instance.lineItems,
    };

_$LineItemImpl _$$LineItemImplFromJson(Map<String, dynamic> json) =>
    _$LineItemImpl(
      id: json['id'] as String,
      skuId: json['skuId'] as String,
      identifier: json['identifier'] as String?,
      taxDescription: (json['taxDescription'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      sku: Sku.fromJson(json['sku'] as Map<String, dynamic>),
      unitPriceWithTax:
          UnitPrice.fromJson(json['unitPriceWithTax'] as Map<String, dynamic>),
      qty: (json['qty'] as num).toInt(),
      upgrade: json['upgrade'] == null
          ? null
          : Upgrade.fromJson(json['upgrade'] as Map<String, dynamic>),
      discounts: json['discounts'] as List<dynamic>,
    );

Map<String, dynamic> _$$LineItemImplToJson(_$LineItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'skuId': instance.skuId,
      'identifier': instance.identifier,
      'taxDescription': instance.taxDescription,
      'sku': instance.sku,
      'unitPriceWithTax': instance.unitPriceWithTax,
      'qty': instance.qty,
      'upgrade': instance.upgrade,
      'discounts': instance.discounts,
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
      isPackage: json['isPackage'] as bool,
      stock: Stock.fromJson(json['stock'] as Map<String, dynamic>),
      media: Media.fromJson(json['media'] as Map<String, dynamic>),
      maxQty: (json['maxQty'] as num).toInt(),
      minQty: (json['minQty'] as num).toInt(),
      publicType:
          PublicType.fromJson(json['publicType'] as Map<String, dynamic>),
      nativePrice: Price.fromJson(json['nativePrice'] as Map<String, dynamic>),
      price: Price.fromJson(json['price'] as Map<String, dynamic>),
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
      'stock': instance.stock,
      'media': instance.media,
      'maxQty': instance.maxQty,
      'minQty': instance.minQty,
      'publicType': instance.publicType,
      'nativePrice': instance.nativePrice,
      'price': instance.price,
    };

_$GameItemImpl _$$GameItemImplFromJson(Map<String, dynamic> json) =>
    _$GameItemImpl(
      specs: json['specs'] == null
          ? null
          : Specs.fromJson(json['specs'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GameItemImplToJson(_$GameItemImpl instance) =>
    <String, dynamic>{
      'specs': instance.specs,
    };

_$SpecsImpl _$$SpecsImplFromJson(Map<String, dynamic> json) => _$SpecsImpl(
      productionStatus: json['productionStatus'] as String?,
    );

Map<String, dynamic> _$$SpecsImplToJson(_$SpecsImpl instance) =>
    <String, dynamic>{
      'productionStatus': instance.productionStatus,
    };

_$StockImpl _$$StockImplFromJson(Map<String, dynamic> json) => _$StockImpl(
      unlimited: json['unlimited'] as bool,
      show: json['show'] as bool,
      available: json['available'] as bool,
      backOrder: json['backOrder'] as bool,
      qty: (json['qty'] as num).toInt(),
      backOrderQty: (json['backOrderQty'] as num).toInt(),
      level: json['level'] as String,
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
    };

_$MediaImpl _$$MediaImplFromJson(Map<String, dynamic> json) => _$MediaImpl(
      thumbnail: json['thumbnail'] == null
          ? null
          : ImageUrl.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
    };

_$ImageUrlImpl _$$ImageUrlImplFromJson(Map<String, dynamic> json) =>
    _$ImageUrlImpl(
      storeSmall: json['storeSmall'] as String,
    );

Map<String, dynamic> _$$ImageUrlImplToJson(_$ImageUrlImpl instance) =>
    <String, dynamic>{
      'storeSmall': instance.storeSmall,
    };

_$PublicTypeImpl _$$PublicTypeImplFromJson(Map<String, dynamic> json) =>
    _$PublicTypeImpl(
      code: json['code'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$$PublicTypeImplToJson(_$PublicTypeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
    };

_$PriceImpl _$$PriceImplFromJson(Map<String, dynamic> json) => _$PriceImpl(
      amount: (json['amount'] as num).toInt(),
      discounted: (json['discounted'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PriceImplToJson(_$PriceImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'discounted': instance.discounted,
    };

_$UnitPriceImpl _$$UnitPriceImplFromJson(Map<String, dynamic> json) =>
    _$UnitPriceImpl(
      amount: (json['amount'] as num).toInt(),
      discounted: (json['discounted'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UnitPriceImplToJson(_$UnitPriceImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'discounted': instance.discounted,
    };

_$UpgradeImpl _$$UpgradeImplFromJson(Map<String, dynamic> json) =>
    _$UpgradeImpl(
      name: json['name'] as String,
      fromShipId: (json['fromShipId'] as num).toInt(),
      toShipId: (json['toShipId'] as num).toInt(),
      toSkuId: (json['toSkuId'] as num).toInt(),
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$$UpgradeImplToJson(_$UpgradeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fromShipId': instance.fromShipId,
      'toShipId': instance.toShipId,
      'toSkuId': instance.toSkuId,
      'thumbnail': instance.thumbnail,
    };
