import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:refuge_next/src/network/graphql/shop/add_cart_item.dart';
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart' show CatalogTypes;
import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/funcs/shop/cart.dart' show addCatalogToCart;
import '../cart/cart.dart' show showCartBottomSheet;



WoltModalSheetPage getCatalogCheckoutBottomSheet(BuildContext context, CatalogProperty catalogProperty, BuildContext rootContext) {

  String numberString = '';

  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('商品购买',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text('请选择支付方式',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
          ],
        )),
    leadingNavBarWidget: Container(
      height: 38,
      width: 38,
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2), // 设置背景颜色
        shape: BoxShape.circle, // 设置形状为圆形
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: const Icon(Icons.arrow_back, size: 22),
        onPressed: () => WoltModalSheet.of(context).showAtIndex(0),
      ),
    ),
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
          const Text("确定要购买以下物品吗？"),
          Text("物品名称: ${catalogProperty.title}"),
          Text("物品价格: \$${catalogProperty.nativePrice.amount / 100}"),
          SizedBox(height: 20),
          Text("注意：由于商店限制，若购买数量大于5，将会执行自动购买操作"),
          SizedBox(height: 20),
          TextField(
            onChanged: (value) {
              numberString = value;
            },
            decoration: const InputDecoration(
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
            int? number = int.tryParse(numberString);
            if (number == null) {
              showToast(message: "请输入正确的购买数量");
              return;
            }
            if (number > 5) {
              showToast(message: "购买数量不能大于5");
              return;
            }
            if (number <= 0) {
              showToast(message: "购买数量不能小于1");
              return;
            }

            try {
              await addCatalogToCart(catalogProperty, number);
            } catch (e) {
              showToast(message: "购买失败: $e");
              return;
            }

            Navigator.of(context).pop();

            await showCartBottomSheet(rootContext);


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