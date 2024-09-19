import 'package:flutter/material.dart';
import 'package:refuge_next/src/datasource/models/hangar.dart';
import 'package:refuge_next/src/repo/translation.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../network/parsers/choose_upgrade_parser.dart';
import 'hangar_item_widget.dart';


WoltModalSheetPage getUpgradeFromChooseBottomSheet(BuildContext context, HangarItem currentItem, List<HangarItem> targetItems, Function(HangarItem) onSelected) {

  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('请选择要升级的机库物品',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text('即将应用 ${currentItem.chineseName}\n注意: 此操作不可逆，请谨慎选择！',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
          ],
        )),
    trailingNavBarWidget: Container(
      height: 38,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2), // 设置背景颜色
        shape: BoxShape.circle, // 设置形状为圆形
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: const Icon(Icons.close, size: 22),
        onPressed: Navigator.of(context).pop,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          for (var item in targetItems)
            HangarItemWidget(
              hangarItem: item,
              onTap: (item, context) async {
                 await onSelected(item);

              },
            ),
          SizedBox(height: 150)
        ],
      ),
    ),
  );
}