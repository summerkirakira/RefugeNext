import 'dart:convert';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:refuge_next/src/datasource/models/cirno/upgrade_response.dart';
import 'package:refuge_next/src/repo/hangar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../datasource/models/cirno/upgrade_path.dart';
import '../../../datasource/models/hangar.dart';
import '../../../network/cirno/cirno_api.dart';
import '../../../network/cirno/property/property.dart';
import '../../../repo/ship_alias.dart';
import '../../../repo/translation.dart';

// List<String> getValidateUpdateShips() {
//   final shipAliasRepo = ShipAliasRepo();
//   final ships = shipAliasRepo.getShipAliasesSync().where((e) => !bannedShips.contains(e.id)).toList();
//   final shipNames = ships.map((e) => e.name).toList();
//   return shipNames;
// }

class UpgradeStep {
  final String fromProduct;
  final String toProduct;
  final int cost;
  final List<String> tags;
  final ShipAlias fromShip;
  final ShipAlias toShip;

  UpgradeStep(this.fromProduct, this.toProduct, this.cost, this.tags,
      {required this.fromShip, required this.toShip});

  String toJson() {
    return jsonEncode({
      'fromProduct': fromProduct,
      'toProduct': toProduct,
      'cost': cost,
      'tags': tags,
      'fromShip': fromShip.upgradeId,
      'toShip': toShip.upgradeId,
    });
  }

  factory UpgradeStep.fromJson(Map<String, dynamic> json) {

    final fromShip = ShipAliasRepo().getShipAliasByUpgradeIdSync(json['fromShip']);
    final toShip = ShipAliasRepo().getShipAliasByUpgradeIdSync(json['toShip']);

    return UpgradeStep(
      json['fromProduct'],
      json['toProduct'],
      json['cost'],
      List<String>.from(json['tags']),
      fromShip: fromShip!,
      toShip: toShip!,
    );
  }

}

class BannedUpgrade {
  final int fromShipId;
  final int toShipId;

  BannedUpgrade(this.fromShipId, this.toShipId);
}

class UpgradeSettings {
  bool useBuyback;
  bool useHangar;
  bool useHistory;

  UpgradeSettings(
      {this.useBuyback = true, this.useHangar = true, this.useHistory = false});
}

List<ShipAlias> getValidateUpdateShips() {
  final shipAliasRepo = ShipAliasRepo();
  final ships = shipAliasRepo
      .getShipAliasesSync()
      .where((e) => e.upgradeId != null)
      .toList();
  ships.sort((a, b) => a.getHighestSku().compareTo(b.getHighestSku()));
  for (var ship in ships) {
    ship.chineseName = TranslationRepo().getTranslationSync(ship.name);
  }
  return ships;
}

Future<UpgradeSettings> getUpgradeSettings() async {
  final prefs = await SharedPreferences.getInstance();
  final useBuyback = prefs.getBool('vip.kirakira.use_buyback') ?? false;
  final useHangar = prefs.getBool('vip.kirakira.use_hangar') ?? false;
  final useHistory = prefs.getBool('vip.kirakira.use_history') ?? false;
  return UpgradeSettings(
      useBuyback: useBuyback, useHangar: useHangar, useHistory: useHistory);
}

Future<void> saveUpgradeSettings(UpgradeSettings settings) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('vip.kirakira.use_buyback', settings.useBuyback);
  await prefs.setBool('vip.kirakira.use_hangar', settings.useHangar);
  await prefs.setBool('vip.kirakira.use_history', settings.useHistory);
}

Future<List<CCUItem>> getValidateHangarCCUItems(
    List<HangarItem> hangarItems) async {
  List<CCUItem> items = [];

  for (var item in hangarItems) {
    if (!item.isUpgrade) {
      continue;
    }

    if (item.fromShip != null && item.toShip != null) {
      final fromShip =
          Ship(id: item.fromShip!.id, value: item.fromShip!.getHighestSku());
      final toShip =
          Ship(id: item.toShip!.id, value: item.toShip!.getHighestSku());

      items.add(CCUItem(fromShip: fromShip, toShip: toShip, value: item.price));
    }
  }
  return items;
}

Future<ShipUpgradeConfig> getUpgradeConfig(UpgradeSettings settings,
    int fromShipId, int toShipId, List<HangarItem> hangarItems, List<int> bannedShips, List<int> mustHaveShips) async {
  final ccuItems = await getValidateHangarCCUItems(hangarItems);

  return ShipUpgradeConfig(
    fromShipId: fromShipId,
    toShipId: toShipId,
    bannedShipList: bannedShips,
    bannedWbCcuList: [],
    mustHaveShipList: mustHaveShips,
    useHistoryCcu: settings.useHistory,
    hangarCcuList: ccuItems,
    buybackCcuList: [],
  );
}

