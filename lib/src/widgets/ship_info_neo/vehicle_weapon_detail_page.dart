import 'package:flutter/material.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/vehicle_weapon.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart';

/// 载具武器(舰船武器)详情测试页:复用通用 [GameItemDetailPage]。
///
/// 与 FPS 武器详情页类似:在「参数」右侧加「弹药」页签;但保留「系统」页签
/// (复用资源网络卡)。「总览」首卡展示全量 Description Data。仅作开发调试用。
class VehicleWeaponDetailPage extends StatelessWidget {
  const VehicleWeaponDetailPage({
    super.key,
    this.initialItem,
    this.allowSwitch = true,
  });

  /// 指定展示的武器;为 null 时取本地第一条。
  final GameItem? initialItem;

  /// 是否显示「切换」按钮(测试页为 true)。
  final bool allowSwitch;

  @override
  Widget build(BuildContext context) {
    return GameItemDetailPage(
      title: '载具武器详情',
      loadItems: () => VehicleWeaponRepo().getVehicleWeapons(),
      initialItem: initialItem,
      allowSwitch: allowSwitch,
      fallbackIcon: Icons.rocket_launch_outlined,
      showSystemTab: true, // 复用现有系统卡(资源网络)
      fullDescriptionData: true,
      descriptionLastLine: true,
      paramSpec: vehicleWeaponParamSpec,
      extraTabs: [vehicleWeaponAmmoSpec],
    );
  }
}

/// 载具武器「参数」页:信息 / 伤害 / DPS 分解 / Alpha 分解 / 散布 / 电容 / 序列。
final vehicleWeaponParamSpec = GameItemParamSpec(
  tabTitle: '参数',
  buildCards: (item) {
    final w = item.vehicleWeapon;
    if (w == null) {
      return const [
        Padding(
          padding: EdgeInsets.only(top: 24),
          child: Center(
            child: Text('无武器参数', style: TextStyle(color: Colors.grey)),
          ),
        ),
      ];
    }
    final d = w.damage;
    final s = w.spread;
    final c = w.capacitor;
    final mv = w.magazineVolume;
    final mode = (w.modes ?? const <VehicleWeaponMode>[]).isNotEmpty
        ? w.modes!.first
        : null;

    // 类别 = 物品类型(type)经共享映射中文化(未命中保留原值);不显示 class。
    final typeCn = (w.type == null || w.type!.isEmpty)
        ? null
        : (kItemTypeValueCn[w.type] ?? w.type);

    final cap = (w.capacity == null || w.capacity == 0)
        ? '无限'
        : w.capacity.toString();

    return [
      // 信息
      itemCard('信息', itemRows([
        itemRow('类别', typeCn),
        itemRow('容量', cap),
        itemRow('弹匣容量', mv == null ? null : '${fmtNum(mv.scu) ?? '0'} SCU'),
        itemRow('射程', fmtNum(w.range), unit: 'm'),
        itemRow('RPM', fmtNum(w.rpm), unit: 'RPM'),
      ])),
      // 伤害
      itemCard('伤害', itemRows([
        itemRow('Alpha', fmtNum(d?.alphaTotal)),
        itemRow('Burst', fmtNum(d?.burst), orange: true),
        itemRow('最大', d?.max == null ? '无限' : fmtNum(d!.max)),
      ])),
      // DPS 分解(模型无逐类型 DPS,由 Alpha 比例 × Burst 推算后取整)
      itemCard('DPS 分解', _dpsBreakdownRows(d)),
      // Alpha 分解
      itemCard('Alpha 分解', _damageTypeRows(d?.alpha)),
      // 散布
      itemCard('散布', _spreadRows(s)),
      // 电容
      itemCard('电容', itemRows([
        itemRow('最大载弹', fmtNum(c?.maxAmmoLoad)),
        itemRow('每秒回充', fmtNum(c?.regenPerSecond)),
        itemRow('冷却', fmtNum(c?.cooldown), unit: 's'),
        itemRow('请求载弹', fmtNum(c?.requestedAmmoLoad)),
        itemRow('每发消耗', fmtNum(c?.costsPerShot)),
      ])),
      // 序列
      if (mode?.sequenceMode != null)
        itemCard('序列', itemRows([
          itemRow('序列模式', mode!.sequenceMode),
        ])),
    ];
  },
);

