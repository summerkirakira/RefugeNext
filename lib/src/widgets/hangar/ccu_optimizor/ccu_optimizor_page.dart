import 'dart:async';

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
import '../../../repo/ship_alias.dart';


class ProductUpgradeWidget extends StatefulWidget {
  const ProductUpgradeWidget({Key? key}) : super(key: key);

  @override
  _ProductUpgradeWidgetState createState() => _ProductUpgradeWidgetState();
}

class _ProductUpgradeWidgetState extends State<ProductUpgradeWidget> {
  String? _startProduct;
  String? _endProduct;
  List<UpgradeStep> _upgradePath = [];

  UpgradeSettings _upgradeSettings = UpgradeSettings();

  final allShips = getValidateUpdateShips();

  // 已屏蔽的升级列表
  List<String> _blockedUpgrades = ['Product B to Product C', 'Product D to Product E'];

  final List<String> _products = ['Product A', 'Product B', 'Product C', 'Product D', 'Product E'];

  List<String> _fromShips = [];

  List<String> _toShips = [];

  List<UpgradeStep> currentUpgradePath = [];

  Future<void> _calculateUpgradePath() async {

    if (_startProduct == null || _endProduct == null) {
      showToast(message: '请选择起始和目标舰船');
      return;
    }

    final fromShip = allShips.firstWhere((element) => element.chineseName == _startProduct);
    final toShip = allShips.firstWhere((element) => element.chineseName == _endProduct);

    final hangarItems = Provider.of<MainDataModel>(context, listen: false).rawHangarItems;
    final result = await updateUpgradeSteps(_upgradeSettings, fromShip.id, toShip.id, hangarItems);

    setState(() {
      _upgradePath = result;
    });
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


  Widget getTotalInfoWidget() {
    int totalCost = 0;

    for (var path in currentUpgradePath) {
      totalCost += path.cost;
    }

    return Container();

    // return
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
                        title: Text(_blockedUpgrades[index]),
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

  void _showAddBlockedUpgradeDialog(BuildContext modalContext) {
    String? fromProduct;
    String? toProduct;

    showDialog(
      context: modalContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Blocked Upgrade'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomDropdown<String>(
                hintText: 'From Product',
                items: _products,
                onChanged: (value) {
                  fromProduct = value;
                },
              ),
              SizedBox(height: 8),
              CustomDropdown<String>(
                hintText: 'To Product',
                items: _products,
                onChanged: (value) {
                  toProduct = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (fromProduct != null && toProduct != null) {
                  setState(() {
                    _blockedUpgrades.add('$fromProduct to $toProduct');
                  });
                  Navigator.of(context).pop();
                  // 重新构建模态框以反映更改
                  // WoltModalSheet.changePageTo(
                  //   pageIndex: 0,
                  //   context: modalContext,
                  // );
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _removeUpgradeStep(int index) {
    setState(() {
      _upgradePath.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    _fromShips = allShips.map((e) => e.chineseName!).toList();
    _toShips = allShips.map((e) => e.chineseName!).toList();

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 180.0,
          floating: false,
          pinned: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        '舰船升级规划器',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Spacer(),
                      IconButton(
                        icon: const Icon(Icons.settings, color: Colors.white),
                        onPressed: _openUpgradeSettings,
                        tooltip: 'Upgrade Settings',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Theme(data: FlexColorScheme.light(
                      scheme: FlexScheme.blue).toTheme,
                      child: CustomDropdown<String>.search(
                        hintText: '选择起始舰船',
                        searchHintText: '搜索舰船',
                        items: _fromShips,
                        initialItem: _startProduct,
                        onChanged: (value) {
                          setState(() {
                            _startProduct = value;
                          });
                        },
                      ),
                  ),

                  const SizedBox(height: 8),
                  Theme(data: FlexColorScheme.light(
                      scheme: FlexScheme.blue).toTheme,
                      child: CustomDropdown<String>.search(
                        hintText: '选择目标舰船',
                        searchHintText: '搜索舰船',
                        items: _toShips,
                        initialItem: _endProduct,
                        onChanged: (value) {
                          setState(() {
                            _endProduct = value;
                          });
                        },
                      ),
                  )
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _calculateUpgradePath,
              child: const Text('计算升级路径'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ),
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
    Color backgroundColor = Colors.blue.withOpacity(0.5);
    if (label == '机库中') {
      backgroundColor = Colors.green[800]!.withOpacity(0.5);
    } else if (label == '回购中') {
      backgroundColor = Colors.red[800]!.withOpacity(0.5);
    } else if (label == '历史WB') {
      backgroundColor = Colors.orange[800]!.withOpacity(0.5);
    }

    return Chip(
      label: Text(label),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      labelStyle: const TextStyle(color: Colors.white),
      backgroundColor: backgroundColor,
    );
  }

  Widget _buildUpgradeCard(UpgradeStep upgradeStep, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "\$${upgradeStep.fromShip.getHighestSku() ~/ 100}",
                                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                upgradeStep.fromProduct,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$${upgradeStep.toShip.getHighestSku() ~/ 100}",
                                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                upgradeStep.toProduct,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                      Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,

                            child: Column(
                              children: [
                                Icon(Icons.arrow_forward, size: 30),
                                Text(
                                  '\$${upgradeStep.cost ~/ 100}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                      )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [],
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: upgradeStep.tags.map((tag) => customChip(tag)).toList(),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => _removeUpgradeStep(index),
              tooltip: 'Remove Upgrade Step',
            ),
          ),
          Positioned(
            bottom: 16,
            right: 50,
            child: IconButton(
              icon: const Icon(Icons.push_pin_outlined),
              onPressed: () => _removeUpgradeStep(index),
              tooltip: 'Remove Upgrade Step',
            ),
          ),
        ],
      ),
    );
  }
}
