import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../datasource/data_model.dart';
import '../../funcs/hangar/excel_utils.dart';

WoltModalSheetPage getHangarExportPage(BuildContext modalSheetContext, BuildContext mainContext) {

  final dataModel = Provider.of<MainDataModel>(mainContext, listen: false);

  return WoltModalSheetPage(
    navBarHeight: 60,
    pageTitle: const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('导出机库', style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          )),
          Text('选择要导出的内容',
              style: TextStyle(fontSize: 15, color: Colors.grey)),
        ],
      )
    ),
    leadingNavBarWidget: Container(
      height: 38,
      width: 38,
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(5),
        icon: const Icon(Icons.arrow_back, size: 22),
        onPressed: () => Navigator.of(modalSheetContext).pop(),
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
          onPressed: Navigator.of(modalSheetContext).pop,
        ),
      ),
    child: Container(
      height: 400,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildExportButton(
            icon: Icons.compare_arrows,
            title: '导出CCU',
            subtitle: '仅导出机库中的CCU信息',
            onTap: () async {
              String userName = dataModel.currentUser == null
                  ? '用户'
                  : dataModel.currentUser!.handle;
              await generateUpgradeHangarExcelTable(dataModel.hangarItems, userName);
            },
          ),
          const SizedBox(height: 10),
          _buildExportButton(
            icon: Icons.inventory_2,
            title: '导出完整机库',
            subtitle: '导出所有机库物品信息',
            onTap: () async {
              String userName = dataModel.currentUser == null
                  ? '用户'
                  : dataModel.currentUser!.handle;
              await generateGeneralExcelTable(dataModel.hangarItems, userName);

            },
          ),
          const SizedBox(height: 10),
          _buildExportButton(
            icon: Icons.format_list_bulleted,
            title: '导出舰船清单',
            subtitle: '导出已拥有舰船信息',
            onTap: () async {
              String userName = dataModel.currentUser == null
                  ? '用户'
                  : dataModel.currentUser!.handle;
              await generateShipExcelTable(dataModel.hangarItems, userName);
            },
          ),
        ],
      ),
    )
  );
}

Widget _buildExportButton({
  required IconData icon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return Column(
    children: [
      ListTile(
        leading: Icon(icon, size: 30),
        title: Text(title, style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        )),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
      const Divider(height: 1, thickness: 0.5), // 添加细分隔线
    ],
  );
}