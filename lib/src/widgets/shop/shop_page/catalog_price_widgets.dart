import 'package:flutter/material.dart';
import '../../../datasource/models/shop/catalog_property.dart';
import '../../../funcs/shop/catalog_price.dart';
import '../../../repo/shop_catalog_cache.dart';
import '../../../repo/translation.dart';

class CatalogBadges extends StatelessWidget {
  const CatalogBadges({super.key, required this.item});
  final CatalogProperty item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final dark = Theme.of(context).brightness == Brightness.dark;
    final accent = dark ? Colors.orange.shade200 : Colors.orange.shade900;
    final price = CatalogPrice.forItem(item);
    final labels = <String, Color>{
      if (item.isWarbond) '战争债券': accent,
      if (price.savingsPercent case final percent?)
        '省 $percent%': colors.primary,
      if (item.subtitle.isNotEmpty)
        TranslationRepo().getTranslationSync(item.subtitle): colors.primary,
      if (item.isPackage) '组合包': colors.primary,
    };
    for (final tag in ShopCatalogCache().tagsFor(item.id)) {
      if (labels.length >= 3) break;
      final label = TranslationRepo().getTranslationSync(tag);
      if (label.toLowerCase() == 'warbond' || label == '战争债券') continue;
      labels.putIfAbsent(label, () => colors.onSurfaceVariant);
    }
    return Wrap(spacing: 6, runSpacing: 4, children: [
      for (final entry in labels.entries)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
          decoration: BoxDecoration(
            color: entry.value.withValues(alpha: dark ? .14 : .08),
            border: Border.all(color: entry.value.withValues(alpha: .2)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(entry.key,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              strutStyle: const StrutStyle(
                  fontSize: 12, height: 1.2, forceStrutHeight: true),
              style: TextStyle(
                  fontSize: 12,
                  height: 1.2,
                  fontWeight: FontWeight.w500,
                  color: entry.value)),
        ),
    ]);
  }
}

class CatalogPriceLabel extends StatelessWidget {
  const CatalogPriceLabel({super.key, required this.item, this.large = false});
  final CatalogProperty item;
  final bool large;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final price = CatalogPrice.forItem(item);
    return Wrap(
      spacing: 8,
      runSpacing: 2,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(catalogMoney(price.current),
            style: TextStyle(
                fontSize: large ? 24 : 16,
                fontWeight: FontWeight.bold,
                color: colors.primary)),
        if (price.hasDiscount)
          Text(catalogMoney(price.original),
              semanticsLabel: '原价 ${catalogMoney(price.original)}',
              style: TextStyle(
                  fontSize: large ? 14 : 12,
                  color: colors.onSurface.withValues(alpha: .55),
                  decoration: TextDecoration.lineThrough)),
      ],
    );
  }
}
