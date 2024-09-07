import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_model.freezed.dart';
part 'store_model.g.dart';

@freezed
class StoreData with _$StoreData {
  factory StoreData({
    required Store store,
  }) = _StoreData;

  factory StoreData.fromJson(Map<String, dynamic> json) => _$StoreDataFromJson(json);
}

@freezed
class Store with _$Store {
  factory Store({
    required Context context,
    required Cart cart,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}

@freezed
class Context with _$Context {
  factory Context({
    required Pricing pricing,
  }) = _Context;

  factory Context.fromJson(Map<String, dynamic> json) => _$ContextFromJson(json);
}

@freezed
class Pricing with _$Pricing {
  factory Pricing({
    required String currencyCode,
  }) = _Pricing;

  factory Pricing.fromJson(Map<String, dynamic> json) => _$PricingFromJson(json);
}

@freezed
class Cart with _$Cart {
  factory Cart({
    required bool hasRecurring,
    required bool hasDigital,
    required List<LineItem> lineItems,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class LineItem with _$LineItem {
  factory LineItem({
    required String id,
    required String skuId,
    required String? identifier,
    required List<String> taxDescription,
    required Sku sku,
    required UnitPrice unitPriceWithTax,
    required int qty,
    @Default(null) Upgrade? upgrade,
    required List<dynamic> discounts,
  }) = _LineItem;

  factory LineItem.fromJson(Map<String, dynamic> json) => _$LineItemFromJson(json);
}

@freezed
class Sku with _$Sku {
  factory Sku({
    required String id,
    required String productId,
    required String title,
    required String label,
    required String subtitle,
    required String url,
    required String type,
    required String frequency,
    String? isWarbond,
    required bool isPackage,
    required List<GameItem> gameItems,
    required Stock stock,
    required Media media,
    required int maxQty,
    required int minQty,
    required PublicType publicType,
    required Price nativePrice,
    required Price price,
  }) = _Sku;

  factory Sku.fromJson(Map<String, dynamic> json) => _$SkuFromJson(json);
}

@freezed
class GameItem with _$GameItem {
  factory GameItem({
    Specs? specs,
  }) = _GameItem;

  factory GameItem.fromJson(Map<String, dynamic> json) => _$GameItemFromJson(json);
}

@freezed
class Specs with _$Specs {
  factory Specs({
    String? productionStatus,
  }) = _Specs;

  factory Specs.fromJson(Map<String, dynamic> json) => _$SpecsFromJson(json);
}

@freezed
class Stock with _$Stock {
  factory Stock({
    required bool unlimited,
    required bool show,
    required bool available,
    required bool backOrder,
    required int qty,
    required int backOrderQty,
    required String level,
  }) = _Stock;

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
}

@freezed
class Media with _$Media {
  factory Media({
    String? thumbnail,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}

@freezed
class PublicType with _$PublicType {
  factory PublicType({
    required String code,
    required String label,
  }) = _PublicType;

  factory PublicType.fromJson(Map<String, dynamic> json) => _$PublicTypeFromJson(json);
}

@freezed
class Price with _$Price {
  factory Price({
    required int amount,
    int? discounted,
  }) = _Price;

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}

@freezed
class UnitPrice with _$UnitPrice {
  factory UnitPrice({
    required int amount,
    int? discounted,
  }) = _UnitPrice;

  factory UnitPrice.fromJson(Map<String, dynamic> json) => _$UnitPriceFromJson(json);
}

@freezed
class Upgrade with _$Upgrade {
  factory Upgrade({
    required String name,
    required int fromShipId,
    required int toShipId,
    required int toSkuId,
    required String thumbnail,
  }) = _Upgrade;

  factory Upgrade.fromJson(Map<String, dynamic> json) => _$UpgradeFromJson(json);
}
