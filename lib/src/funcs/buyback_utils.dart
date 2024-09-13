import 'dart:async';

import 'package:refuge_next/src/network/cirno/property/property.dart';

import '../datasource/models/buyback.dart';
import '../repo/ship_alias.dart';
import '../repo/translation.dart';


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


List<String> getUpgradeNameList(String title) {
  if (!title.startsWith("Upgrade - ")) {
    return [];
  }
  String formattedTitle = title.replaceAll("Upgrade - ", "");
  formattedTitle = formattedTitle.replaceAll("Standard Upgrade", "");
  final upgradeNameList = formattedTitle.split(" to ");
  return upgradeNameList.map((e) => e.trim()).toList();
}


Future<List<BuybackItem>> calculateBuybackPrice(List<BuybackItem> buybackItems) async {

  final shipAliasRepo = ShipAliasRepo();
  final translationRepo = TranslationRepo();

  for (var buybackItem in buybackItems) {
    ShipAlias? fromShip = await shipAliasRepo.getShipAliasByUpgradeId(buybackItem.formShipId);
    ShipAlias? toShip = await shipAliasRepo.getShipAliasByUpgradeId(buybackItem.toShipId);

    final shipTitleList = getUpgradeNameList(buybackItem.title);
    if (shipTitleList.length == 2) {
      fromShip ??= await shipAliasRepo.getShipAlias(shipTitleList[0]);
      toShip ??= await shipAliasRepo.getShipAlias(shipTitleList[1]);
    }

    if (fromShip != null && toShip != null) {
      buybackItem.price = toShip.getHighestSku() - fromShip.getHighestSku();
      final fromShipName = await translationRepo.getTranslation(fromShip.name);
      final toShipName = await translationRepo.getTranslation(toShip.name);
      buybackItem.chinesName = "升级包 - 从 $fromShipName 到 $toShipName";
      buybackItem.formShipUpgradeId = fromShip.upgradeId;
      buybackItem.toShipUpgradeId = toShip.upgradeId;
    }
  }
  return buybackItems;
}