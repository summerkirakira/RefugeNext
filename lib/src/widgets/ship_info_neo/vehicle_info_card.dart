import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/ship_alias.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/vehicle_detail_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/vehicle_thumbnail.dart';

/// 舰船信息小卡片(AI `show_item_card` 的渲染单元)。
///
/// 样式参照机库卡片:左侧 wiki 题图缩略图,右侧 舰船名 + 厂商 +
/// 定位/尺寸标签 + 价格。点击默认跳转到 [VehicleDetailPage]。
class VehicleInfoCard extends StatelessWidget {
  const VehicleInfoCard({
    super.key,
    required this.vehicle,
    this.onTap,
  });

  final GameVehicle vehicle;

  /// 点击回调;为 null 时默认跳转载具详情页。
  final VoidCallback? onTap;

  void _defaultTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            VehicleDetailPage(initialVehicle: vehicle, allowSwitch: false),
      ),
    );
  }

  /// 美元价:取最高 SKU 价,回退 msrp;ShipPriceDisplay 以「分」计价故 ×100。
  int? _usdCents() {
    num? usd;
    final skus = vehicle.skus;
    if (skus != null) {
      for (final sku in skus) {
        final price = sku.price;
        if (price != null && (usd == null || price > usd)) {
          usd = price;
        }
      }
    }
    usd ??= vehicle.msrp;
    return usd == null ? null : (usd * 100).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final v = vehicle;
    final thumbUrl = vehicleThumbnailUrl(v, small: true);
    final title =
        ShipAliasRepo().getShipAliasSync(v.name ?? '')?.chineseName ??
            v.name ??
            '未知';
    final tags = <String>[
      if (v.career != null) v.career!,
      if (v.role != null) v.role!,
    ];
    final usdCents = _usdCents();
    final cs = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap ?? () => _defaultTap(context),
      child: SizedBox(
        height: 104,
        child: Card(
          elevation: 0,
          color: Theme.of(context).cardColor,
          shadowColor: Colors.transparent,
          child: Row(
            children: [
              SizedBox(
                width: 132,
                height: 104,
                child: _thumb(context, thumbUrl),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
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
                      if (v.manufacturer?.name != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            v.manufacturer!.name!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 13, color: Colors.grey[600]),
                          ),
                        ),
                      // 定位标签:厂商下一行
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
                      // 价格:底部靠右
                      if (usdCents != null)
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '\$${(usdCents / 100).round()}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade700,
                            ),
                          ),
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
        child: Icon(Icons.rocket_launch_outlined, color: Colors.grey[400]),
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
