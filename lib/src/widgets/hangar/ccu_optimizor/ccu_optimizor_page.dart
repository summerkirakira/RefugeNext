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

    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        // top: 16,
        bottom: 8,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // Text('\$'),
                      Text('${originalCost ~/ 100}', style: TextStyle(fontSize: 40),)
                    ],
                  ),
                  Text('原价(\$)'),
                ],
              ),
              VerticalDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // Text('\$', style: TextStyle(color: Colors.green)),
                      Text('${(totalCreditCost + totalHangarCost + totalWbCost) ~/ 100}', style: TextStyle(fontSize: 40, color: Colors.green),)
                    ],
                  ),
                  Text('现价(\$)', style: TextStyle(color: Colors.green)),
                ],
              ),
              VerticalDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // Text('\$', style: TextStyle(color: Colors.blue)),
                      Text('${totalHangarCost ~/ 100}', style: TextStyle(fontSize: 40, color: Colors.blue),)
                    ],
                  ),
                  Text('已拥有(\$)', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
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

    _fromShips = allShips.map((e) => e.chineseName!).toList();
    _toShips = allShips.map((e) => e.chineseName!).toList();

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: (Platform.isIOS | Platform.isAndroid) ? 185 : 240,
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
                        icon: const Icon(Icons.save, color: Colors.white),
                        onPressed: () => showSaveSlotSelector(context),
                        tooltip: 'Upgrade Settings',
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings, color: Colors.white),
                        onPressed: _openUpgradeSettings,
                        tooltip: 'Upgrade Settings',
                      ),
                    ],
                  ),
                  // const SizedBox(height: 16),
                  Spacer(),
                  Theme(data: FlexColorScheme.light(
                      scheme: FlexScheme.blue).toTheme,
                      child: CustomDropdown<String>.search(
                        decoration: getUpgradeDropdownDecoration(Theme.of(context).brightness == Brightness.dark),
                        hintText: '选择起始舰船',
                        searchHintText: '搜索舰船',
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
                  if (!Platform.isIOS && !Platform.isAndroid)
                    const SizedBox(height: 12),
                  const SizedBox(height: 8),
                  Theme(data: FlexColorScheme.light(
                      scheme: FlexScheme.blue).toTheme,
                      child: CustomDropdown<String>.search(
                        hintText: '选择目标舰船',
                        searchHintText: '搜索舰船',
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
                  )
                ],
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
                ElevatedButton(
                  onPressed: _calculateUpgradePath,
                  child: const Text('计算升级路线'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
                const SizedBox(height: 16),
                getTotalInfoWidget(),
              ],
            )
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
                                  '+\$${upgradeStep.cost ~/ 100}',
                                  style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor.withOpacity(0.5)),
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
            bottom: 10,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => _removeUpgradeStep(index),
              tooltip: 'Remove Upgrade Step',
            ),
          ),
          if (index !=0)
          Positioned(
            bottom: 8,
            right: 50,
            child: IconButton(
              icon: getPushPinIcon(index),
              onPressed: () => _addMustHaveUpgradeStep(index),
              tooltip: 'Remove Upgrade Step',
            ),
          ),
        ],
      ),
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
      return Icon(Icons.push_pin, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),);
    } else {
      return Icon(Icons.push_pin_outlined, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),);
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

