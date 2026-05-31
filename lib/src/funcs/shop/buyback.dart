import 'package:refuge_next/src/datasource/models/buyback.dart';
import 'package:refuge_next/src/network/api_service.dart';
import 'package:refuge_next/src/network/graphql/shop/upgrade_add_to_cart.dart';

import '../../network/graphql/shop/apply_upgrade_token.dart';

Future<void> addUpgradeBuybackItemToCart(BuybackItem buybackItem) async {
  await addBuybackToCartById(buybackItem, buybackItem.id);
}

Future<void> addBuybackPledgeToCart(BuybackItem buybackItem) async {
  await addBuybackToCartById(buybackItem, buybackItem.id);
}

/// 按指定的 pledgeId 把回购物品加入购物车，兼容普通回购与升级包回购。
Future<void> addBuybackToCartById(BuybackItem buybackItem, int pledgeId) async {
  if (buybackItem.isUpgrade) {
    await RsiApiClient().setAuthToken();
    await RsiApiClient().setBuybackToken(
      fromShipId: buybackItem.formShipId,
      pledgeId: pledgeId,
      toShipId: buybackItem.toShipId,
      toSkuId: buybackItem.toSkuId,
    );
    final token = await UpgradeAddToCart(skuId: buybackItem.toSkuId, fromShipId: buybackItem.formShipId).execute();
    await ApplyUpgradeToken(upgradeToken: token).execute();
  } else {
    await RsiApiClient().addBuybackPledge(pledgeId: pledgeId);
  }
}