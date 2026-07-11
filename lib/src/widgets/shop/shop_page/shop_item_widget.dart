import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart';
import 'package:refuge_next/src/repo/shop_catalog_cache.dart';
import 'package:refuge_next/src/repo/translation.dart';
import 'catalog_detail_bottomsheet.dart' show getCatalogItemDetailSheet;
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

String priceString(int price) {
  if (price % 100 == 0) {
    return (price ~/ 100).toString();
  } else {
    return (price / 100).toStringAsFixed(2);
  }
}

/// 商店商品卡片,样式对齐数据库卡(如 `ShieldInfoCard`):
/// 左侧 132 宽圆角题图,右侧 标题 + 副标题 + 标签 chips + 底部价格行。
/// 点击弹出原详情 `WoltModalSheet`。
class ShopItemWidget extends StatelessWidget {
  final CatalogProperty catalogProperty;
  final CatalogTypes catalogTypes;

  const ShopItemWidget({
    super.key,
    required this.catalogProperty,
    required this.catalogTypes,
  });

  String get _thumbUrl {
    final url = catalogProperty.media.thumbnail.storeSmall;
    return url.startsWith('/')
        ? 'https://robertsspaceindustries.com$url'
        : url;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final subtitle = catalogProperty.subtitle;
    // 分类副标题(如 Standalone Ships)译成中文,未命中回退原文。
    final subtitleCn =
        subtitle.isEmpty ? '' : TranslationRepo().getTranslationSync(subtitle);
    final current = catalogProperty.nativePrice.amount;
    final cache = ShopCatalogCache();
    // discounted 视为促销时的更高原价;仅当其 > 现价才展示划线原价(联调可对调)。
    final disc = cache.discountedFor(catalogProperty.id);
    final hasDiscount = disc != null && disc > current;

    // 分类 + 状态标签 + RSI 原生标签;总数限制在 3 个以内,避免卡片高度溢出。
    final statusCount =
        (catalogProperty.isWarbond ? 1 : 0) + (catalogProperty.isPackage ? 1 : 0);
    final subtitleCount = subtitleCn.isEmpty ? 0 : 1;
    final rsiTags = cache
        .tagsFor(catalogProperty.id)
        .take((3 - statusCount - subtitleCount).clamp(0, 3))
        .toList();
    final chips = <Widget>[
      if (subtitleCn.isNotEmpty) _tagChip(cs.primary, subtitleCn),
      if (catalogProperty.isWarbond) _tagChip(Colors.orange, '战争债券'),
      if (catalogProperty.isPackage) _tagChip(cs.primary, '组合包'),
      for (final t in rsiTags) _tagChip(Colors.grey, t),
    ];

    return GestureDetector(
      onTap: () {
        WoltModalSheet.show<void>(
            context: context,
            pageListBuilder: (modalSheetContext) {
              return [
                getCatalogItemDetailSheet(
                    modalSheetContext, catalogProperty, context),
              ];
            });
      },
      child: SizedBox(
        height: 118,
        child: Card(
          elevation: 0,
          color: Theme.of(context).cardColor,
          shadowColor: Colors.transparent,
          child: Row(
            children: [
              SizedBox(
                width: 132,
                height: 118,
                child: _thumb(context, _thumbUrl),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catalogProperty.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      if (chips.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            children: chips,
                          ),
                        ),
                      const Spacer(),
                      // 左下 原价划线 + 折扣% / 右下 现价(主题色)
                      Row(
                        children: [
                          if (hasDiscount) ...[
                            Text(
                              '\$${priceString(disc)}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '-${((disc - current) / disc * 100).round()}%',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                          const Spacer(),
                          Text(
                            '\$${priceString(current)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: cs.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _thumb(BuildContext context, String url) {
    const radius = BorderRadius.only(
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
    );
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, _) => Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Theme.of(context).primaryColor,
          size: 26,
        ),
      ),
      errorWidget: (context, _, __) => Container(
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.12),
          borderRadius: radius,
        ),
        child: Icon(Icons.image_outlined, color: Colors.grey[400]),
      ),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }

  /// 标签 chip:用传入色的浅色调底 + 同色文字(仿数据库卡)。
  Widget _tagChip(Color color, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
