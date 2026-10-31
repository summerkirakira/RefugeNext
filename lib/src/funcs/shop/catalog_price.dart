import '../../datasource/models/shop/catalog_property.dart';
import '../../repo/shop_catalog_cache.dart';

/// Catalog prices are USD cents, before checkout adjustments.
class CatalogPrice {
  CatalogPrice({required this.original, int? discounted})
      : current = discounted != null && discounted >= 0 && discounted < original
            ? discounted
            : original;

  factory CatalogPrice.forItem(CatalogProperty item) => CatalogPrice(
      original: item.nativePrice.amount,
      discounted: ShopCatalogCache().discountedFor(item.id));

  final int original;
  final int current;
  bool get hasDiscount => current < original;
  int? get savingsPercent => hasDiscount && original > 0
      ? ((original - current) * 100 / original).round()
      : null;
}

String catalogMoney(int amount) =>
    '\$${amount % 100 == 0 ? amount ~/ 100 : (amount / 100).toStringAsFixed(2)}';
