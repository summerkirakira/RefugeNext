import '../../datasource/models/buyback.dart';
import '../../network/api_service.dart';
import '../../network/graphql/shop/apply_upgrade_token.dart';
import '../../network/graphql/shop/upgrade_add_to_cart.dart';
import '../../services/rsi_web_session.dart';
import '../rsi_web_session.dart';

Future<void> addUpgradeBuybackItemToCart(BuybackItem buybackItem) async {
  await addBuybackToCartById(buybackItem, buybackItem.id);
}

Future<void> addBuybackPledgeToCart(BuybackItem buybackItem) async {
  await addBuybackToCartById(buybackItem, buybackItem.id);
}

/// 按指定的 pledgeId 把回购物品加入购物车，兼容普通回购与升级包回购。
bool _buybackInProgress = false;

Future<void> addBuybackToCartById(BuybackItem buybackItem, int pledgeId,
    {RsiWebSessionAttempt? attempt}) async {
  if (_buybackInProgress) throw StateError('正在处理回购，请稍候');
  _buybackInProgress = true;
  try {
    await rsiWebSession.ensure(attempt ?? RsiWebSessionAttempt());
    final session = RsiApiClient().session;
    final generation = session.generation;
    if (buybackItem.isUpgrade) {
      await RsiApiClient().setBuybackToken(
        fromShipId: buybackItem.formShipId,
        pledgeId: pledgeId,
        toShipId: buybackItem.toShipId,
        toSkuId: buybackItem.toSkuId,
      );
      session.assertGeneration(generation);
      final token = await UpgradeAddToCart(
              skuId: buybackItem.toSkuId, fromShipId: buybackItem.formShipId)
          .execute();
      session.assertGeneration(generation);
      await ApplyUpgradeToken(upgradeToken: token).execute();
    } else {
      await RsiApiClient().addBuybackPledge(pledgeId: pledgeId);
    }
    session.assertGeneration(generation);
  } finally {
    _buybackInProgress = false;
  }
}
