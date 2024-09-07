// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatalogPropertyImpl _$$CatalogPropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$CatalogPropertyImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      url: json['url'] as String,
      excerpt: json['excerpt'] as String?,
      type: json['type'] as String,
      media: Media.fromJson(json['media'] as Map<String, dynamic>),
      price: Price.fromJson(json['price'] as Map<String, dynamic>),
      stock: Stock.fromJson(json['stock'] as Map<String, dynamic>),
      nativePrice:
          NativePrice.fromJson(json['nativePrice'] as Map<String, dynamic>),
      isWarbond: json['isWarbond'] as bool,
      isPackage: json['isPackage'] as bool,
      isVip: json['isVip'] as bool,
    );

Map<String, dynamic> _$$CatalogPropertyImplToJson(
        _$CatalogPropertyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'url': instance.url,
      'excerpt': instance.excerpt,
      'type': instance.type,
      'media': instance.media,
      'price': instance.price,
      'stock': instance.stock,
      'nativePrice': instance.nativePrice,
      'isWarbond': instance.isWarbond,
      'isPackage': instance.isPackage,
      'isVip': instance.isVip,
    };

_$MediaImpl _$$MediaImplFromJson(Map<String, dynamic> json) => _$MediaImpl(
      thumbnail: ImageUrl.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
    };

_$ImageUrlImpl _$$ImageUrlImplFromJson(Map<String, dynamic> json) =>
    _$ImageUrlImpl(
      slideshow: json['slideshow'] as String,
      storeSmall: json['storeSmall'] as String,
    );

Map<String, dynamic> _$$ImageUrlImplToJson(_$ImageUrlImpl instance) =>
    <String, dynamic>{
      'slideshow': instance.slideshow,
      'storeSmall': instance.storeSmall,
    };

_$PriceImpl _$$PriceImplFromJson(Map<String, dynamic> json) => _$PriceImpl(
      amount: (json['amount'] as num).toInt(),
      taxDescription: (json['taxDescription'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$PriceImplToJson(_$PriceImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'taxDescription': instance.taxDescription,
    };

_$StockImpl _$$StockImplFromJson(Map<String, dynamic> json) => _$StockImpl(
      unlimited: json['unlimited'] as bool,
      show: json['show'] as bool,
    );

Map<String, dynamic> _$$StockImplToJson(_$StockImpl instance) =>
    <String, dynamic>{
      'unlimited': instance.unlimited,
      'show': instance.show,
    };

_$NativePriceImpl _$$NativePriceImplFromJson(Map<String, dynamic> json) =>
    _$NativePriceImpl(
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$$NativePriceImplToJson(_$NativePriceImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
    };

_$CatalogResponseImpl _$$CatalogResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CatalogResponseImpl(
      data: CatalogData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CatalogResponseImplToJson(
        _$CatalogResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$CatalogDataImpl _$$CatalogDataImplFromJson(Map<String, dynamic> json) =>
    _$CatalogDataImpl(
      store: Store.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CatalogDataImplToJson(_$CatalogDataImpl instance) =>
    <String, dynamic>{
      'store': instance.store,
    };

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
      listing: Listing.fromJson(json['listing'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      'listing': instance.listing,
    };

_$ListingImpl _$$ListingImplFromJson(Map<String, dynamic> json) =>
    _$ListingImpl(
      resources: (json['resources'] as List<dynamic>)
          .map((e) => CatalogProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListingImplToJson(_$ListingImpl instance) =>
    <String, dynamic>{
      'resources': instance.resources,
    };
