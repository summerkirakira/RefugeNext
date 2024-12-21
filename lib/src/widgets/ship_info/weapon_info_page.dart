import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:refuge_next/src/datasource/models/ship_info/ship.dart';
import 'package:refuge_next/src/funcs/ship_info/load_ship_widgets.dart';

class SubBlock {
  final double height;
  final Color? color;
  final VoidCallback? onTap;
  final String? tooltip;

  SubBlock({
    required this.height,
    this.color,
    this.onTap,
    this.tooltip,
  });
}

class AdaptiveBlock {
  final double height;
  final List<SubBlock> subBlocks;
  final Color? backgroundColor;
  final double subBlockSpacing;
  final Widget bottomWidget;

  AdaptiveBlock({
    required this.height,
    required this.subBlocks,
    this.backgroundColor,
    this.subBlockSpacing = 4, // 默认间距
    this.bottomWidget = const Text("雷达"),
  });
}

class AdaptiveBlocks extends StatelessWidget {
  final List<AdaptiveBlock> blocks;
  final Color defaultColor;
  final double spacing;

  const AdaptiveBlocks({
    Key? key,
    required this.blocks,
    this.defaultColor = Colors.grey,
    this.spacing = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(
        blocks.length,
            (index) => Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing / 2),
            child: _buildBlock(blocks[index]),
          ),
        ),
      ),
    );
  }

  Widget _buildBlock(AdaptiveBlock block) {
    return Container(
      height: block.height,
      decoration: BoxDecoration(
        // color: block.backgroundColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: _buildSubBlocks(block),
          ),
          block.bottomWidget,
        ],
      ),
    );
  }

  List<Widget> _buildSubBlocks(AdaptiveBlock block) {
    final List<Widget> children = [];

    for (int i = 0; i < block.subBlocks.length; i++) {
      final subBlock = block.subBlocks[i];

      // 添加子方块
      Widget container = Container(
        height: subBlock.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: subBlock.color ?? defaultColor,
          borderRadius: BorderRadius.circular(2),
        ),
      );

      if (subBlock.onTap != null) {
        container = Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: subBlock.onTap,
            borderRadius: BorderRadius.circular(2),
            child: container,
          ),
        );
      }

      if (subBlock.tooltip != null) {
        container = Tooltip(
          message: subBlock.tooltip!,
          child: container,
        );
      }

      children.add(container);

      // 如果不是最后一个子方块，添加间距
      if (i < block.subBlocks.length - 1) {
        children.add(SizedBox(height: block.subBlockSpacing));
      }
    }

    return children;
  }
}

Widget _buildIcon(String icon_name, {Color color = Colors.lightBlueAccent, double size = 20}) {
  return Padding(
    padding: EdgeInsets.only(top: 4),
    child: Image.asset(
      'assets/icons/$icon_name.png',
      color: color,
      width: size,
      height: size,
    ),
  );
}

// 使用示例
class ShipInfoWeaponPage extends StatefulWidget {
  @override
  _ShipInfoWeaponPageState createState() => _ShipInfoWeaponPageState();
}

class _ShipInfoWeaponPageState extends State<ShipInfoWeaponPage> {
  List<AdaptiveBlock> blocks = [];
  late Ship ship;
  final singleBlockHeight = 20.0;

  @override
  void initState() {
    super.initState();
    // _initBlocks();
  }

  void applyBlocks(List<AdaptiveBlock> newBlocks) {
    setState(() {
      blocks = newBlocks;
    });
  }

  Widget _buildEnergyBottomWidget() {
    return Column(
      children: [
        SizedBox(height: 4),
        Row(
          children: [
            _buildIcon("shield"),
            SizedBox(height: 8),
            Text(
              '能量',
              style: TextStyle(
                fontSize: 14,
                color: Colors.orange,
              ),
            ),
          ],
        )
      ],
    );
  }

  void _initBlocks() {
    blocks = [
      AdaptiveBlock(
        height: 200,
        backgroundColor: Colors.grey[200],
        subBlockSpacing: 8, // 设置子方块间距
        subBlocks: [
          SubBlock(
            height: 40,
            color: Colors.green,
            onTap: () => _handleTap(0, 0),
            tooltip: '方块 1-1',
          ),
          SubBlock(
            height: 30,
            color: Colors.blue,
            onTap: () => _handleTap(0, 1),
            tooltip: '方块 1-2',
          ),
          SubBlock(
            height: 50,
            color: Colors.orange,
            onTap: () => _handleTap(0, 2),
            tooltip: '方块 1-3',
          ),
        ],
        bottomWidget: _buildEnergyBottomWidget(),
      ),
    ];
  }

