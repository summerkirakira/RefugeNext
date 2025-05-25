import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../../datasource/data_model.dart';
import '../../../datasource/models/shop/upgrade_ship_info.dart';
import 'package:refuge_next/src/network/graphql/shop/upgrade_add_to_cart.dart';
import 'package:refuge_next/src/network/graphql/shop/cart_summary.dart';
import 'package:refuge_next/src/network/graphql/shop/apply_upgrade_token.dart';
import '../../../funcs/shop/upgrades.dart';
import '../../../funcs/validation.dart';
import '../../webview/rsi_webpage.dart';
import '../cart/cart.dart';
// import 'package:refuge_next/src/funcs/shop/cart.dart';
// import 'package:refuge_next/src/network/graphql/shop/step1query.dart';
// import 'package:refuge_next/src/network/graphql/shop/credit_query.dart';

String convertVersionNameToChinese(String? version) {
  if (version == null) {
    return "未知版本";
  }
  String versionName = version.trim();
  switch (versionName) {
    case "Standard Edition":
      return "标准版";
    case "Warbond Edition":
      return "战争债券版";
    default:
      return version;
  }
}

Future<void> Function()? lastBuyProcess;

WoltModalSheetPage getUpgradeCheckoutBottomSheet(BuildContext context, UpgradeShipInfo fromShip, UpgradeShipInfo toShip, Skus toSku, BuildContext rootContext) {

  String numberString = '1';
  final isDevMode = Provider.of<MainDataModel>(context, listen: false).isDevMode;

  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('升级购买',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text('请确认',
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
          Text("升级版本: ${convertVersionNameToChinese(toSku.title)}"),
          SizedBox(height: 50),
          if (isDevMode)
            TextField(
              decoration: InputDecoration(
                // hintText: '购买数量',
                labelText: '购买数量',
              ),
              onChanged: (value) {
                numberString = value;
              },
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

            if (isDevMode) {
              if (number == null) {
                showToast(message: "请输入正确的购买数量");
                return;
              }

              final result = await authenticateWithBiometrics(reason: "请验证以购买物品");
              if (result == false) {
                showToast(message: "验证失败");
                return;
              }


              try {
                final result = await handleUpgradePurchaseWithConfirmation(
                  toSku.id!,
                  fromShip.id!,
                  number,
                );
                if (result == 'SUCCESS') {
                  showToast(message: "购买成功");
                  Navigator.of(context).pop();
                  return;
                } else if (result == 'BUY_FAILED') {
                  showToast(message: "购买失败");
                  return;
                } else if (result == 'NEED_WEBVIEW') {
                  showToast(message: "添加购物车成功，之后可以在商店页面右上方的重播图标中重放当前购买操作~");
                  openRsiCartWebview(context: context, replace: false);
                  lastBuyProcess = () async {
                    showToast(message: "正在重放购买操作...");
                    final result = await handleUpgradePurchaseWithConfirmation(
                      toSku.id!,
                      fromShip.id!,
                      1,
                    );
                    if (result == 'NEED_WEBVIEW') {
                      showToast(message: "需要在浏览器中完成购买");
                    } else if (result == 'BUY_FAILED') {
                      showToast(message: "购买失败");
                    } else if (result == 'SUCCESS') {
                      showToast(message: "购买成功");
                    } else {
                      showToast(message: "未知错误: $result");
                    }
                  };
                  return;
                } else {
                  showToast(message: "未知错误: $result");
                  return;
                }
              } catch (e) {
                showToast(message: "购买失败: $e");
                return;
              }
              return;
            }

            String token = await UpgradeAddToCart(skuId: toSku.id!, fromShipId: fromShip.id!).execute();
            try {
              await ApplyUpgradeToken(upgradeToken: token).execute();
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