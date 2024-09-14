import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter/material.dart';
import '../../../datasource/models/shop/upgrade_ship_info.dart';
import 'package:cached_network_image/cached_network_image.dart';

List<int> getSkuPrice(UpgradeShipInfo ship) {
  int leastPrice = 0;
  int mostPrice = 0;

  for (var sku in ship.skus!) {
    if (sku.price! < leastPrice || leastPrice == 0) {
      leastPrice = sku.price!;
    }
    if (sku.price! > mostPrice) {
      mostPrice = sku.price!;
    }
  }

  if (ship.shipAlias != null) {
    return [leastPrice ~/ 100, ship.shipAlias!.getHighestSku() ~/ 100];
  }

  return [leastPrice ~/ 100, mostPrice ~/ 100];
}

class ShipItem extends StatelessWidget {
  final UpgradeShipInfo ship;
  final Function(UpgradeShipInfo) onSelected;
  bool isFromShip = false;

  ShipItem(this.ship, this.onSelected, this.isFromShip);

  Widget getPriceWidget(BuildContext context) {
    if (ship.skus == null) {
      if (ship.shipAlias != null) {
        return Row(
          children: [
            Text('\$',
                style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor)),
            Text(
              (ship.shipAlias!.getHighestSku() ~/ 100).toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        );
      }
      return const Text('无价格');
    }
    if (!isFromShip && ship.skus != null && ship.skus!.length > 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (ship.skus != null && ship.skus!.length > 1)
            Row(
              children: [
                Text(
                  '\$${getSkuPrice(ship)[1]}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                    decoration: TextDecoration.lineThrough,
                  ),

                ),
              ],
            ),
          Row(
            children: [
              Text('\$',
                  style: TextStyle(
                      fontSize: 12, color: Theme.of(context).hintColor)),
              Text(
                getSkuPrice(ship)[0].toString(),
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Text('\$',
              style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor)),
          Text(
            getSkuPrice(ship)[1].toString(),
            style: TextStyle(fontSize: 20),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(ship);
      },
      child: Stack(
        children: [
          Card(
              elevation: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 80,
                      width: 120,
                      child: CachedNetworkImage(
                          imageUrl: ship.medias!.productThumbMediumAndSmall!,
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
                                )),
                          ))),
                  Container(
                    // width: 240,
                    height: 80,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 2, right: 10, bottom: 0
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (ship.skus != null && ship.skus!.length > 1)
                              Text(ship.chineseName,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    color: Colors.orange
                                  ))
                            else
                              Text(ship.chineseName,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                  )),
                            Text(ship.focus!, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                            Spacer(),
                            Padding(padding: const EdgeInsets.all(0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    getPriceWidget(context),
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          // if (ship.skus != null && ship.skus!.length > 1)
          //   Positioned(
          //     right: 0,
          //     bottom: 0,
          //     child: Container(
          //       // decoration: BoxDecoration(
          //       //   color: Colors.orange, // 设置背景颜色
          //       //   shape: BoxShape.rectangle, // 设置形状为圆形
          //       // ),
          //       child: Icon(
          //         Icons.sell,
          //         color: Colors.orange,
          //         size: 30,
          //       ),
          //     ),
          //   )
        ],
      ),
    );
  }
}

Widget getPageTitle(bool isFromShip) {
  if (isFromShip) {
    return const Padding(
        padding: EdgeInsets.only(left: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('请选择起始舰船',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ],
        ));
  } else {
    return const Padding(
        padding: EdgeInsets.only(left: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('请选择目标舰船',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ],
        ));
  }
}

WoltModalSheetPage getShipSelectBottomSheet(
    BuildContext context,
    List<UpgradeShipInfo> ships,
    Function(UpgradeShipInfo) onSelected,
    bool isFromShip) {
  return WoltModalSheetPage(
      navBarHeight: 50,
      pageTitle: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getPageTitle(isFromShip)
            ],
          )),
      trailingNavBarWidget: Container(
        height: 38,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2), // 设置背景颜色
          shape: BoxShape.circle, // 设置形状为圆形
        ),
        child: IconButton(
          padding: const EdgeInsets.all(5),
          icon: const Icon(Icons.close, size: 22),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            for (var ship in ships) ShipItem(ship, onSelected, isFromShip),
            if (ships.length < 3)
              const SizedBox(
                height: 100,
              )
          ],
        ),
      ));
}