  AdaptiveBlock _getWeaponEnergyBlock() {
    final subBlocks = <SubBlock>[];
    for (var i = 0; i < ship.weaponFixedPool; i++) {
      subBlocks.add(SubBlock(
        height: singleBlockHeight,
        color: Colors.green,
        onTap: () => _handleTap(0, i),
        tooltip: '武器 ${i + 1}',
      ));
    }
    return AdaptiveBlock(
      height: singleBlockHeight * ship.weaponFixedPool + 100,
      backgroundColor: Colors.grey[200],
      subBlockSpacing: 4,
      subBlocks: subBlocks,
      bottomWidget: _buildIcon("bullets"),
    );
  }

  AdaptiveBlock _getFlightEnergyBlock() {
    final subBlocks = <SubBlock>[];
    for (var i = 0; i < ship.weaponFixedPool; i++) {
      subBlocks.add(SubBlock(
        height: singleBlockHeight,
        color: Colors.green,
        onTap: () => _handleTap(0, i),
        tooltip: '飞行 ${i + 1}',
      ));
    }
    return AdaptiveBlock(
      height: singleBlockHeight * ship.weaponFixedPool + 100,
      backgroundColor: Colors.grey[200],
      subBlockSpacing: 4,
      subBlocks: subBlocks,
      bottomWidget: _buildIcon("speedometer"),
    );
  }

  AdaptiveBlock _getShieldEnergyBlock() {
    final subBlocks = <SubBlock>[];
    final connections = ship.shields.map((shield) => shield.resourceConnection).toList();
    final brickList = getEnergyBricks(connections);

    for (var i = 0; i < brickList.length; i++) {
      subBlocks.add(SubBlock(
        height: singleBlockHeight * brickList[i] + (brickList[i] - 1) * 4,
        color: Colors.green,
        onTap: () => _handleTap(0, i),
        tooltip: '护盾 ${i + 1}',
      ));
    }

    final totalSize = brickList.fold(0, (prev, element) => prev + element);

    return AdaptiveBlock(
      height: singleBlockHeight * totalSize + 100,
      backgroundColor: Colors.grey[200],
      subBlockSpacing: 4,
      subBlocks: subBlocks,
      bottomWidget: _buildIcon("shield"),
    );
  }

  AdaptiveBlock _getQuantumDriveEnergyBlock() {
    final subBlocks = <SubBlock>[];
    final connections = ship.qd!.resourceConnection;
    final brickList = getEnergyBricks([connections]);

    for (var i = 0; i < brickList.length; i++) {
      subBlocks.add(SubBlock(
        height: singleBlockHeight * brickList[i] + (brickList[i] - 1) * 4,
        color: Colors.green,
        onTap: () => _handleTap(0, i),
        tooltip: '量子驱动器 ${i + 1}',
      ));
    }

    final totalSize = brickList.fold(0, (prev, element) => prev + element);

    return AdaptiveBlock(
      height: totalSize * singleBlockHeight + 100,
      backgroundColor: Colors.grey[200],
      subBlockSpacing: 4,
      subBlocks: subBlocks,
      bottomWidget: _buildIcon("atomic"),
    );
  }

  AdaptiveBlock _getRadarEnergyBlock() {
    final subBlocks = <SubBlock>[];
    // final connections = ship.radar!.resourceConnection;
    final brickList = [ship.radar!.size];

    for (var i = 0; i < brickList.length; i++) {
      final height = singleBlockHeight * brickList[i] + (brickList[i] - 1) * 4;
      subBlocks.add(SubBlock(
        height: height > 0 ? height : 0,
        color: Colors.green,
        onTap: () => _handleTap(0, i),
        tooltip: '雷达 ${i + 1}',
      ));
    }

    final totalSize = brickList.fold(0, (prev, element) => prev + element);

    return AdaptiveBlock(
      height: totalSize * singleBlockHeight + 100,
      backgroundColor: Colors.grey[200],
      subBlockSpacing: 4,
      subBlocks: subBlocks,
      bottomWidget: _buildIcon("antenna-signal"),
    );
  }

  AdaptiveBlock _getLifeSupportEnergyBlock() {
    final subBlocks = <SubBlock>[];
    final connections = ship.lifeSupport!.resourceConnection;
    final brickList = getEnergyBricks([connections]);

    for (var i = 0; i < brickList.length; i++) {
      final height = singleBlockHeight * brickList[i] + (brickList[i] - 1) * 4;
      subBlocks.add(SubBlock(
        height: height > 0 ? height : 0,
        color: Colors.green,
        onTap: () => _handleTap(0, i),
        tooltip: '生命支持 ${i + 1}',
      ));
    }

    final totalSize = brickList.fold(0, (prev, element) => prev + element);

    return AdaptiveBlock(
      height: singleBlockHeight * totalSize + 100,
      backgroundColor: Colors.grey[200],
      subBlockSpacing: 4,
      subBlocks: subBlocks,
      bottomWidget: _buildIcon("hospital-sign"),
    );
  }