Future<List<UpgradeStep>> updateUpgradeSteps(UpgradeSettings settings,
    int fromShipId, int toShipId, List<HangarItem> hangarItems, List<int> bannedShips, List<int> mustHaveShips) async {
  final allShips = getValidateUpdateShips();

  final config =
      await getUpgradeConfig(settings, fromShipId, toShipId, hangarItems, bannedShips, mustHaveShips);
  final upgradeResult =
      await CirnoApiClient().getShipUpgradePath(config: config);
  final ccuItems = await getValidateHangarCCUItems(hangarItems);

  final steps = <UpgradeStep>[];

  if (upgradeResult.shipPath.isEmpty) {
    return steps;
  }

  for (var i = 0; i < upgradeResult.shipPath.length - 1; i++) {
    final fromShip =
        allShips.firstWhere((e) => e.id == upgradeResult.shipPath[i]);
    final toShip =
        allShips.firstWhere((e) => e.id == upgradeResult.shipPath[i + 1]);

    CCUItem? ccuItem;
    HistoryWbCcu? wbCcuItem;

    for (var item in ccuItems) {
      if (item.fromShip.id == fromShip.id && item.toShip.id == toShip.id) {
        ccuItem = item;
        break;
      }
    }

    for (var item in upgradeResult.historyWbCcuList) {
      if (item.fromShipId == fromShip.id && item.toShipId == toShip.id) {
        wbCcuItem = item;
        break;
      }
    }

    int cost = 0;
    final tags = <String>[];

    if (ccuItem != null) {
      cost = ccuItem.value;
      tags.add('机库中');
    } else if (wbCcuItem != null) {
      cost = wbCcuItem.value;
      tags.add('历史WB');
    } else {
      cost = toShip.getHighestSku() - fromShip.getHighestSku();
      tags.add('常规升级');
    }

    steps.add(UpgradeStep(
        fromShip.chineseName!, toShip.chineseName!, cost, tags,
        fromShip: fromShip, toShip: toShip));
  }

  final List<UpgradeStep> stackedSteps = [];

  for (var step in steps) {
    if (stackedSteps.isEmpty) {
      stackedSteps.add(step);
      continue;
    }

    if (stackedSteps.last.tags.first != '常规升级' || step.tags.first != '常规升级') {
      stackedSteps.add(step);
      continue;
    }

    if (stackedSteps.last.toShip.id == step.fromShip.id) {
      stackedSteps.last = UpgradeStep(
        stackedSteps.last.fromProduct,
        step.toProduct,
        stackedSteps.last.cost + step.cost,
        stackedSteps.last.tags,
        fromShip: stackedSteps.last.fromShip,
        toShip: step.toShip,
      );
      continue;
    }
    stackedSteps.add(step);
  }

  return stackedSteps;
}

CustomDropdownDecoration getUpgradeDropdownDecoration(bool isDarkMode) =>
    CustomDropdownDecoration(
      closedFillColor: isDarkMode ? Colors.grey[800] : Colors.white,
      expandedFillColor: isDarkMode ? Colors.grey[900] : Colors.grey[100],
      hintStyle: TextStyle(
        color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
      ),
      headerStyle: TextStyle(
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      closedSuffixIcon: Icon(
        Icons.arrow_drop_down,
        color: isDarkMode ? Colors.white70 : Colors.black54,
      ),
      expandedSuffixIcon: Icon(
        Icons.arrow_drop_up,
        color: isDarkMode ? Colors.white70 : Colors.black54,
      ),
      listItemStyle: TextStyle(
        color: isDarkMode ? Colors.white : Colors.black,
      ),
        searchFieldDecoration: SearchFieldDecoration(
          hintStyle: TextStyle(
            color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
          ),
          fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: isDarkMode ? Colors.grey[600]! : Colors.grey[300]!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isDarkMode ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),
        ),
    );

Future<void> saveStepsToStorage(List<UpgradeStep> steps, int saveIndex) async {
  final prefs = await SharedPreferences.getInstance();
  final stepList = steps.map((e) => e.toJson()).toList();
  await prefs.setString('vip.kirakira.steps[${saveIndex}]', jsonEncode(stepList));
}

Future<List<UpgradeStep>> getStepsFromStorage(int num) async {
  final prefs = await SharedPreferences.getInstance();
  final slot = prefs.getString('vip.kirakira.steps[${num}]');
  if (slot == null) {
    return [];
  }
  final stepsString = List<String>.from(jsonDecode(slot));
  return stepsString.map((e) => jsonDecode(e)).map((e) => UpgradeStep.fromJson(e)).toList();
}

Future<List<String>> getSlotsFromStorage(int num) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> slotList = [];
  for (var i = 0; i < num; i++) {
    final slot = prefs.getString('vip.kirakira.steps[${i}]');
    if (slot == null) {
      slotList.add('空');
      continue;
    }
    final stepsString = List<String>.from(jsonDecode(slot));
    int totalCost = 0;

    final steps = stepsString.map((e) => jsonDecode(e)).toList();

    for (var step in steps) {
      totalCost += step['cost'] as int;
    }
    final fromShip = steps.first['fromProduct'] as String;
    final toShip = steps.last['toProduct'] as String;
    slotList.add('$fromShip -> $toShip: \$${totalCost ~/ 100}');
  }
  return slotList;
}