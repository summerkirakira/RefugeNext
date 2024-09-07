import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart';


String priceString(int price) {
  if (price % 100 == 0) {
    return (price ~/ 100).toString();
  } else {
    return (price / 100).toStringAsFixed(2);
  }
}


class ShopItemImageWidget extends StatelessWidget {
  final CatalogProperty catalogProperty;

  const ShopItemImageWidget({
    super.key,
    required this.catalogProperty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 140,
        height: 80,
        child: Stack(
          children: [
            CachedNetworkImage(
                imageUrl: catalogProperty.media.thumbnail.storeSmall.startsWith('/') ? 'https://robertsspaceindustries.com${catalogProperty.media.thumbnail.storeSmall}' : catalogProperty.media.thumbnail.storeSmall,
                placeholder: (context, url) => LoadingAnimationWidget.fourRotatingDots(color: Theme.of(context).indicatorColor, size: 60),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      )
                  ),
                )
            ),
            if (catalogProperty.isWarbond)
              Positioned(child: Container(
                width: 140,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
              )),
          ],
        )
    );
  }
}


class ShopItemWidget extends StatelessWidget {
  final CatalogProperty catalogProperty;
  final CatalogTypes catalogTypes;

  const ShopItemWidget({
    Key? key,
    required this.catalogProperty,
    required this.catalogTypes,
  }) : super(key: key);

  Widget priceWidget(BuildContext context, int price) {
    return Row(
      children: [
        Text('\$', style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor)),
        Text(
          priceString(price),
          style: TextStyle(
              fontSize: 20
          ),
        ),
      ],
    );
  }

  Widget? currentPriceWidget(BuildContext context, int price, int currentPrice) {
    if (price > 0 || currentPrice > 0) {
      return Row(
        children: [
          Text(
            '\$${priceString(currentPrice)}',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).hintColor,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          Text(
            ' (${((price - currentPrice) / currentPrice * 100).toStringAsFixed(2)}%)',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).hintColor,
            ),
          ),
        ],
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShopItemImageWidget(catalogProperty: catalogProperty,),
              SizedBox(width: 10),
              Expanded(child: Text(catalogProperty.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            ],
          ),
        ),
        Positioned(
          right: 20,
          bottom: 0,
          child: priceWidget(context, catalogProperty.nativePrice.amount),
        )
      ],
    );
  }
}