  AdaptiveBlock _getSingleCoolerEnergyBlock(Cooler cooler) {
    final subBlocks = <SubBlock>[];
    final connections = cooler.resourceConnection;
    final brickList = getEnergyBricks([connections]);

    for (var i = 0; i < brickList.length; i++) {
      final height = singleBlockHeight * brickList[i] + (brickList[i] - 1) * 4;
      subBlocks.add(SubBlock(
        height: height > 0 ? height : 0,
        color: Colors.green,
        onTap: () => _handleTap(0, i),
        tooltip: '冷却器 ${i + 1}',
      ));
    }

    final totalSize = brickList.fold(0, (prev, element) => prev + element);

    return AdaptiveBlock(
      height: singleBlockHeight * totalSize + 100,
      backgroundColor: Colors.grey[200],
      subBlockSpacing: 4,
      subBlocks: subBlocks,
      bottomWidget: _buildIcon("fan"),
    );
  }

  List<AdaptiveBlock> _getCoolerEnergyBlocks() {
    final blocks = <AdaptiveBlock>[];
    for (var i = 0; i < ship.coolers.length; i++) {
      blocks.add(_getSingleCoolerEnergyBlock(ship.coolers[i]));
    }
    return blocks;
  }


  List<AdaptiveBlock> generateEnergyDistributeBlocks() {

    final blocks = [_getWeaponEnergyBlock()];
    blocks.add(_getFlightEnergyBlock());
    blocks.add(_getShieldEnergyBlock());
    if (ship.qd != null) {
      blocks.add(_getQuantumDriveEnergyBlock());
    }
    if (ship.radar != null) {
      blocks.add(_getRadarEnergyBlock());
    }
    if (ship.lifeSupport != null) {
      blocks.add(_getLifeSupportEnergyBlock());
    }
    blocks.addAll(_getCoolerEnergyBlocks());

    return blocks;
  }


  void _handleTap(int blockIndex, int subBlockIndex) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('点击了第 ${blockIndex + 1} 个方块的第 ${subBlockIndex + 1} 个子方块'),
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  Widget _buildEnergyDistributeBlock() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '能量分配',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            AdaptiveBlocks(blocks: blocks),
          ],
        ),
      ),
    );
  }
  
  Widget _buildCoolerBlock() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  '冷却器',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            SizedBox(height: 16),
            for(int i = 0; i < ship.coolers.length; i++)
              getCoolerWidget(ship.coolers[i]),
          ],
        ),
      ),
    );
  }

  Widget _buildRadarBlock() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  '雷达',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            SizedBox(height: 16),
            getRadarWidget(ship.radar!),
          ],
        ),
      ),
    );
  }

  Widget _buildTurretBlock() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  '炮塔',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            SizedBox(height: 16),
            for(int i = 0; i < ship.turrets.length; i++)
              getTurretWidget(ship.turrets[i]),
          ],
        ),
      ),
    );
  }

  Widget _buildWeaponBlock() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  '武器',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            SizedBox(height: 16),
            for(int i = 0; i < ship.weapons.length; i++)
              getWeaponWidget(ship.weapons[i]),
          ],
        ),
      ),
    );
  }

  Widget _buildMissileRackBlock() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  '导弹',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            SizedBox(height: 16),
            for(int i = 0; i < ship.missileRacks.length; i++)
              getMissileRackWidget(ship.missileRacks[i]),
          ],
        ),
      ),
    );
  }

  Widget _buildPowerPlantBlock() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  '发电机',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            SizedBox(height: 16),
            for(int i = 0; i < ship.powerPlants.length; i++)
              getPowerPlantWidget(ship.powerPlants[i]),
          ],
        ),
      ),
    );
  }

  Widget _buildLifeSupportBlock() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  '生命支持',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            SizedBox(height: 16),
            getLifeSupportWidget(ship.lifeSupport!)
          ],
        ),
      ),
    );
  }

  Widget _buildShieldBlock() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  '护盾',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            SizedBox(height: 16),
            for(int i = 0; i < ship.shields.length; i++)
              getShieldWidget(ship.shields[i]),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantumDriveBlock() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  '量子驱动器',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            SizedBox(height: 16),
            getQuantumDriveWidget(ship.qd!),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    ship = Provider.of<MainDataModel>(context).currentShipInfo!;
    blocks = generateEnergyDistributeBlocks();

    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEnergyDistributeBlock(),
            _buildTurretBlock(),
            if (ship.weapons.isNotEmpty)
              _buildWeaponBlock(),
            if (ship.missileRacks.isNotEmpty)
              _buildMissileRackBlock(),
            _buildShieldBlock(),
            _buildCoolerBlock(),
            if (ship.lifeSupport != null)
              _buildLifeSupportBlock(),
            if (ship.radar != null)
              _buildRadarBlock(),
            if (ship.qd != null)
              _buildQuantumDriveBlock(),
            _buildPowerPlantBlock(),
          ],
        ),
      );
  }
}
