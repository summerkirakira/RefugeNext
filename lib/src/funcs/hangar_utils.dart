import 'dart:async';

import 'package:flutter/material.dart';

import '../datasource/models/hangar.dart' show HangarItem, HangarSubItem;
// import 'package:provider/provider.dart';
import '../datasource/data_model.dart' show MainDataModel, HangarItemType;
import '../repo/translation.dart' show TranslationRepo;

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
    translatedNameList.add(await repo.getTranslation(name));
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
      translatedSubItems.add(item.copyWith(title: await trainslateHangarItemName(repo, item.title)));
    }

    final newHangarItem = hangarItem.copyWith(
      chineseName: await trainslateHangarItemName(repo, hangarItem.name),
      chineseAlsoContains: chineseAlsoContains.join('#'),
      items: translatedSubItems,
    );

    newHangarItems.add(newHangarItem);
  };
  return newHangarItems;
}