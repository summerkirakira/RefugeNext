import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../datasource/models/hangar.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


String priceString(int price) {
  if (price % 100 == 0) {
    return (price ~/ 100).toString();
  } else {
    return (price / 100).toStringAsFixed(2);
  }
}


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
          priceString(price),
          style: const TextStyle(
              fontSize: 20
          ),
        ),
        // SizedBox(width: 5),
        // Text('\$', style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor)),
        // Text(
        //   priceString(price),
        //   style: TextStyle(
        //       fontSize: 20,
        //     color: Theme.of(context).primaryColor,
        //   ),
        // ),
      ],
    );
  }


  Widget? currentPriceWidget(BuildContext context) {
    if (price > 0 || currentPrice > 0) {
      return Row(
        children: [
          Text(
            '\$${priceString(currentPrice)}',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).primaryColor,
              // decoration: TextDecoration.lineThrough,
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

  Color get warbondColor => isWarbond ? Colors.orange : Colors.grey;

  Color get ccuColor => isCCU ? Colors.blue : Colors.grey;

  Color get giftedColor => isGifted ? Colors.green : Colors.grey;

  Color get canGiftColor => canGift ? Colors.pink : Colors.grey;

  Color get reclaimableColor => isReclaimable ? Colors.green : Colors.grey;

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
            Icons.keyboard_double_arrow_up_outlined,
            size: 24,
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
  final Function(HangarItem, BuildContext) onTap;

  const HangarItemWidget({
    super.key,
    required this.hangarItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(hangarItem, context),
      child: Container(
        height: 108,
        child: Card(
          elevation: 0,
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
                      Text(hangarItem.chineseName!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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