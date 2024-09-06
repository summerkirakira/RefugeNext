import 'package:flutter/foundation.dart';

import '../../datasource/models/hangar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../repo/hangar.dart';
import 'shop_top_bar.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import '../../datasource/data_model.dart';
import '../hangar_buyback/hangar_buyback_page.dart';
import '../buyback/buyback_page.dart';
import 'shop_list_page.dart';
import 'normal_shop/normal_shop_page.dart';
import 'subscriber_shop/subscriber_shop_page.dart';
import 'upgrade_shop/upgrade_page.dart';



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
          UpgradePage(),
          NormalShopPage(),
          SubscriberShopPage()
        ],
            titles: ["升级", "商店", "订阅"])
      ],
    );
  }
}