/// 逐类型 Alpha 值(非 0 才显示)。
List<Widget> _damageTypeRows(VehicleWeaponDamageTypes? v) => itemRows([
      for (final e in <String, double?>{
        '物理': v?.physical,
        '能量': v?.energy,
        '畸变': v?.distortion,
        '热能': v?.thermal,
        '生化': v?.biochemical,
        '眩晕': v?.stun,
      }.entries)
        if (e.value != null && e.value != 0) itemRow(e.key, fmtNum(e.value)),
    ]);

/// DPS 分解:把逐类型 Alpha 按其占总 Alpha 的比例放大到 Burst,取整显示。
List<Widget> _dpsBreakdownRows(VehicleWeaponDamage? d) {
  final a = d?.alpha;
  final total = d?.alphaTotal;
  final burst = d?.burst;
  if (a == null || total == null || total == 0 || burst == null) {
    return const [];
  }
  double scale(double v) => (v / total * burst).roundToDouble();
  return itemRows([
    for (final e in <String, double?>{
      '物理': a.physical,
      '能量': a.energy,
      '畸变': a.distortion,
      '热能': a.thermal,
      '生化': a.biochemical,
      '眩晕': a.stun,
    }.entries)
      if (e.value != null && e.value != 0) itemRow(e.key, fmtNum(scale(e.value!))),
  ]);
}

/// 散布:Min/Max 以区间显示;首发/每发/衰减按单值显示。
List<Widget> _spreadRows(VehicleWeaponSpread? s) {
  return [
    if (s?.min != null || s?.max != null)
      itemStatRow('Min/Max', itemRangeText(s?.min, s?.max, unit: '度')),
    ...itemRows([
      itemRow('首发', fmtNum(s?.firstAttack), unit: '度'),
      itemRow('每发', fmtNum(s?.perAttack), unit: '度'),
      itemRow('衰减', fmtNum(s?.decay), unit: '度/秒'),
    ]),
  ];
}

/// 载具武器「弹药」页:信息(射程/容量/逐类型伤害)/ 穿透 / 属性。
final vehicleWeaponAmmoSpec = GameItemParamSpec(
  tabTitle: '弹药',
  buildCards: (item) {
    final am = item.ammunition;
    if (am == null) {
      return const [
        Padding(
          padding: EdgeInsets.only(top: 24),
          child: Center(
            child: Text('无弹药数据', style: TextStyle(color: Colors.grey)),
          ),
        ),
      ];
    }
    final p = am.penetration;
    final dmg = am.impactDamageMap;

    return [
      // 信息
      itemCard('信息', itemRows([
        itemRow('射程', fmtNum(am.range), unit: 'm'),
        itemRow('容量', am.capacity?.toString()),
        for (final e in <String, double?>{
          '物理': dmg?.physical,
          '能量': dmg?.energy,
          '畸变': dmg?.distortion,
          '热能': dmg?.thermal,
          '生化': dmg?.biochemical,
          '眩晕': dmg?.stun,
        }.entries)
          if (e.value != null && e.value != 0)
            itemRow('${e.key}伤害', fmtNum(e.value), orange: true),
      ])),
      // 穿透
      itemCard('穿透', itemRows([
        itemRow('基础距离', fmtNum(p?.baseDistance), unit: 'm'),
        itemRow('近半径', fmtNum(p?.nearRadius), unit: 'm'),
        itemRow('远半径', fmtNum(p?.farRadius), unit: 'm'),
      ])),
      // 属性
      itemCard('属性', itemRows([
        itemRow('尺寸', am.size?.toString()),
        itemRow('速度', fmtNum(am.speed), unit: 'm/s'),
        itemRow('寿命', fmtNum(am.lifetime), unit: 's'),
        itemRow('初始容量', am.initialCapacity?.toString()),
      ])),
    ];
  },
);
