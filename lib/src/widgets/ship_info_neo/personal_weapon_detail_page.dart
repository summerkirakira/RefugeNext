import 'package:flutter/material.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/personal_weapon.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/weapon_attachment_detail_page.dart';

/// FPS 武器详情测试页:复用通用 [GameItemDetailPage]。
///
/// 与组件详情页不同:隐藏「系统」页签,在「参数」右侧加「弹药」「配件」两个页签,
/// 「总览」首卡展示全量 Description Data。参数/弹药/配件本期仅占位。仅作开发调试用。
class PersonalWeaponDetailPage extends StatelessWidget {
  const PersonalWeaponDetailPage({
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
      title: 'FPS武器详情',
      loadItems: () => PersonalWeaponRepo().getPersonalWeapons(),
      initialItem: initialItem,
      allowSwitch: allowSwitch,
      fallbackIcon: Icons.gps_fixed,
      showSystemTab: false,
      fullDescriptionData: true,
      descriptionLastLine: true,
      paramSpec: personalWeaponParamSpec,
      extraTabs: [personalWeaponAmmoSpec, personalWeaponAttachmentSpec],
      // 列表的 ports 是空槽,进页/切换时补拉单把武器(含已装配件)并写回。
      enrichSelected: (item) => PersonalWeaponRepo().enrichPorts(item),
    );
  }
}

/// FPS 武器「参数」页:信息/伤害/射速/伤害分解/散布/热量磨损(来自 personalWeapon)。
final personalWeaponParamSpec = GameItemParamSpec(
  tabTitle: '参数',
  buildCards: (item) {
    final w = item.personalWeapon;
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
    final a = w.adsSpread;
    final m = (w.modes ?? const <PersonalWeaponMode>[]).isNotEmpty
        ? w.modes!.first
        : null;

    // 类别 = 类别(class)+ 物品类型(type),各经对照表中文化后拼接。
    final cls = [
      if (w.class_ != null && w.class_!.isNotEmpty)
        kItemClassValueCn[w.class_] ?? w.class_!,
      if (w.type != null && w.type!.isNotEmpty)
        kItemTypeValueCn[w.type] ?? w.type!,
    ].join(' ');

    return [
      // Info
      itemCard('信息', itemRows([
        itemRow('类别', cls.isEmpty ? null : cls),
        itemRow('射程', fmtNum(w.range), unit: 'm'),
        itemRow('容量', w.capacity?.toString(), unit: '发'),
        itemRow('射击模式',
            w.fireMode == null ? null : (kFireModeCn[w.fireMode] ?? w.fireMode)),
      ])),
      // Damage
      itemCard('伤害', itemRows([
        itemRow('DPS 总计', fmtNum(d?.dpsTotal), orange: true),
        itemRow('Alpha 总计', fmtNum(d?.alphaTotal)),
        itemRow('最大', fmtNum(d?.max), unit: '/弹匣'),
      ])),
      // Fire Rate
      itemCard('射速', itemRows([
        itemRow('RPM', fmtNum(w.rpm), unit: '/min'),
        itemRow('每发弹丸', w.pelletsPerShot?.toString()),
      ])),
      // DPS Breakdown
      itemCard('DPS 分解', _damageVecRows(d?.dps)),
      // Alpha Breakdown
      itemCard('Alpha 分解', _damageVecRows(d?.alpha)),
      // Hip-fire Spread
      itemCard('腰射散布', _spreadRows(s)),
      // ADS Spread
      itemCard('瞄准散布', _spreadRows(a)),
      // Heat / Wear
      itemCard('热量 · 磨损', itemRows([
        itemRow('每发热量', fmtNum(m?.heatPerShot)),
        itemRow('每发磨损', fmtNum(m?.wearPerShot)),
      ])),
    ];
  },
);

