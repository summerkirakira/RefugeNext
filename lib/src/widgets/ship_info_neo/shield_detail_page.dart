import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/shield.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart';

/// 护盾详情测试页:复用通用 [GameItemDetailPage],仅注入护盾专属的「参数」页。
///
/// 头部与 总览/系统/购买 三页由通用页提供;参数页展示护盾独有的
/// 护盾 / 储备池 / 回复延迟 / 吸收 / 抗性。仅作开发调试用。
class ShieldDetailPage extends StatelessWidget {
  const ShieldDetailPage({
    super.key,
    this.initialShield,
    this.allowSwitch = true,
  });

  /// 指定展示的护盾;为 null 时取本地第一条。
  final GameItem? initialShield;

  /// 是否显示「切换护盾」按钮(测试页为 true)。
  final bool allowSwitch;

  @override
  Widget build(BuildContext context) {
    return GameItemDetailPage(
      title: '护盾详情',
      loadItems: () => ShieldRepo().getShields(),
      initialItem: initialShield,
      allowSwitch: allowSwitch,
      fallbackIcon: Icons.shield_outlined,
      paramSpec: shieldParamSpec,
    );
  }
}

/// 护盾「参数」页:护盾 / 储备池 / 回复延迟 / 吸收 / 抗性。
final shieldParamSpec = GameItemParamSpec(
  tabTitle: '参数',
  buildCards: (item) {
    final s = item.shield;
    return [
      // Shield
      itemCard('护盾', itemRows([
        itemRow('最大血量', fmtNum(s?.maxHealth), unit: 'HP', orange: true),
        itemRow('回复速率', fmtNum(s?.regenRate), unit: 'HP/s'),
        itemRow('回复时间', fmtNum(s?.regenTime), unit: 's'),
        itemRow('衰减比', fmtNum(s?.decayRatio)),
      ])),
      // Reserve Pool
      itemCard('储备池', itemRows([
        itemRow('回复速率', fmtNum(s?.reservePool?.regenRate), unit: 'HP/s'),
        itemRow('回复时间', fmtNum(s?.reservePool?.regenTime), unit: 's'),
        itemRow('抽取速率比', fmtNum(s?.reservePool?.drainRateRatio)),
        itemRow('初始血量比', fmtPctRatio(s?.reservePool?.initialHealthRatio)),
        itemRow('最大血量比', fmtPctRatio(s?.reservePool?.maxHealthRatio)),
      ])),
      // Regen Delay
      itemCard('回复延迟', itemRows([
        itemRow('击穿', fmtNum(s?.regenDelay?.downed), unit: 's'),
        itemRow('受击', fmtNum(s?.regenDelay?.damage), unit: 's'),
      ])),
      // Absorption(原防护页移入)
      itemCard('吸收', damageRows(s?.absorption)),
      // Resistance(原防护页移入)
      itemCard('抗性', damageRows(s?.resistance)),
    ];
  },
);
