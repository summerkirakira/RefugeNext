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
