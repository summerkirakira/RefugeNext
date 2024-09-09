import 'package:freezed_annotation/freezed_annotation.dart';

part 'stepper_query_property.freezed.dart';
part 'stepper_query_property.g.dart';

@freezed
class StepperQueryProperty with _$StepperQueryProperty {
  factory StepperQueryProperty({
    required Store store,
  }) = _StepperQueryProperty;

  factory StepperQueryProperty.fromJson(Map<String, dynamic> json) => _$StepperQueryPropertyFromJson(json);
}

@freezed
class Store with _$Store {
  factory Store({
    required StoreContext context,
    required Cart cart,
    required Order order,
    @Default('TyStore') String typeName,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}

@freezed
class StoreContext with _$StoreContext {
  factory StoreContext({
    required PricingContext pricing,
    @Default('StoreContext') String typeName,
  }) = _StoreContext;

  factory StoreContext.fromJson(Map<String, dynamic> json) => _$StoreContextFromJson(json);
}

@freezed
class PricingContext with _$PricingContext {
  factory PricingContext({
    required String currencyCode,
    @Default('PricingContext') String typeName,
  }) = _PricingContext;

  factory PricingContext.fromJson(Map<String, dynamic> json) => _$PricingContextFromJson(json);
}

@freezed
class Cart with _$Cart {
  factory Cart({
    required bool hasRecurring,
    required int lineItemsQties,
    // required List<CartLineItem> lineItems,
    required CheckoutFlow flow,
    @Default('TyShoppingCart') String typeName,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class CartLineItem with _$CartLineItem {
  factory CartLineItem({
    required String id,
    required String skuId,
    String? identifier,
    @Default([]) List<String> taxDescription,
    required Sku sku,
    required BrowsePrice unitPriceWithTax,
    required int qty,
    @Default([]) List<dynamic> discounts,
    @Default('BaseCartLineItem') String typeName,
  }) = _CartLineItem;

  factory CartLineItem.fromJson(Map<String, dynamic> json) => _$CartLineItemFromJson(json);
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
    bool? isWarbond,
    @Default(false) bool isPackage,
    @Default([]) List<BaseGameItem> gameItems,
    required Stock stock,
    required ItemMedia media,
    required int maxQty,
    required int minQty,
    required SkuPublicType publicType,
    required BrowsePrice nativePrice,
    required BrowseTaxedPrice price,
    @Default('TySku') String typeName,
  }) = _Sku;

  factory Sku.fromJson(Map<String, dynamic> json) => _$SkuFromJson(json);
}

@freezed
class BaseGameItem with _$BaseGameItem {
  factory BaseGameItem({
    @Default('BaseGameItem') String typeName,
  }) = _BaseGameItem;

  factory BaseGameItem.fromJson(Map<String, dynamic> json) => _$BaseGameItemFromJson(json);
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
    @Default('TyStock') String typeName,
  }) = _Stock;

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
}

@freezed
class ItemMedia with _$ItemMedia {
  factory ItemMedia({
    required ItemMediaDerived thumbnail,
    @Default('TyItemMedia') String typeName,
  }) = _ItemMedia;

  factory ItemMedia.fromJson(Map<String, dynamic> json) => _$ItemMediaFromJson(json);
}

@freezed
class ItemMediaDerived with _$ItemMediaDerived {
  factory ItemMediaDerived({
    required String storeSmall,
    @Default('TyItemMediaDerived') String typeName,
  }) = _ItemMediaDerived;

  factory ItemMediaDerived.fromJson(Map<String, dynamic> json) => _$ItemMediaDerivedFromJson(json);
}

@freezed
class SkuPublicType with _$SkuPublicType {
  factory SkuPublicType({
    required String code,
    required String label,
    @Default('SkuPublicType') String typeName,
  }) = _SkuPublicType;

  factory SkuPublicType.fromJson(Map<String, dynamic> json) => _$SkuPublicTypeFromJson(json);
}

@freezed
class BrowsePrice with _$BrowsePrice {
  factory BrowsePrice({
    required int amount,
    int? discounted,
    @Default('TyBrowsePrice') String typeName,
  }) = _BrowsePrice;

  factory BrowsePrice.fromJson(Map<String, dynamic> json) => _$BrowsePriceFromJson(json);
}

@freezed
class BrowseTaxedPrice with _$BrowseTaxedPrice {
  factory BrowseTaxedPrice({
    required int amount,
    int? discounted,
    @Default([]) List<String> taxDescription,
    @Default('TyBrowseTaxedPrice') String typeName,
  }) = _BrowseTaxedPrice;

  factory BrowseTaxedPrice.fromJson(Map<String, dynamic> json) => _$BrowseTaxedPriceFromJson(json);
}

@freezed
class CheckoutFlow with _$CheckoutFlow {
  factory CheckoutFlow({
    required List<CartStep> steps,
    required Current current,
    @Default('TyCheckoutFlow') String typeName,
  }) = _CheckoutFlow;

  factory CheckoutFlow.fromJson(Map<String, dynamic> json) => _$CheckoutFlowFromJson(json);
}

@freezed
class Current with _$Current {
  factory Current({
    required bool orderCreated,
  }) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);
}

@freezed
class CartStep with _$CartStep {
  factory CartStep({
    required String step,
    String? action,
    @Default(false) bool finalStep,
    @Default(false) bool active,
    bool? orderCreated,
    @Default('TyCartStep') String typeName,
  }) = _CartStep;

  factory CartStep.fromJson(Map<String, dynamic> json) => _$CartStepFromJson(json);
}

@freezed
class Order with _$Order {
  factory Order({
    required String slug,
    @Default('TyOrder') String typeName,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}