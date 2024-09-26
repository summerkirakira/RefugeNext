import 'package:refuge_next/src/datasource/models/buyback.dart';
import 'package:refuge_next/src/network/api_service.dart';
import 'package:refuge_next/src/network/graphql/shop/upgrade_add_to_cart.dart';

import '../../network/graphql/shop/apply_upgrade_token.dart';

Future<void> addUpgradeBuybackItemToCart(BuybackItem buybackItem) async {
  if (!buybackItem.isUpgrade) {
    throw Exception('This is not an upgrade item');
  }
  await RsiApiClient().setAuthToken();
  await RsiApiClient().setBuybackToken(fromShipId: buybackItem.formShipId, pledgeId: buybackItem.id, toShipId: buybackItem.toShipId, toSkuId: buybackItem.toSkuId);
  final token = await UpgradeAddToCart(skuId: buybackItem.toSkuId, fromShipId: buybackItem.formShipId).execute();
  await ApplyUpgradeToken(upgradeToken: token).execute();
}

Future<void> addBuybackPledgeToCart(BuybackItem buybackItem) async {
  await RsiApiClient().addBuybackPledge(pledgeId: buybackItem.id);
}