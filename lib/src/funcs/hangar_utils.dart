import 'dart:async';
import '../datasource/models/hangar.dart' show HangarItem, HangarSubItem;
// import 'package:provider/provider.dart';
import '../datasource/data_model.dart' show MainDataModel, HangarItemType;
import '../network/cirno/property/property.dart';
import '../repo/translation.dart' show TranslationRepo;
import '../repo/ship_alias.dart' show ShipAliasRepo;

List<HangarItem> filterHangarItemsByType(
    MainDataModel dataModel, List<HangarItem> hangarItems) {
  List<HangarItem> newHangarItems = [];
  final selectedTypes = dataModel.selectedHangarItemType;
  hangarItems.forEach((hangarItem) {
    if (selectedTypes.contains(HangarItemType.all)) {
      newHangarItems.add(hangarItem);
    } else {
      if (selectedTypes.contains(HangarItemType.paint)) {
        if (hangarItem.name.toLowerCase().contains('paint')) {
          newHangarItems.add(hangarItem);
        } else {
          for (var subItem in hangarItem.items) {
            if (subItem.kind == 'Paint') {
              newHangarItems.add(hangarItem);
              break;
            }
          }
        }

      }
    }
  });
  return newHangarItems;
}


String getStackKey(HangarItem hangarItem) {
  String stackKey = "${hangarItem.name}#${hangarItem.status}#${hangarItem.price}#${hangarItem.alsoContains}";

  for (var subItem in hangarItem.items) {
    stackKey += subItem.title;
  }

  return stackKey;
}


List<HangarItem> stackHangarItems(List<HangarItem> hangarItems) {
  Map<String, HangarItem> newHangarItems = {};

  for (var hangarItem in hangarItems) {
    final stackKey = getStackKey(hangarItem);
    if (newHangarItems.containsKey(stackKey)) {
      newHangarItems[stackKey]!.number += 1;
      newHangarItems[stackKey]!.idList.add(hangarItem.id);
    } else {
      newHangarItems[stackKey] = hangarItem;
    }
  }
  return newHangarItems.values.toList();
}


Future<String> trainslateHangarItemName(TranslationRepo repo, String name) async {
  final nameList = name.split("#");

  final totalNameList = [];
  for (var name in nameList) {
    totalNameList.addAll(name.split(" - "));
  }

  List<String> translatedNameList = [];

  for (var name in totalNameList) {
    translatedNameList.add(repo.getTranslationSync(name));
  }

  return translatedNameList.join(" - ");

}


Future<List<HangarItem>> translateHangarItem(List<HangarItem> hangarItems) async {

  final repo = TranslationRepo();

  final List<HangarItem> newHangarItems = [];

  for(var hangarItem in hangarItems) {
    final List<HangarSubItem> translatedSubItems = [];


    final List<String> chineseAlsoContains = [];

    for (var text in hangarItem.alsoContains.split('#')) {
      chineseAlsoContains.add(await trainslateHangarItemName(repo, text));
    }

    for (var item in hangarItem.items) {
      translatedSubItems.add(
          item.copyWith(
              chineseTitle: await trainslateHangarItemName(repo, item.title),
              chineseSubtitle: await trainslateHangarItemName(repo, item.subtitle)
          )
      );
    }


    String chineseTitle = "";

    if (hangarItem.fromShip != null && hangarItem.toShip != null) {

      final fromShipName = await trainslateHangarItemName(repo, hangarItem.fromShip!.name);
      final toShipName = await trainslateHangarItemName(repo, hangarItem.toShip!.name);

      hangarItem.fromShip!.chineseName = fromShipName;
      hangarItem.toShip!.chineseName = toShipName;

      chineseTitle = "升级包 - 从 $fromShipName 到 $toShipName";
    } else {
      chineseTitle = await trainslateHangarItemName(repo, hangarItem.name);
    }


    final newHangarItem = hangarItem.copyWith(
      chineseName: chineseTitle,
      chineseAlsoContains: chineseAlsoContains.join('#'),
      items: translatedSubItems,
      fromShip: hangarItem.fromShip,
      toShip: hangarItem.toShip,
    );

    newHangarItems.add(newHangarItem);
  };
  return newHangarItems;
}


List<String> splitShipName(String title) {
  String shipName = title.replaceAll("Upgrade - ", " ");
  List<String> shipNameList = shipName.split(" to ");
  return shipNameList.map((e) => e.trim()).toList();
}


Future<List<HangarItem>> calculateShipPrice(List<HangarItem> hangarItems) async {
  final shipAliasRepo = ShipAliasRepo();
  final List<HangarItem> newHangarItems = [];


  for (var hangarItem in hangarItems) {
    ShipAlias? fromShip;
    ShipAlias? toShip;
    int price = 0;

    if (hangarItem.isUpgrade && hangarItem.upgradeInfo!.matchItems!.isNotEmpty && hangarItem.upgradeInfo!.targetItems!.isNotEmpty) {
      final shipNameList = [hangarItem.upgradeInfo!.matchItems!.first.name, hangarItem.upgradeInfo!.targetItems!.first.name];
      if (shipNameList.length == 2) {
        fromShip = await shipAliasRepo.getShipAlias(shipNameList[0]!);
        toShip = await shipAliasRepo.getShipAlias(shipNameList[1]!);
        if (fromShip != null && toShip != null) {
          price += toShip.getHighestSku() - fromShip.getHighestSku();
        }
      }
    }


    final List<HangarSubItem> newSubItems = [];

    for (var subItem in hangarItem.items) {
      if (subItem.kind == 'Ship') {
        final shipAlias = await shipAliasRepo.getShipAlias(subItem.title);
        if (shipAlias != null) {
          newSubItems.add(subItem.copyWith(price: shipAlias.getHighestSku()));
          price += shipAlias.getHighestSku();
          continue;
        }
      }
      newSubItems.add(subItem.copyWith());
    }

    if (price == 0) {
      price = hangarItem.price;
    }

    final newHangarItem = hangarItem.copyWith(
      currentPrice: price,
      items: newSubItems,
      fromShip: fromShip,
      toShip: toShip,
    );

    newHangarItems.add(newHangarItem);
  }

  return newHangarItems;
}