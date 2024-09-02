import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../datasource/models/hangar.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';



class PriceWidget extends StatelessWidget {
  final int price;
  final int currentPrice;

  const PriceWidget({
    super.key,
    required this.price,
    required this.currentPrice,
  });

  Widget priceWidget(BuildContext context) {
    return Row(
      children: [
        Text('\$', style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor)),
        Text(
          price.toString(),
          style: TextStyle(
              fontSize: 20
          ),
        ),
      ],
    );
  }


  Widget? currentPriceWidget(BuildContext context) {
    if (price > 0) {
      return Row(
        children: [
          Text(
            '\$${currentPrice.toString()}',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).hintColor,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          Text(
            ' (${((currentPrice - price) / price * 100).toStringAsFixed(2)}%)',
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).hintColor,
            ),
          ),
        ],
      );
    } else {
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        currentPriceWidget(context) ?? Container(),
        priceWidget(context),
      ],
    );
  }
}



class TagWidget extends StatelessWidget {
  final HangarItem hangarItem;

  const TagWidget({
    super.key,
    required this.hangarItem,
  });

  bool get isWarbond => hangarItem.name.toLowerCase().contains('warbond');

  bool get isCCU => hangarItem.isUpgrade;

  bool get isGifted => hangarItem.status.toLowerCase().contains('gifted');

  bool get canGift => hangarItem.canGit;

  bool get isReclaimable => hangarItem.canReclaim;

  Color get warbondColor => isWarbond ? Colors.red : Colors.grey;

  Color get ccuColor => isCCU ? Colors.blue : Colors.grey;

  Color get giftedColor => isGifted ? Colors.green : Colors.grey;

  Color get canGiftColor => canGift ? Colors.pink : Colors.grey;

  Color get reclaimableColor => isReclaimable ? Colors.orange : Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 0,
        right: 0,
        top: 4,
        bottom: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.local_offer,
            size: 20,
            color: warbondColor,
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.switch_access_shortcut,
            size: 20,
            color: ccuColor,
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.card_giftcard,
            size: 20,
            color: canGiftColor,
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.recycling,
            size: 20,
            color: reclaimableColor,
          ),
        ],
      ),
    );
  }
}


class HangarItemImageWidget extends StatelessWidget {
  final HangarItem hangarItem;

  const HangarItemImageWidget({
    super.key,
    required this.hangarItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Stack(
        children: [
          CachedNetworkImage(
              imageUrl: hangarItem.image,
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

          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                ),
              ),
              child: Text(
                "x${hangarItem.number}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),

          if (hangarItem.insurance.isNotEmpty)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                child: Text(
                  hangarItem.insurance,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
        ],
      )
    );
  }
}



class HangarItemWidget extends StatelessWidget {
  final HangarItem hangarItem;
  final Function(HangarItem) onTap;

  const HangarItemWidget({
    super.key,
    required this.hangarItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(hangarItem),
      child: Container(
        height: 108,
        child: Card(
          elevation: 0.6,
          color: Theme.of(context).cardColor,
          shadowColor: Colors.transparent,
          child: Row(
            children: [
              Container(
                  width: 100,
                  height: 100,
                  child: HangarItemImageWidget(hangarItem: hangarItem)
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 2,
                    bottom: 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hangarItem.chineseName!, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PriceWidget(
                            price: hangarItem.price,
                            currentPrice: hangarItem.currentPrice,
                          ),
                          Spacer(),
                          Column(
                            children: [
                              TagWidget(hangarItem: hangarItem),
                              Text(hangarItem.date),
                            ],
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
}