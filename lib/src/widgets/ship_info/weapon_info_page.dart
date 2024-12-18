import 'package:flutter/material.dart';
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

Image _buildIcon(String icon_name, Color color, {double size = 20}) {
  return Image.asset(
    'assets/icons/$icon_name.png',
    color: color,
    width: size,
    height: size,
  );
}

// 使用示例
class ShipInfoWeaponPage extends StatefulWidget {
  @override
  _ShipInfoWeaponPageState createState() => _ShipInfoWeaponPageState();
}

class _ShipInfoWeaponPageState extends State<ShipInfoWeaponPage> {
  late List<AdaptiveBlock> blocks;
  late Ship ship;

  @override
  void initState() {
    super.initState();
    _initBlocks();
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
            _buildIcon("shield", Colors.orange),
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
      AdaptiveBlock(
        height: 200,
        backgroundColor: Colors.grey[200],
        subBlockSpacing: 8,
        subBlocks: [
          SubBlock(
            height: 60,
            color: Colors.purple,
            onTap: () => _handleTap(1, 0),
            tooltip: '方块 2-1',
          ),
          SubBlock(
            height: 80,
            color: Colors.red,
            onTap: () => _handleTap(1, 1),
            tooltip: '方块 2-2',
          ),
        ],
      ),
      AdaptiveBlock(
        height: 200,
        backgroundColor: Colors.grey[200],
        subBlockSpacing: 8,
        subBlocks: [
          SubBlock(
            height: 100,
            color: Colors.teal,
            onTap: () => _handleTap(2, 0),
            tooltip: '方块 3-1',
          ),
        ],
      ),
      AdaptiveBlock(
        height: 200,
        backgroundColor: Colors.grey[200],
        subBlockSpacing: 8,
        subBlocks: [
          SubBlock(
            height: 45,
            color: Colors.cyan,
            onTap: () => _handleTap(3, 0),
            tooltip: '方块 4-1',
          ),
          SubBlock(
            height: 45,
            color: Colors.amber,
            onTap: () => _handleTap(3, 1),
            tooltip: '方块 4-2',
          ),
        ],
      ),
    ];
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

  @override
  Widget build(BuildContext context) {

    ship = Provider.of<MainDataModel>(context).currentShipInfo!;

    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEnergyDistributeBlock(),
            _buildCoolerBlock(),
          ],
        ),
      );
  }
}
