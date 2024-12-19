import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/widgets/ship_info/general_ship_info_widget.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_info_menu.dart';
import 'package:refuge_next/src/widgets/ship_info/ship_info_title.dart';
import 'package:refuge_next/src/widgets/ship_info/weapon_info_page.dart';

import '../../datasource/data_model.dart';
import '../../repo/ship_info.dart';

class ShipFullPage extends StatefulWidget {
  const ShipFullPage({Key? key}) : super(key: key);

  @override
  _ShipFullPageState createState() => _ShipFullPageState();
}

class _ShipFullPageState extends State<ShipFullPage> {
  @override
  Widget build(BuildContext context) {

    final shipInfoRepo = ShipInfoRepo();

    Provider.of<MainDataModel>(context).setCurrentShipInfo(shipInfoRepo.getShipsSync()[249]);

    return Scaffold(
      body: Expanded(
        // padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ShipInfoTitle(),
            ShipInfoMenu(children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: GeneralShipInfoWidget(),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: ShipInfoWeaponPage(),
              ),
              Container(),
              Container(),
            ], titles: [
              '总览',
              '武装',
              '运输',
              '其他',
            ]),
            // GeneralShipInfoWidget(),
          ],
        ),
      )
    );
  }
}