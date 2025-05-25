import 'package:refuge_next/src/datasource/models/shop/credit_query_property.dart'
    show CreditQueryProperty;
import '../../datasource/models/shop/store_model.dart';
import '../../network/graphql/shop/apply_upgrade_token.dart';
import '../../network/graphql/shop/credit_query.dart';
import '../../network/graphql/shop/upgrade_add_to_cart.dart';
import '../toast.dart';
import 'cart.dart';
import 'package:refuge_next/src/network/graphql/shop/step1query.dart';

int getMaxApplicable(StoreData step1query, CreditQueryProperty credit) {
  if (credit.store.cart.totals.credits.maxApplicable > credit.customer.ledger.amount.value) {
    return credit.customer.ledger.amount.value;
  }
  return credit.store.cart.totals.credits.maxApplicable;
}

Future<String> handleUpgradePurchase(int skuId, int fromShipId) async {
  try {
    String token = await UpgradeAddToCart(skuId: skuId, fromShipId: fromShipId).execute();
    await ApplyUpgradeToken(upgradeToken: token).execute();
    return 'SUCCESS';
  } catch (e) {
    showToast(message: "购买失败: $e");
    return 'BUY_FAILED';
  }
}


Future<String> handleUpgradePurchaseWithConfirmation(
  int skuId,
  int fromShipId,
  int number,
) async {
  await clearCart();
  String result = await handleUpgradePurchase(skuId, fromShipId);
  if (result != 'SUCCESS') {
    return 'BUY_FAILED'; // 如果购买失败，返回false
  }
  final step1query = await Step1Query().execute();
  int leftNumber = number;

  if (step1query.store.cart.lineItems.length != 1) {
    showToast(message: "购物车中没有升级物品");
    return 'BUY_FAILED'; // 如果购物车中没有升级物品，返回false
  }
  final item = step1query.store.cart.lineItems.first;
  final maxQuantity = item.sku.maxQty;

  while (leftNumber > 0) {
    final qtyToAdd = leftNumber > maxQuantity ? maxQuantity : leftNumber;
    if (qtyToAdd != 1) {
      await updateCartNumber(item, qtyToAdd);
    }

    final credit = await CreditQuery().execute();
    final maxApplicable = getMaxApplicable(step1query, credit);
    if (maxApplicable > 0) {
      await updateCredit(maxApplicable.toDouble() / 100);
    }
    await gotoNextStep();
    await assignFirstAddress();
    final validateResult = await validateCart();
    if (validateResult.cart.flow.current.orderCreated) {
      // showToast(message: "需要验证购物车");
      return 'NEED_WEBVIEW'; // 如果验证失败，返回false
    }

    leftNumber -= qtyToAdd;

  }
  return 'SUCCESS';
}