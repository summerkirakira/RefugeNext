import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import '../../datasource/data_model.dart';
import '../../datasource/models/hangar.dart';
import '../../datasource/models/searchProperty.dart';


List<MultiSelectCard> getUpgradeFromCards(List<HangarItem> items) {
  List<MultiSelectCard> cards = [];
  Map<int, String> shipMap = {};
  for (var item in items) {
    if (item.fromShip != null && item.toShip != null) {
      shipMap[item.fromShip!.id] = item.fromShip!.chineseName ?? item.fromShip!.name;
    }
  }
  for (var entry in shipMap.entries) {
    cards.add(MultiSelectCard(value: entry.key.toString(), label: entry.value));
  }
  return cards;
}

List<MultiSelectCard> getUpgradeToCards(List<HangarItem> items) {
  List<MultiSelectCard> cards = [];
  Map<int, String> shipMap = {};
  for (var item in items) {
    if (item.fromShip != null && item.toShip != null) {
      shipMap[item.toShip!.id] = item.toShip!.chineseName ?? item.toShip!.name;
    }
  }
  for (var entry in shipMap.entries) {
    cards.add(MultiSelectCard(value: entry.key.toString(), label: entry.value));
  }
  return cards;
}

List<MultiSelectCard> getCCUSlotCards(int num) {
  List<MultiSelectCard> cards = [];
  for (var i = 0; i < num; i++) {
    cards.add(MultiSelectCard(value: "$i", label: "槽位${i + 1}"));
  }
  return cards;
}


WoltModalSheetPage getSearchBottomSheet(BuildContext context) {


  final SearchProperty searchKey = SearchProperty(searchType: ["all"],
      searchStatus: ["all"],
      searchInsurance: ["all"],
      priceRange: ["all"],
      reclaimStatus: ["all"],
      fromShip: ["all"],
      toShip: ["all"],
      searchText: null,
      selectedCCUSlots: []
  );


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

                List<String> searchType = [];
                for (var item in allSelectedItems) {
                  searchType.add(item);
                }

                searchKey.searchType = searchType;

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
                  MultiSelectCard(value: "attributed", label: "在库"),
                  MultiSelectCard(value: "gifted", label: "已礼物"),
                ],
                onChange: (allSelectedItems, selectedItem) {
                  searchKey.searchStatus = [];
                  for (var item in allSelectedItems) {
                    searchKey.searchStatus.add(item);
                  }

                }),
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
                  MultiSelectCard(value: "lti", label: "永久保险"),
                  MultiSelectCard(value: "10y", label: "10年及以上"),
                  MultiSelectCard(value: "other", label: "其他"),
                ],
                onChange: (allSelectedItems, selectedItem) {
                  searchKey.searchInsurance = [];
                  for (var item in allSelectedItems) {
                    searchKey.searchInsurance.add(item);
                  }
                }),
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
                  MultiSelectCard(value: "500+", label: "500+")
                ],
                onChange: (allSelectedItems, selectedItem) {
                  searchKey.priceRange = [];
                  for (var item in allSelectedItems) {
                    searchKey.priceRange.add(item);
                  }
                }),
            // const Divider(),
            const SizedBox(height: 10),
            const Text("融船",
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
                  MultiSelectCard(value: "giftable", label: "可礼物"),
                  MultiSelectCard(value: "reclaimable", label: "可融"),
                ],
                onChange: (allSelectedItems, selectedItem) {
                  searchKey.reclaimStatus = [];
                  for (var item in allSelectedItems) {
                    searchKey.reclaimStatus.add(item);
                  }
                }
            ),
            const SizedBox(height: 20),
            const Text("保存的CCU链",
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
                items: getCCUSlotCards(10),
                onChange: (allSelectedItems, selectedItem) {
                  searchKey.selectedCCUSlots = [];
                  for (var item in allSelectedItems) {
                    searchKey.selectedCCUSlots.add(int.parse(item));
                  }
                }
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Text("起始舰船",
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
                items: getUpgradeFromCards(Provider.of<MainDataModel>(context).rawHangarItems),
                onChange: (allSelectedItems, selectedItem) {
                  searchKey.fromShip = [];
                  for (var item in allSelectedItems) {
                    searchKey.fromShip.add(item);
                  }
                }
            ),
            const SizedBox(height: 10),
            const Text("目标舰船",
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
                items: getUpgradeToCards(Provider.of<MainDataModel>(context).rawHangarItems),
                onChange: (allSelectedItems, selectedItem) {
                  searchKey.toShip = [];
                  for (var item in allSelectedItems) {
                    searchKey.toShip.add(item);
                  }
                }
            ),
            const SizedBox(
              height: 100,
            ),
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
            onPressed: () async {
              searchKey.searchText = searchController.text;
              await Provider.of<MainDataModel>(context, listen: false).setUpdateStep(searchKey.selectedCCUSlots);
              Provider.of<MainDataModel>(context, listen: false).updateSearchProperty(searchKey);
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
