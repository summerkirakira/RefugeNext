import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import './shop_checkout_bottomsheet.dart';


WoltModalSheetPage getCatalogItemDetailSheet(BuildContext modelSheetContext, CatalogProperty catalogProperty, BuildContext context) {
  return WoltModalSheetPage(
    navBarHeight: 10,
    heroImage: Container(
        height: 160,
        width: double.infinity,
        child: CachedNetworkImage(
            imageUrl: catalogProperty.media.thumbnail.slideshow.startsWith('/') ? 'https://robertsspaceindustries.com${catalogProperty.media.thumbnail.storeSmall}' : catalogProperty.media.thumbnail.slideshow,
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(0))),
            ))),
    child: Container(
      child: Column(
        children: [

          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(catalogProperty.name, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                SizedBox(height: 10,),
                if (catalogProperty.excerpt != null)
                  Text(catalogProperty.excerpt!, style: TextStyle(fontSize: 16)),
                // Text('Price: \$${catalogProperty.nativePrice.amount / 100}', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          SizedBox(height: 100,)
        ],
      ),
    ),
    stickyActionBar: Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {

            final page = getCatalogCheckoutBottomSheet(modelSheetContext, catalogProperty, context);
            WoltModalSheet.of(modelSheetContext).addPage(page);
            WoltModalSheet.of(modelSheetContext).showNext();
          },
          child: Text('确认购买'),
        ),
      ),
    ),
  );
}