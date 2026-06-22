import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/power_plant.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart';

/// 发电机详情测试页:复用通用 [GameItemDetailPage],仅注入发电机专属的「参数」页。
///
/// 头部与 总览/系统/购买 三页由通用页提供;参数页展示发电机的电力参数
/// (冷却用量 / 功率生成,均来自 resourceNetwork.usage,单位段)。仅作开发调试用。
class PowerPlantDetailPage extends StatelessWidget {
  const PowerPlantDetailPage({
    super.key,
    this.initialItem,
    this.allowSwitch = true,
  });

  /// 指定展示的发电机;为 null 时取本地第一条。
  final GameItem? initialItem;

  /// 是否显示「切换」按钮(测试页为 true)。
  final bool allowSwitch;

  @override
  Widget build(BuildContext context) {
    return GameItemDetailPage(
      title: '发电机详情',
      loadItems: () => PowerPlantRepo().getPowerPlants(),
      initialItem: initialItem,
      allowSwitch: allowSwitch,
      fallbackIcon: Icons.power_outlined,
      paramSpec: powerPlantParamSpec,
    );
  }
}

/// 发电机「参数」页:电力参数(冷却用量 / 功率生成)。
///
/// 两者均来自 `resourceNetwork.usage`(以「段」计),min==max 时显示单值。
final powerPlantParamSpec = GameItemParamSpec(
  tabTitle: '参数',
  buildCards: (item) {
    final u = item.resourceNetwork?.usage;
    return [
      itemCard('电力参数', [
        itemStatRow('冷却用量',
            itemRangeText(u?.coolant?.min, u?.coolant?.max, unit: '段')),
        itemStatRow('功率生成',
            itemRangeText(u?.power?.min, u?.power?.max, unit: '段')),
      ]),
    ];
  },
);
