import 'dart:async';
import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/widgets/hangar/ccu_optimizor/utils.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../datasource/data_model.dart';


class ProductUpgradeWidget extends StatefulWidget {
  const ProductUpgradeWidget({Key? key}) : super(key: key);

  @override
  _ProductUpgradeWidgetState createState() => _ProductUpgradeWidgetState();
}

class _ProductUpgradeWidgetState extends State<ProductUpgradeWidget> with AutomaticKeepAliveClientMixin {
  String? _startProduct;
  String? _endProduct;
  List<UpgradeStep> _upgradePath = [];

  UpgradeSettings _upgradeSettings = UpgradeSettings();

  final allShips = getValidateUpdateShips();

  // 已屏蔽的升级列表
  List<UpgradeStep> _blockedUpgrades = [];
  List<UpgradeStep> _mustHaveUpgrades = [];

  List<String> _fromShips = [];

  List<String> _toShips = [];

  Future<void> __calculateUpgradePath() async {

    if (_startProduct == null || _endProduct == null) {
      showToast(message: '请选择起始和目标舰船');
      return;
    }

    final fromShip = allShips.firstWhere((element) => element.chineseName == _startProduct);
    final toShip = allShips.firstWhere((element) => element.chineseName == _endProduct);

    if (fromShip.getHighestSku() >= toShip.getHighestSku()) {
      showToast(message: '目标舰船价格必须高于起始舰船');
      return;
    }

    List<int> bannedShips = [];
    for (var upgrade in _blockedUpgrades) {
      bannedShips.add(upgrade.fromShip.id);
      bannedShips.add(upgrade.toShip.id);
    }

    List<int> mustHaveShips = [];
    for (var upgrade in _mustHaveUpgrades) {
      mustHaveShips.add(upgrade.fromShip.id);
      mustHaveShips.add(upgrade.toShip.id);
    }


    final hangarItems = Provider.of<MainDataModel>(context, listen: false).rawHangarItems;
    final result = await updateUpgradeSteps(_upgradeSettings, fromShip.id, toShip.id, hangarItems, bannedShips, mustHaveShips);

    setState(() {
      _upgradePath = result;
    });
  }

  Future<void> _calculateUpgradePath() async {

    final isVip = Provider.of<MainDataModel>(context, listen: false).isVIP;
    if (!isVip) {
      showVipAlert(context: context, move: true);
      return;
    }

    try {
      await __calculateUpgradePath();
    } catch (e) {
      _blockedUpgrades = [];
      _mustHaveUpgrades = [];
      showToast(message: '升级路线计算失败QAQ$e');
    }

  }

  @override
  void initState() {
    super.initState();
    getUpgradeSettings().then((value) {
      setState(() {
        _upgradeSettings = value;
      });
    });
  }

  void _openUpgradeSettings() {
    WoltModalSheet.show<void>(
      context: context,
      pageListBuilder: (BuildContext modalContext) {
        return [
          _buildSettingsPage(modalContext),
        ];
      },
    );
  }

  String getBannedText(UpgradeStep item) {
    return '${item.fromProduct} 到 ${item.toProduct}';
  }


