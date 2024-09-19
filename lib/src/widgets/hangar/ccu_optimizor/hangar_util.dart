import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/models/hangar.dart';
import 'package:refuge_next/src/network/api_service.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../datasource/data_model.dart';
import '../../../funcs/toast.dart';
import '../../../funcs/validation.dart';
import '../../../network/parsers/choose_upgrade_parser.dart';
import '../upgrade_from_choose_bottomsheet.dart';


Future<WoltModalSheetPage?> getChooseTargetBottomSheet(BuildContext context, HangarItem hangarItem) async {
  final targetResult = await RsiApiClient().getUpgradeTarget(hangarItem.id);
  List<ChooseUpgradeTargetItem> targetInfos = PledgeUpgradeParser().parse(targetResult.data.rendered);
  if (targetInfos.isEmpty) {
    showToast(message: "没有找到可升级舰船");
    return null;
  }
  Map<int, HangarItem> targetItemMap = {};
  for (var targetInfo in targetInfos) {
    final targetItem = Provider.of<MainDataModel>(context, listen: false).getHangarItemById(int.parse(targetInfo.pledgeId));
    if (targetItem != null) {
      targetItemMap[targetItem.id] = targetItem;
    }
  }
  final targetItems = targetItemMap.values.toList();

  return getUpgradeFromChooseBottomSheet(context, hangarItem, targetItems, (HangarItem targetItem) async {
    final result = await authenticateWithBiometrics(reason: "请验证以升级 ${targetItem.chineseName}");
    if (result == false) {
      showToast(message: "验证失败");
      return;
    }

    final currentPassword = Provider.of<MainDataModel>(context, listen: false).currentUser!.password;
    try {
      await RsiApiClient().applyUpgrade(targetItem.id, hangarItem.id, currentPassword);
    } catch (e) {
      showToast(message: e.toString());
      return;
    }
    Provider.of<MainDataModel>(context, listen: false).updateHangarItems();
    showToast(message: "应用升级成功");
    Navigator.of(context).pop();
  });

}