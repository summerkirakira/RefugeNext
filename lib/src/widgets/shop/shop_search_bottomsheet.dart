import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import '../../datasource/data_model.dart';
import '../../datasource/models/shop_search_property.dart';

WoltModalSheetPage getShopSearchBottomSheet(BuildContext context) {

  final ShopSearchProperty searchKey = ShopSearchProperty(
      searchType: ["all"],
      priceRange: ["all"],
      stockStatus: ["all"],
      itemFlags: ["all"],
      searchText: null,
      orderSelected: false,
      priceOrder: false
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
  final searchController = TextEditingController();
  final itemOrderController = MultiSelectController();

  return WoltModalSheetPage(
      navBarHeight: 50,
      pageTitle: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('商店搜索',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
            ],
          )),
      trailingNavBarWidget: Container(
        height: 38,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          shape: BoxShape.circle,
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
            const Text("价格排序",
                style: TextStyle(
                  fontSize: 15,
                )),
            const SizedBox(height: 10),
            MultiSelectContainer(
              controller: itemOrderController,
              itemsDecoration: MultiSelectDecorations(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              suffix: tagSuffix,
              items: [
                MultiSelectCard(value: "price_desc", label: "倒序"),
                MultiSelectCard(value: "price_asc", label: "正序"),
              ], onChange: (List<dynamic> selectedItems, selectedItem) {
                if (selectedItem == "price_desc") {
                  searchKey.priceOrder = false;
                  searchKey.orderSelected = true;
                } else if (selectedItem == "price_asc") {
                  searchKey.priceOrder = true;
                  searchKey.orderSelected = true;
                }
            },
            ),

            const SizedBox(height: 10),
            const Text("价格",
                style: TextStyle(
                  fontSize: 15,
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
              Provider.of<MainDataModel>(context, listen: false).updateShopSearchProperty(searchKey);
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