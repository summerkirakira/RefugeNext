import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_property.freezed.dart';
part 'catalog_property.g.dart';

@freezed
class CatalogProperty with _$CatalogProperty {
  const factory CatalogProperty({
    required String id,
    required String name,
    required String title,
    required String subtitle,
    required String url,
    String? excerpt,
    required String type,
    required Media media,
    required Price price,
    required Stock stock,
    required NativePrice nativePrice,
    required bool isWarbond,
    required bool isPackage,
    required bool isVip,
  }) = _CatalogProperty;

  factory CatalogProperty.fromJson(Map<String, dynamic> json) => _$CatalogPropertyFromJson(json);
}

@freezed
class Media with _$Media {
  const factory Media({
    required ImageUrl thumbnail,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}

@freezed
class ImageUrl with _$ImageUrl {
  const factory ImageUrl({
    required String slideshow,
    required String storeSmall,
  }) = _ImageUrl;

  factory ImageUrl.fromJson(Map<String, dynamic> json) => _$ImageUrlFromJson(json);
}

@freezed
class Price with _$Price {
  const factory Price({
    required int amount,
    required List<String> taxDescription,
  }) = _Price;

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}

@freezed
class Stock with _$Stock {
  const factory Stock({
    required bool unlimited,
    required bool show,
  }) = _Stock;

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
}

@freezed
class NativePrice with _$NativePrice {
  const factory NativePrice({
    required int amount,
  }) = _NativePrice;

  factory NativePrice.fromJson(Map<String, dynamic> json) => _$NativePriceFromJson(json);
}

@freezed
class CatalogResponse with _$CatalogResponse {
  const factory CatalogResponse({
    required CatalogData data,
  }) = _CatalogResponse;

  factory CatalogResponse.fromJson(Map<String, dynamic> json) => _$CatalogResponseFromJson(json);
}

@freezed
class CatalogData with _$CatalogData {
  const factory CatalogData({
    required Store store,
  }) = _CatalogData;

  factory CatalogData.fromJson(Map<String, dynamic> json) => _$CatalogDataFromJson(json);
}

@freezed
class Store with _$Store {
  const factory Store({
    required Listing listing,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}

@freezed
class Listing with _$Listing {
  const factory Listing({
    required List<CatalogProperty> resources,
  }) = _Listing;

  factory Listing.fromJson(Map<String, dynamic> json) => _$ListingFromJson(json);
}
