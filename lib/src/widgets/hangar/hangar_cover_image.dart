import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../datasource/models/hangar.dart';

/// 按舰船参考价选择封面；不改变包内顺序或原始图片。
List<String> hangarCoverImageUrls(
  HangarItem item, {
  required bool preferShipImage,
}) {
  bool hasImage(String value) {
    final uri = Uri.tryParse(value.trim());
    return uri != null &&
        (uri.scheme == 'https' || uri.scheme == 'http') &&
        uri.host.isNotEmpty;
  }

  final urls = <String>{};
  if (preferShipImage && !item.isUpgrade) {
    final ships = item.items.asMap().entries.where((entry) {
      return entry.value.kind == 'Ship' && hasImage(entry.value.image);
    }).toList();
    ships.sort((a, b) {
      final byPrice = b.value.price
          .clamp(0, double.infinity)
          .compareTo(a.value.price.clamp(0, double.infinity));
      return byPrice != 0 ? byPrice : a.key.compareTo(b.key);
    });
    urls.addAll(ships.map((entry) => entry.value.image.trim()));
  }
  if (hasImage(item.image)) urls.add(item.image.trim());
  return urls.toList();
}

/// 列表与详情共用的封面：舰船图片依次失败后回退礼包图片。
class HangarCoverImage extends StatelessWidget {
  const HangarCoverImage({
    super.key,
    required this.item,
    this.preferShipImage = false,
    this.width = 100,
    this.height = 100,
    this.borderRadius = BorderRadius.zero,
    this.loadingSize = 30,
  });

  final HangarItem item;
  final bool preferShipImage;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final double loadingSize;

  Widget _image(List<String> urls, int index) {
    if (index >= urls.length) return const Center(child: Icon(Icons.error));
    return CachedNetworkImage(
      key: ValueKey(urls[index]),
      imageUrl: urls[index],
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, _) => Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Theme.of(context).colorScheme.primary,
          size: loadingSize,
        ),
      ),
      errorWidget: (_, __, ___) => _image(urls, index + 1),
    );
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: borderRadius,
          child: _image(
            hangarCoverImageUrls(item, preferShipImage: preferShipImage),
            0,
          ),
        ),
      );
}
