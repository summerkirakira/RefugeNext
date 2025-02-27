import 'package:provider/provider.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/widgets/hangar/hangar_log/hangar_log_page.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter/material.dart';

import '../../../datasource/data_model.dart';

WoltModalSheetPage getHangarLogBottomSheet(BuildContext context, int? targetItemId) {
  Provider.of<MainDataModel>(context, listen: false).refreshHangarLogs();
  // showToast(message: "正在刷新机库日志");
  return WoltModalSheetPage(
    navBarHeight: 50,
    pageTitle: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('机库日志',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),

          ],
        )),
    leadingNavBarWidget: Container(
      height: 38,
      width: 38,
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2), // 设置背景颜色
        shape: BoxShape.circle, // 设置形状为圆形
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: const Icon(Icons.arrow_back, size: 22),
        onPressed: () => WoltModalSheet.of(context).showAtIndex(0),
      ),
    ),
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
      child: RefreshIndicator(
      onRefresh: () async {
        Provider.of<MainDataModel>(context, listen: false).refreshHangarLogs();
      },
      child: HangarLogPage(targetItemId: targetItemId),
    )
  );
}