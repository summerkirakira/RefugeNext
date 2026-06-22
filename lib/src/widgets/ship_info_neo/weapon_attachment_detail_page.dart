import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/weapon_attachment.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart';

/// 武器配件详情测试页:复用通用 [GameItemDetailPage]。
///
/// 无系统页、无弹药/配件页;参数页展示配件的武器修正 / 瞄具 / 激光指示器。
/// 仅作开发调试用。
class AttachmentDetailPage extends StatelessWidget {
  const AttachmentDetailPage({
    super.key,
    this.initialItem,
    this.allowSwitch = true,
  });

  /// 指定展示的配件;为 null 时取本地第一条。
  final GameItem? initialItem;

  /// 是否显示「切换」按钮(测试页为 true)。
  final bool allowSwitch;

  @override
  Widget build(BuildContext context) {
    return GameItemDetailPage(
      title: '武器配件详情',
      loadItems: () => WeaponAttachmentRepo().getWeaponAttachments(),
      initialItem: initialItem,
      allowSwitch: allowSwitch,
      fallbackIcon: Icons.build_circle_outlined,
      showSystemTab: false,
      fullDescriptionData: true,
      descriptionLastLine: true,
      paramSpec: weaponAttachmentParamSpec,
    );
  }
}

/// 武器配件「参数」页:修正(武器加成)/ 瞄具 / 激光指示器。
final weaponAttachmentParamSpec = GameItemParamSpec(
  tabTitle: '参数',
  buildCards: (item) {
    final w = item.weaponModifier;
    final base = w?.base_;
    final recoil = w?.recoil;
    final sight = item.ironSight;
    final laser = item.laserPointer;

    // 仅当 multiplier 有变化(非 null 且 != 1.0)才显示,用 ±% 表示。
    Widget? modRow(String label, double? m) =>
        (m != null && m != 1.0) ? itemRow(label, fmtMult(m)) : null;

    return [
      // 修正(武器加成)
      itemCard('修正', itemRows([
        modRow('伤害', base?.damageMultiplier),
        modRow('射速', base?.fireRateMultiplier),
        modRow('弹速', base?.projectileSpeedMultiplier),
        modRow('弹药消耗', base?.ammoCostMultiplier),
        modRow('发热', base?.heatGenerationMultiplier),
        modRow('枪口火光', base?.muzzleFlashMultiplier),
        modRow('声音半径', base?.soundRadiusMultiplier),
        modRow('充能时间', base?.chargeTimeMultiplier),
        modRow('后坐力', recoil?.multiplier),
        modRow('后坐力衰减', recoil?.decayMultiplier),
      ])),
      // 瞄具(光学瞄具)
      if (sight != null)
        itemCard('瞄具', itemRows([
          itemRow('倍率', fmtNum(sight.zoomScale), unit: '×'),
          itemRow('最大归零', fmtNum(sight.maxRange), unit: 'm'),
          itemRow('归零步进', fmtNum(sight.rangeIncrement), unit: 'm'),
          itemRow('默认归零', fmtNum(sight.defaultRange), unit: 'm'),
          itemRow('自动归零耗时', fmtNum(sight.autoZeroingTime), unit: 's'),
        ])),
      // 激光指示器
      if (laser != null)
        itemCard('激光指示器', itemRows([
          itemRow('射程', fmtNum(laser.range), unit: 'm'),
          itemRow('颜色', laser.colorCss),
        ])),
    ];
  },
);
