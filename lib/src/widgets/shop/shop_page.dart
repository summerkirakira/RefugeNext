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

    return  Column(
      children: [
        ShopTopBar(),
        ShopListPage(children: [
          CatalogPage(catalogTypes: CatalogTypes.standAloneShip),
          CatalogPage(catalogTypes: CatalogTypes.paints),
          CatalogPage(catalogTypes: CatalogTypes.gear),
          CatalogPage(catalogTypes: CatalogTypes.subscriber),
          CatalogPage(catalogTypes: CatalogTypes.package),
          CatalogPage(catalogTypes: CatalogTypes.addOns),
          CatalogPage(catalogTypes: CatalogTypes.packs),
          CatalogPage(catalogTypes: CatalogTypes.uec),
          CatalogPage(catalogTypes: CatalogTypes.giftCard),
          CatalogPage(catalogTypes: CatalogTypes.combo)
        ],
            titles: const ["舰船", "涂装", "装备", "订阅", "游戏包", "附加", "组合包", "UEC", "礼品卡", "组合包"])
      ],
    );
  }
}
