import '../datasource/models/buyback.dart';


String getStackKey(BuybackItem buybackItem) {
  if (buybackItem.isUpgrade) {
    return "Upgrade${buybackItem.formShipId}#${buybackItem.toShipId}#${buybackItem.toSkuId}";
  } else {
    return "Item${buybackItem.title}#${buybackItem.alsoContains}}";
  }
}


List<BuybackItem> stackBuybackItems(List<BuybackItem> buybackItems) {
  Map<String, BuybackItem> newBuybackItems = {};

  for (var buybackItem in buybackItems) {
    final stackKey = getStackKey(buybackItem);
    if (newBuybackItems.containsKey(stackKey)) {
      newBuybackItems[stackKey]!.number += 1;
      newBuybackItems[stackKey]!.idList.add(buybackItem.id);
    } else {
      newBuybackItems[stackKey] = buybackItem;
    }
  }
  return newBuybackItems.values.toList();
}