/// 伤害向量(六类)→ 只显示伤害不为 0(且非空)的类型。
List<Widget> _damageVecRows(PersonalWeaponDamageVector? v) => itemRows([
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

/// 散布(首发/每发/衰减/最小/最大,单位 °)。
List<Widget> _spreadRows(PersonalWeaponSpread? s) => itemRows([
      itemRow('首发', fmtNum(s?.firstAttack), unit: '度'),
      itemRow('每发', fmtNum(s?.perAttack), unit: '度'),
      itemRow('衰减', fmtNum(s?.decay), unit: '度'),
      itemRow('最小', fmtNum(s?.min), unit: '度'),
      itemRow('最大', fmtNum(s?.max), unit: '度'),
    ]);

/// FPS 武器「弹药」页:信息/穿透/伤害衰减/子弹冲量衰减/属性(来自 ammunition)。
final personalWeaponAmmoSpec = GameItemParamSpec(
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
    final f = am.bulletImpulseFalloff;
    final dmg = am.impactDamageMap;

    return [
      // Info
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
      // Penetration
      itemCard('穿透', itemRows([
        itemRow('基础距离', fmtNum(p?.baseDistance), unit: 'm'),
        itemRow('近半径', fmtNum(p?.nearRadius), unit: 'm'),
        itemRow('远半径', fmtNum(p?.farRadius), unit: 'm'),
      ])),
      // Damage drop
      _ammoDropCard('伤害衰减:最小距离', {
        '物理': am.damageDropMinDistance?.physical,
        '能量': am.damageDropMinDistance?.energy,
        '畸变': am.damageDropMinDistance?.distortion,
        '热能': am.damageDropMinDistance?.thermal,
        '生化': am.damageDropMinDistance?.biochemical,
        '眩晕': am.damageDropMinDistance?.stun,
      }, am.damageDropMinDistance?.total, unit: 'm'),
      _ammoDropCard('伤害衰减:每米', {
        '物理': am.damageDropPerMeter?.physical,
        '能量': am.damageDropPerMeter?.energy,
        '畸变': am.damageDropPerMeter?.distortion,
        '热能': am.damageDropPerMeter?.thermal,
        '生化': am.damageDropPerMeter?.biochemical,
        '眩晕': am.damageDropPerMeter?.stun,
      }, am.damageDropPerMeter?.total, unit: '%'),
      _ammoDropCard('伤害衰减:最小伤害', {
        '物理': am.damageDropMinDamage?.physical,
        '能量': am.damageDropMinDamage?.energy,
        '畸变': am.damageDropMinDamage?.distortion,
        '热能': am.damageDropMinDamage?.thermal,
        '生化': am.damageDropMinDamage?.biochemical,
        '眩晕': am.damageDropMinDamage?.stun,
      }, am.damageDropMinDamage?.total),
      // Bullet impulse falloff
      itemCard('子弹冲量衰减', itemRows([
        itemRow('最小距离', fmtNum(f?.minDistance)),
        itemRow('衰减斜率', fmtNum(f?.dropFalloff)),
        itemRow('最大衰减', fmtNum(f?.maxFalloff)),
      ])),
      // Stats
      itemCard('属性', itemRows([
        itemRow('尺寸', am.size?.toString()),
        itemRow('速度', fmtNum(am.speed), unit: 'm/s'),
        itemRow('寿命', fmtNum(am.lifetime), unit: 's'),
        itemRow('初始容量', am.initialCapacity?.toString()),
      ])),
    ];
  },
);

/// 伤害衰减卡:只显非 0 类型 + 总计(三个衰减模型结构相同)。
Widget _ammoDropCard(String title, Map<String, double?> types, double? total,
        {String? unit}) =>
    itemCard(title, itemRows([
      for (final e in types.entries)
        if (e.value != null && e.value != 0)
          itemRow(e.key, fmtNum(e.value), unit: unit),
      itemRow('总计', fmtNum(total), unit: unit),
    ]));

/// FPS 武器「配件」页:用飞船 Port 组件样式列出武器挂点(item.ports)。
final personalWeaponAttachmentSpec = GameItemParamSpec(
  tabTitle: '配件',
  buildCards: (item) {
    final ports = item.ports ?? const <ItemPort>[];
    if (ports.isEmpty) {
      return const [
        Padding(
          padding: EdgeInsets.only(top: 24),
          child: Center(
            child: Text('无配件槽位', style: TextStyle(color: Colors.grey)),
          ),
        ),
      ];
    }
    return [
      itemCard('配件(${ports.length})',
          ports.map((p) => _ItemPortTile(port: p)).toList()),
    ];
  },
);

/// 挂点行(照搬 vehicle_detail_page 的 `_PortItem` 外观,改用 [ItemPort]):
/// 绿框尺寸徽章 + 名称 + 副行 +(装备时)等级 + 子挂点递归缩进。
///
/// 两态:有 `equippedItem` → 显示已装配件名 + 制造商;无 → 显示槽位名 + 可装类型 + 尺寸范围。
class _ItemPortTile extends StatelessWidget {
  const _ItemPortTile({required this.port, this.depth = 0});

  final ItemPort port;
  final int depth;

  @override
  Widget build(BuildContext context) {
    final item = port.equippedItem;
    final children = port.ports;
    final hasItem = item?.name != null;
    final dark = Theme.of(context).brightness == Brightness.dark;

    final name = hasItem ? item!.name! : (port.displayName ?? port.name ?? '槽位');

    // 尺寸徽章:已装用物品尺寸;空槽用尺寸范围(min!=max → S{min}-S{max})。
    final lo = port.sizes?.min;
    final hi = port.sizes?.max ?? port.size;
    final String sizeText;
    if (hasItem) {
      sizeText = 'S${item!.size ?? hi ?? '?'}';
    } else if (lo != null && hi != null && lo != hi) {
      sizeText = 'S$lo-S$hi';
    } else {
      sizeText = 'S${hi ?? port.size ?? '?'}';
    }

    // 副行:已装 → 制造商;空槽 → 可装类型「武器配件 · {子类型中文}」。
    String? subline;
    if (hasItem) {
      subline = item!.manufacturer?.name;
    } else if (port.subType != null) {
      subline = '武器配件 · ${kAttachSubTypeCn[port.subType] ?? port.subType}';
    }

    // 已装配件且有 uuid → 整行可点,跳转配件详情页。
    final uuid = item?.uuid ?? port.equippedItemUuid;
    final tappable = hasItem && uuid != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
              left: 8.0 + 24.0 * depth, right: 8, top: 4, bottom: 4),
          child: Material(
            color: dark ? Colors.grey[800] : Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: tappable ? () => _open(context, uuid) : null,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    sizeText,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: hasItem ? 16 : 15,
                          fontWeight: FontWeight.bold,
                          color: hasItem ? null : Colors.grey[700],
                        ),
                      ),
                      if (subline != null && subline.isNotEmpty)
                        Text(subline,
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[600])),
                    ],
                  ),
                ),
                    if (item?.grade != null)
                      Text('等级 ${item!.grade}',
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey[600])),
                    if (tappable)
                      Icon(Icons.chevron_right,
                          size: 18, color: Colors.grey[500]),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (children != null && children.isNotEmpty)
          ...children.map((c) => _ItemPortTile(port: c, depth: depth + 1)),
      ],
    );
  }

  /// 跳转到该挂点已装配件的「武器配件详情」页(配件已被 enrichPorts 解析/缓存)。
  Future<void> _open(BuildContext context, String uuid) async {
    final att = await PersonalWeaponRepo().resolveAttachment(uuid);
    if (!context.mounted) return;
    if (att == null) {
      showToast(message: '未找到该配件');
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => AttachmentDetailPage(initialItem: att, allowSwitch: false),
    ));
  }
}