  Widget getTotalInfoWidget() {
    if (_upgradePath.isEmpty) {
      return Container();
    }

    int totalHangarCost = 0;
    int totalCreditCost = 0;
    int totalWbCost = 0;
    int originalCost = _upgradePath.last.toShip.getHighestSku() - _upgradePath.first.fromShip.getHighestSku();

    for (var path in _upgradePath) {
      if (path.tags.first == '机库中') {
        totalHangarCost += path.cost;
      } else if (path.tags.first == '历史WB') {
        totalWbCost += path.cost;
      } else {
        totalCreditCost += path.cost;
      }
    }

    int totalNewCost = (totalCreditCost + totalHangarCost + totalWbCost) ~/ 100;
    int savings = (originalCost ~/ 100) - totalNewCost;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.1),
            Theme.of(context).primaryColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // 头部标题
          Row(
            children: [
              Icon(
                Icons.calculate,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                '成本分析',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const Spacer(),
              if (savings > 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.green.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.trending_down, color: Colors.green, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '节省 \$${savings}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          // 价格对比
          IntrinsicHeight(
            child: Row(
              children: [
                // 原价
                Expanded(
                  child: _buildPriceCard(
                    title: '原价',
                    price: originalCost ~/ 100,
                    color: Colors.grey,
                    icon: Icons.local_offer_outlined,
                  ),
                ),
                Container(
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor.withOpacity(0.3),
                  ),
                ),
                // 现价
                Expanded(
                  child: _buildPriceCard(
                    title: '现价',
                    price: totalNewCost,
                    color: Colors.green,
                    icon: Icons.price_change,
                  ),
                ),
                Container(
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor.withOpacity(0.3),
                  ),
                ),
                // 已拥有
                Expanded(
                  child: _buildPriceCard(
                    title: '已拥有',
                    price: totalHangarCost ~/ 100,
                    color: Colors.blue,
                    icon: Icons.inventory_2_outlined,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceCard({
    required String title,
    required int price,
    required Color color,
    required IconData icon,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        const SizedBox(height: 8),
        Text(
          '\$${price}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }



  WoltModalSheetPage _buildSettingsPage(BuildContext modalContext) {
    return WoltModalSheetPage(
      navBarHeight: 50,
      pageTitle: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('升级设置',
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
      topBarTitle: Text('升级设置', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      isTopBarLayerAlwaysVisible: false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CCU来源'
              ),
              SizedBox(height: 16),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
                  return Column(
                    children: [
                      SwitchListTile(
                        title: Text('使用回购CCU'),
                        value: _upgradeSettings.useBuyback,
                        onChanged: (bool value) async {
                          setModalState(() {
                            _upgradeSettings.useBuyback = value;
                          });
                          setState(() {
                            _upgradeSettings.useBuyback = value;
                          });

                          await saveUpgradeSettings(_upgradeSettings);

                        },
                      ),
                      SwitchListTile(
                        title: Text('使用机库CCU'),
                        value: _upgradeSettings.useHangar,
                        onChanged: (bool value) {
                          setModalState(() {
                            _upgradeSettings.useHangar = value;
                          });
                          setState(() {
                            _upgradeSettings.useHangar = value;
                          });

                          saveUpgradeSettings(_upgradeSettings);
                        },
                      ),
                      SwitchListTile(
                        title: Text('使用历史WB'),
                        value: _upgradeSettings.useHistory,
                        onChanged: (bool value) async {
                          setModalState(() {
                            _upgradeSettings.useHistory = value;
                          });
                          setState(() {
                            _upgradeSettings.useHistory = value;
                          });

                          await saveUpgradeSettings(_upgradeSettings);

                        },
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 24),
              Text(
                '已屏蔽升级'
              ),
              SizedBox(height: 8),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _blockedUpgrades.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(getBannedText(_blockedUpgrades[index])),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setModalState(() {
                              _blockedUpgrades.removeAt(index);
                            });
                            setState(() {});
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 16),
              // ElevatedButton(
              //   child: Text('Add Blocked Upgrade'),
              //   onPressed: () {
              //     _showAddBlockedUpgradeDialog(modalContext);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }


  void _removeUpgradeStep(int index) {
    _blockedUpgrades.add(_upgradePath[index]);
    _calculateUpgradePath();
    setState(() {

    });
  }

  void _addMustHaveUpgradeStep(int index) {
    bool isFound = false;
    for (var upgrade in _mustHaveUpgrades) {
      if (upgrade.fromProduct == _upgradePath[index].fromProduct && upgrade.toProduct == _upgradePath[index].toProduct) {
        isFound = true;
        break;
      }
    }
    if (isFound) {
      _mustHaveUpgrades = _mustHaveUpgrades.where((element) => element.fromProduct != _upgradePath[index].fromProduct || element.toProduct != _upgradePath[index].toProduct).toList();
      _calculateUpgradePath();
      return;
    }
    _mustHaveUpgrades.add(_upgradePath[index]);
    _calculateUpgradePath();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    _fromShips = allShips.map((e) => e.chineseName!).toList();
    _toShips = allShips.map((e) => e.chineseName!).toList();

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: (Platform.isIOS | Platform.isAndroid) ? 220 : 260,
          floating: false,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.8),
                    Theme.of(context).primaryColor,
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 6,
                  bottom: 6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 头部标题和按钮区域
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '舰船升级规划器',
                              style: TextStyle(
                                fontSize: 24, 
                                fontWeight: FontWeight.bold, 
                                color: Colors.white,
                                letterSpacing: 1.0,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '智能CCU链优化',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.save_outlined, color: Colors.white, size: 20),
                                onPressed: () => showSaveSlotSelector(context),
                                tooltip: '保存方案',
                                padding: const EdgeInsets.all(8),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.tune, color: Colors.white, size: 20),
                                onPressed: _openUpgradeSettings,
                                tooltip: '升级设置',
                                padding: const EdgeInsets.all(8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    // 选择器区域
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.rocket_launch,
                                color: Theme.of(context).primaryColor,
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '选择升级路径',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Theme(
                            data: FlexColorScheme.light(scheme: FlexScheme.blue).toTheme,
                            child: CustomDropdown<String>.search(
                              decoration: getUpgradeDropdownDecoration(Theme.of(context).brightness == Brightness.dark),
                              hintText: '选择起始舰船',
                              searchHintText: '搜索舰船名称...',
                              items: _fromShips,
                              initialItem: _startProduct,
                              onChanged: (value) {
                                _blockedUpgrades = [];
                                _mustHaveUpgrades = [];
                                setState(() {
                                  _startProduct = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Theme(
                            data: FlexColorScheme.light(scheme: FlexScheme.blue).toTheme,
                            child: CustomDropdown<String>.search(
                              hintText: '选择目标舰船',
                              searchHintText: '搜索舰船名称...',
                              items: _toShips,
                              initialItem: _endProduct,
                              onChanged: (value) {
                                _blockedUpgrades = [];
                                _mustHaveUpgrades = [];
                                setState(() {
                                  _endProduct = value;
                                });
                              },
                              decoration: getUpgradeDropdownDecoration(Theme.of(context).brightness == Brightness.dark),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor.withOpacity(0.8),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _calculateUpgradePath,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.auto_fix_high,
                          color: Colors.white,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '计算最优升级路线',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                getTotalInfoWidget(),
              ],
            ),
          ),
        ),
        if (_upgradePath.isEmpty)
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(32),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(context).dividerColor.withOpacity(0.2),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.route,
                    size: 64,
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '暂无升级路径',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '请选择起始和目标舰船，然后点击计算按钮来生成最优升级方案',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildUpgradeCard(_upgradePath[index], index);
              },
              childCount: _upgradePath.length,
            ),
          ),
      ],
    );
  }
  
  Widget customChip(String label) {
    Color backgroundColor;
    IconData icon;
    
    switch (label) {
      case '机库中':
        backgroundColor = Colors.green;
        icon = Icons.inventory_2;
        break;
      case '回购中':
        backgroundColor = Colors.red;
        icon = Icons.restore;
        break;
      case '历史WB':
        backgroundColor = Colors.orange;
        icon = Icons.history;
        break;
      default:
        backgroundColor = Colors.blue;
        icon = Icons.shopping_cart;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: backgroundColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: backgroundColor,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: backgroundColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpgradeCard(UpgradeStep upgradeStep, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 升级信息区域
                Row(
                  children: [
                    // 起始舰船
                    Expanded(
                      flex: 2,
                      child: _buildShipInfo(
                        shipName: upgradeStep.fromProduct,
                        price: upgradeStep.fromShip.getHighestSku() ~/ 100,
                        isSource: true,
                      ),
                    ),
                    // 箭头和成本
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '+\$${upgradeStep.cost ~/ 100}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 目标舰船
                    Expanded(
                      flex: 2,
                      child: _buildShipInfo(
                        shipName: upgradeStep.toProduct,
                        price: upgradeStep.toShip.getHighestSku() ~/ 100,
                        isSource: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // 标签区域
                Row(
                  children: [
                    Icon(
                      Icons.label,
                      size: 16,
                      color: Theme.of(context).primaryColor.withOpacity(0.7),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: upgradeStep.tags.map((tag) => customChip(tag)).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 操作按钮
          Positioned(
            bottom: 8,
            right: 8,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (index != 0)
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context).dividerColor.withOpacity(0.3),
                      ),
                    ),
                    child: IconButton(
                      icon: getPushPinIcon(index),
                      onPressed: () => _addMustHaveUpgradeStep(index),
                      tooltip: '固定该升级步骤',
                      iconSize: 18,
                      padding: const EdgeInsets.all(8),
                    ),
                  ),
                if (index != 0) const SizedBox(width: 4),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.red.withOpacity(0.3),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () => _removeUpgradeStep(index),
                    tooltip: '移除该升级步骤',
                    iconSize: 18,
                    padding: const EdgeInsets.all(8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShipInfo({
    required String shipName,
    required int price,
    required bool isSource,
  }) {
    return Column(
      crossAxisAlignment: isSource ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          '\$${price}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isSource ? Colors.grey[600] : Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          shipName,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: isSource ? TextAlign.left : TextAlign.right,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget getPushPinIcon(int index) {
    bool isFound = false;
    for (var upgrade in _mustHaveUpgrades) {
      if (upgrade.fromProduct == _upgradePath[index].fromProduct && upgrade.toProduct == _upgradePath[index].toProduct) {
        isFound = true;
        break;
      }
    }

    if (isFound) {
      return Icon(
        Icons.push_pin,
        color: Theme.of(context).primaryColor,
        size: 18,
      );
    } else {
      return Icon(
        Icons.push_pin_outlined,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        size: 18,
      );
    }
  }

  Future<void> showSaveSlotSelector(BuildContext context) async {
    final slots =  await getSlotsFromStorage(10);
    WoltModalSheet.show<int>(
      context: context,
      pageListBuilder: (BuildContext modalContext) {
        return [
          WoltModalSheetPage(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            hasSabGradient: false,
            pageTitle: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('选择保存槽位',
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
            topBarTitle: Text('选择保存槽位', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            isTopBarLayerAlwaysVisible: false,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: List.generate(10, (index) {
                  return ListTile(
                    title: Text('槽位 ${index + 1} (${slots[index]})'),
                    onTap: () {

                      if (_upgradePath.isEmpty) {
                        showToast(message: '当前升级链为空~');
                        return;
                      }

                      saveStepsToStorage(_upgradePath, index);
                      showToast(message: '升级链保存成功~后续可在机库搜索菜单中进行筛选~');
                      Navigator.of(modalContext).pop(index);
                    },
                    trailing: Icon(Icons.save),
                  );
                }),
              ),
            ),
          ),
        ];
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

