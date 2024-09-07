import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../../datasource/models/shop/upgrade_ship_info.dart';
import 'package:refuge_next/src/network/graphql/shop/upgrade_add_to_cart.dart';
import 'package:refuge_next/src/network/graphql/shop/cart_summary.dart';
import 'package:refuge_next/src/network/graphql/shop/apply_upgrade_token.dart';



WoltModalSheetPage getUpgradeCheckoutBottomSheet(BuildContext context, UpgradeShipInfo fromShip, UpgradeShipInfo toShip, Skus toSku) {
  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('升级购买',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text('请选择支付方式',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
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
    child: Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("确定要购买以下升级吗？"),
          Text("从 ${fromShip.name} 升级到 ${toShip.name}"),
          Text("升级版本: ${toSku.title}"),
          SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              // hintText: '购买数量',
              labelText: '购买数量',
            ),
          ),

          const SizedBox(height: 200),
        ],
      ),
    ),
    stickyActionBar: Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: SizedBox(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: () async {
            String token = await UpgradeAddToCart(skuId: toSku.id!, fromShipId: fromShip.id!).execute();
            await ApplyUpgradeToken(upgradeToken: token).execute();
            final result = await CartSummary().execute();
            final a = 1;
          },
          child: const Text('确认购买',
              style: TextStyle(
                fontSize: 16,
              )),
        ),
      ),
    ),
  );
}