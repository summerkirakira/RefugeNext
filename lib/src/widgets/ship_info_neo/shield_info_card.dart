import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart'
    show gameItemDisplayName, descValue, kItemClassValueCn;
import 'package:refuge_next/src/widgets/ship_info_neo/shield_detail_page.dart';

/// 护盾信息小卡片,样式仿 [VehicleWeaponInfoCard]:
/// 左侧 wiki 题图,右侧 名称 + 厂商 + 类别标签 + 尺寸/aUEC 价格。
/// 点击默认跳转到 [ShieldDetailPage]。
class ShieldInfoCard extends StatelessWidget {
  const ShieldInfoCard({
    super.key,
    required this.item,
    this.onTap,
  });

  final GameItem item;

  /// 点击回调;为 null 时默认跳转护盾详情页。
  final VoidCallback? onTap;

  void _defaultTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            ShieldDetailPage(initialShield: item, allowSwitch: false),
      ),
    );
  }

  String? _thumbUrl() {
    final images = item.images;
    if (images == null || images.isEmpty) return null;
    final first = images.first;
    return first.thumbnailUrl ?? first.originalUrl;
  }

  /// aUEC:取 UEX 各终端最高购买价。
  num? _auec() {
    num? a;
    for (final p in item.uexPrices?.purchase ?? const <UexPrice>[]) {
      final b = p.priceBuy;
      if (b != null && (a == null || b > a)) a = b;
    }
    return a;
  }

  /// 紧凑 aUEC:≥1e6→x.xM、≥1e3→x.xK、否则整数。
  String _fmtAuec(num v) {
    if (v >= 1e6) return '${(v / 1e6).toStringAsFixed(1)}M';
    if (v >= 1e3) return '${(v / 1e3).toStringAsFixed(1)}K';
    return v.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    final thumbUrl = _thumbUrl();
    final title = gameItemDisplayName(item);
    final cls = descValue(item, 'Class');
    final typeText =
        (cls == null || cls.isEmpty) ? null : (kItemClassValueCn[cls] ?? cls);
    final auec = _auec();
    final tags = <String>[
      if (typeText != null) typeText,
      if (item.blueprint?.isNotEmpty ?? false) '有蓝图',
      if (auec != null) '可购买',
    ];
    final cs = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap ?? () => _defaultTap(context),
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
                child: _thumb(context, thumbUrl),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      if (item.manufacturer?.name != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            item.manufacturer!.name!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[600]),
                          ),
                        ),
                      if (tags.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            children: tags.map((t) => _tagChip(cs, t)).toList(),
                          ),
                        ),
                      const Spacer(),
                      // 左下 尺寸 / 右下 aUEC(主题色)
                      Row(
                        children: [
                          if (item.size != null)
                            Text(
                              '尺寸 ${item.size}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                          const Spacer(),
                          if (auec != null)
                            Text(
                              '${_fmtAuec(auec)} aUEC',
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

  Widget _thumb(BuildContext context, String? url) {
    const radius = BorderRadius.only(
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
    );
    if (url == null) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.12),
          borderRadius: radius,
        ),
        child: Icon(Icons.shield_outlined, color: Colors.grey[400]),
      );
    }
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
        child: Icon(Icons.broken_image_outlined, color: Colors.grey[400]),
      ),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }

  /// 标签 chip:用当前主题色(primary)的浅色调。
  Widget _tagChip(ColorScheme cs, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: cs.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: cs.primary,
        ),
      ),
    );
  }
}
