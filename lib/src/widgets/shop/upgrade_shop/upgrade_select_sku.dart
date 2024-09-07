import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../../datasource/models/shop/upgrade_ship_info.dart';


WoltModalSheetPage getSelectSkuBottomSheet(BuildContext context, UpgradeShipInfo ship, Function(Skus) onSelected) {
  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('请选择要升级到的版本',
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
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          for (var sku in ship.skus!)
            ListTile(
              title: Text(sku.title!),
              subtitle: Text('价格: \$${sku.price! ~/ 100}'),
              onTap: () {
                onSelected(sku);
              },
            ),
        ],
      ),
    ),
  );
}