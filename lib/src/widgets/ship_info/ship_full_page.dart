import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/widgets/ship_info/cargo_page.dart';
import 'package:refuge_next/src/widgets/ship_info/general_ship_info_widget.dart';
import 'package:refuge_next/src/widgets/ship_info/paints_info_page.dart';
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
  final ShipInfoRepo _shipInfoRepo = ShipInfoRepo();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeShipInfo();
  }

  Future<void> _initializeShipInfo() async {
    // 使用 addPostFrameCallback 确保 context 可用
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final dataModel = Provider.of<MainDataModel>(context, listen: false);

      // 如果已经有当前船只信息，不需要继续初始化
      if (dataModel.currentShipInfo != null) {
        setState(() => _isLoading = false);
        return;
      }

      // 检查是否有本地数据
      if (_shipInfoRepo.getShipsSync().isEmpty) {
        // 没有本地数据，需要获取
        await _shipInfoRepo.getShips();
      }

      // 获取第一艘船的信息
      final ships = _shipInfoRepo.getShipsSync();
      if (ships.isNotEmpty) {
        dataModel.setCurrentShipInfo(ships[0]);
      }

      setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 如果正在加载，显示加载指示器
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // 检查当前是否有船只信息
    final currentShip = Provider.of<MainDataModel>(context).currentShipInfo;
    if (currentShip == null) {
      return const Scaffold(
        body: Center(child: Text('No ship information available')),
      );
    }

    // 主界面
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ShipInfoTitle(),
            ShipInfoMenu(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: GeneralShipInfoWidget(),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ShipInfoWeaponPage(),
                ),
                CargoPage(),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: PaintInfoPage(),
                )
              ],
              titles: const ['总览', '武装', '运输', '涂装'],
            ),
          ],
        ),
      ),
    );
  }
}
