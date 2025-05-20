import 'package:flutter/foundation.dart';

import '../../datasource/models/hangar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../repo/hangar.dart';
import 'shop_top_bar.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'shop_list_page.dart';
import './shop_page/shop_page.dart' show CatalogPage;
import 'package:refuge_next/src/datasource/models/shop/catalog_types.dart' show CatalogTypes;



class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // 为每个页面创建独立的RefreshKey
  final List<GlobalKey<RefreshIndicatorState>> _refreshKeys = [
    GlobalKey<RefreshIndicatorState>(), // 舰船
    GlobalKey<RefreshIndicatorState>(), // 涂装
    GlobalKey<RefreshIndicatorState>(), // 装备
    GlobalKey<RefreshIndicatorState>(), // 订阅
    GlobalKey<RefreshIndicatorState>(), // 游戏包
    GlobalKey<RefreshIndicatorState>(), // 附加
    GlobalKey<RefreshIndicatorState>(), // 组合包
    GlobalKey<RefreshIndicatorState>(), // UEC
    GlobalKey<RefreshIndicatorState>(), // 礼品卡
    GlobalKey<RefreshIndicatorState>(), // 组合包
  ];

  void onTap(HangarItem hangarItem, BuildContext context){


    WoltModalSheet.show<void>(
        context: context,
        pageListBuilder: (modalSheetContext) {
          return [

          ];
        }
    );


    if (kDebugMode) {
      print('HangarItem tapped: ${hangarItem.name}');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShopTopBar(refreshKeys: _refreshKeys),
        ShopListPage(
          children: [
            CatalogPage(
              catalogTypes: CatalogTypes.standAloneShip,
              refreshKey: _refreshKeys[0],
            ),
            CatalogPage(
              catalogTypes: CatalogTypes.paints,
              refreshKey: _refreshKeys[1],
            ),
            CatalogPage(
              catalogTypes: CatalogTypes.gear,
              refreshKey: _refreshKeys[2],
            ),
            CatalogPage(
              catalogTypes: CatalogTypes.subscriber,
              refreshKey: _refreshKeys[3],
            ),
            CatalogPage(
              catalogTypes: CatalogTypes.package,
              refreshKey: _refreshKeys[4],
            ),
            CatalogPage(
              catalogTypes: CatalogTypes.addOns,
              refreshKey: _refreshKeys[5],
            ),
            CatalogPage(
              catalogTypes: CatalogTypes.packs,
              refreshKey: _refreshKeys[6],
            ),
            CatalogPage(
              catalogTypes: CatalogTypes.uec,
              refreshKey: _refreshKeys[7],
            ),
            CatalogPage(
              catalogTypes: CatalogTypes.giftCard,
              refreshKey: _refreshKeys[8],
            ),
            CatalogPage(
              catalogTypes: CatalogTypes.combo,
              refreshKey: _refreshKeys[9],
            ),
          ],
          titles: const ["舰船", "涂装", "装备", "订阅", "游戏包", "附加", "组合包", "UEC", "礼品卡", "组合包"],
        ),
      ],
    );
  }
}
