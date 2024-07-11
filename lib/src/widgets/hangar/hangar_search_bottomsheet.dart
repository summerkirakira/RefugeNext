import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import '../../datasource/data_model.dart';

WoltModalSheetPage getSearchBottomSheet(BuildContext context) {
  final tagSuffix = MultiSelectSuffix(
      selectedSuffix: const Padding(
        padding: EdgeInsets.only(left: 5),
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 14,
        ),
      ),
      disabledSuffix: const Padding(
        padding: EdgeInsets.only(left: 5),
        child: Icon(
          Icons.do_disturb_alt_sharp,
          size: 14,
        ),
      ));
  final itemTypeController = MultiSelectController();
  final searchController = TextEditingController();

  return WoltModalSheetPage(
      navBarHeight: 50,
      pageTitle: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('机库搜索',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
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
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: '物品名称',
              ),
            ),
            const SizedBox(height: 20),
            const Text("类型",
                style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.bold
                )),
            const SizedBox(height: 10),
            MultiSelectContainer(
              controller: itemTypeController,
              itemsDecoration: MultiSelectDecorations(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              suffix: tagSuffix,
              items: [
                MultiSelectCard(value: "all", label: "全部"),
                MultiSelectCard(value: "ship", label: "舰船"),
                MultiSelectCard(value: "paint", label: "涂装"),
                MultiSelectCard(value: "upgrade", label: "升级"),
                MultiSelectCard(value: "subscription", label: "订阅"),
              ],
              onChange: (allSelectedItems, selectedItem) {

                if (selectedItem == "all") {
                  if (allSelectedItems.contains(selectedItem)) {
                    itemTypeController.selectAll();
                  } else {
                    itemTypeController.deselectAll();
                  }
                }
              },
            ),
            // const Divider(),
            const SizedBox(height: 10),
            const Text("状态",
                style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.bold
                )),
            const SizedBox(height: 10),
            MultiSelectContainer(
                itemsDecoration: MultiSelectDecorations(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                suffix: tagSuffix,
                items: [
                  MultiSelectCard(value: "all", label: "全部"),
                  MultiSelectCard(value: "normal", label: "正常"),
                  MultiSelectCard(value: "damaged", label: "损坏"),
                  MultiSelectCard(value: "destroyed", label: "摧毁"),
                ],
                onChange: (allSelectedItems, selectedItem) {}),
            // const Divider(),
            const SizedBox(height: 10),
            const Text("保险",
                style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.bold
                )),
            const SizedBox(height: 10),
            MultiSelectContainer(
                itemsDecoration: MultiSelectDecorations(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                suffix: tagSuffix,
                items: [
                  MultiSelectCard(value: "all", label: "全部"),
                  MultiSelectCard(value: "insured", label: "已保险"),
                  MultiSelectCard(value: "uninsured", label: "未保险"),
                ],
                onChange: (allSelectedItems, selectedItem) {}),
            // const Divider(),
            const SizedBox(height: 10),
            const Text("价格",
                style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.bold
                )),
            const SizedBox(height: 10),
            MultiSelectContainer(
                itemsDecoration: MultiSelectDecorations(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                suffix: tagSuffix,
                items: [
                  MultiSelectCard(value: "all", label: "全部"),
                  MultiSelectCard(value: "0-100", label: "0-100"),
                  MultiSelectCard(value: "100-500", label: "100-500"),
                  MultiSelectCard(value: "500-1000", label: "500-1000"),
                  MultiSelectCard(value: "1000+", label: "1000+"),
                ],
                onChange: (allSelectedItems, selectedItem) {}),
            // const Divider(),
            const SizedBox(height: 10),
            const Text("时间",
                style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.bold
                )),
            const SizedBox(height: 10),
            MultiSelectContainer(
                itemsDecoration: MultiSelectDecorations(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                suffix: tagSuffix,
                items: [
                  MultiSelectCard(value: "all", label: "全部"),
                  MultiSelectCard(value: "1d", label: "1天内"),
                  MultiSelectCard(value: "1w", label: "1周内"),
                  MultiSelectCard(value: "1m", label: "1月内"),
                  MultiSelectCard(value: "1y", label: "1年内"),
                ],
                onChange: (allSelectedItems, selectedItem) {}),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      stickyActionBar: Container(
        height: 80,
        width: double.infinity,
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: SizedBox(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              List<HangarItemType> selectedItems = [];
              for (var item in itemTypeController.getSelectedItems()) {
                switch (item) {
                  case "all":
                    selectedItems.add(HangarItemType.all);
                    break;
                  case "ship":
                    selectedItems.add(HangarItemType.ship);
                    break;
                  case "paint":
                    selectedItems.add(HangarItemType.paint);
                    break;
                  case "upgrade":
                    selectedItems.add(HangarItemType.upgrade);
                    break;
                  case "subscription":
                    selectedItems.add(HangarItemType.subscription);
                    break;
                  default:
                    break;
                }
              }
              if (selectedItems.isNotEmpty) {
                Provider.of<MainDataModel>(context, listen: false)
                    .updateSelectedHangarItemType(selectedItems);
                Provider.of<MainDataModel>(context, listen: false).readHangarItems();
              }

              Navigator.of(context).pop();
            },
            child: const Text('确认',
                style: TextStyle(
                  fontSize: 16,
                )),
          ),
        ),
      ));
}
