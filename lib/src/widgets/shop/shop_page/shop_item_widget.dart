import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart';
import 'catalog_detail_bottomsheet.dart' show showCatalogItemDetail;
import 'catalog_price_widgets.dart';

/// Each SKU remains its own card, including Standard and Warbond versions.
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
    return url.startsWith('/') ? 'https://robertsspaceindustries.com$url' : url;
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => showCatalogItemDetail(context, catalogProperty),
        child: Card(
          elevation: 0,
          color: Theme.of(context).cardColor,
          shadowColor: Colors.transparent,
          child: LayoutBuilder(
              builder: (context, constraints) => ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 96),
                    child: IntrinsicHeight(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                                width: (constraints.maxWidth * .34)
                                    .clamp(96.0, 132.0),
                                child: _thumb(context, _thumbUrl)),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(catalogProperty.title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(height: 2),
                                      CatalogBadges(item: catalogProperty),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: CatalogPriceLabel(
                                          item: catalogProperty)),
                                ],
                              ),
                            )),
                          ]),
                    ),
                  )),
        ),
      );

  Widget _thumb(BuildContext context, String url) {
    const radius = BorderRadius.only(
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
    );
    Widget placeholder() => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: radius,
          ),
          child: Icon(Icons.image_outlined,
              color: Theme.of(context).colorScheme.onSurfaceVariant),
        );
    if (url.isEmpty) return placeholder();
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, _) => Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Theme.of(context).primaryColor,
          size: 26,
        ),
      ),
      errorWidget: (context, _, __) => placeholder(),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
