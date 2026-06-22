import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/cooler.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart';

/// 冷却器详情测试页:复用通用 [GameItemDetailPage],仅注入冷却器专属的「参数」页。
///
/// 头部与 总览/系统/购买 三页由通用页提供;参数页展示冷却器的冷却参数
/// (功率用量 / 冷却生成,均来自 resourceNetwork.usage,单位段)。仅作开发调试用。
class CoolerDetailPage extends StatelessWidget {
  const CoolerDetailPage({
    super.key,
    this.initialItem,
    this.allowSwitch = true,
  });

  /// 指定展示的冷却器;为 null 时取本地第一条。
  final GameItem? initialItem;

  /// 是否显示「切换」按钮(测试页为 true)。
  final bool allowSwitch;

  @override
  Widget build(BuildContext context) {
    return GameItemDetailPage(
      title: '冷却器详情',
      loadItems: () => CoolerRepo().getCoolers(),
      initialItem: initialItem,
      allowSwitch: allowSwitch,
      fallbackIcon: Icons.ac_unit_outlined,
      paramSpec: coolerParamSpec,
    );
  }
}

/// 冷却器「参数」页:冷却参数(功率用量 / 冷却生成)。
///
/// 两者均来自 `resourceNetwork.usage`(以「段」计),min==max 时显示单值。
/// 与发电机镜像:冷却器消耗功率(usage.power)、提供冷却(usage.coolant)。
final coolerParamSpec = GameItemParamSpec(
  tabTitle: '参数',
  buildCards: (item) {
    final u = item.resourceNetwork?.usage;
    return [
      itemCard('冷却参数', [
        itemStatRow('功率用量',
            itemRangeText(u?.power?.min, u?.power?.max, unit: '段')),
        itemStatRow('冷却生成',
            itemRangeText(u?.coolant?.min, u?.coolant?.max, unit: '段')),
      ]),
    ];
  },
);
