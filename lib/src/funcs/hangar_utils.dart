import 'package:flutter/material.dart';

import '../datasource/models/hangar.dart' show HangarItem, HangarSubItem;
// import 'package:provider/provider.dart';
import '../datasource/data_model.dart' show MainDataModel, HangarItemType;

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
