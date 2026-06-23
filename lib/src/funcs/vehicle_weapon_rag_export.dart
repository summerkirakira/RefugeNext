import 'dart:convert';
import 'dart:io';

import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/blueprint.dart';
import 'package:refuge_next/src/repo/game_item_translation.dart';
import 'package:refuge_next/src/repo/game_version_manager.dart';
import 'package:refuge_next/src/repo/vehicle_weapon.dart';
import 'package:refuge_next/src/utils/storage_path.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart'
    show gameItemDisplayName, kItemTypeValueCn, kFireModeCn;

/// 数字格式化:整数→千分位;小数→保留(最多 5 位)并去尾零。
String _fmt(num? value) {
  if (value == null) return '';
  String s;
  if (value == value.roundToDouble()) {
    s = value.toInt().toString();
  } else {
    s = value
        .toStringAsFixed(5)
        .replaceFirst(RegExp(r'0+$'), '')
        .replaceFirst(RegExp(r'\.$'), '');
  }
  final parts = s.split('.');
  parts[0] = parts[0].replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (_) => ',',
  );
  return parts.join('.');
}

/// 逐类型伤害(物理/能量/畸变/热能/生化/眩晕,非 0 才列)。
List<String> _damageTypes(Map<String, double?> m) => [
      for (final e in m.entries)
        if (e.value != null && e.value != 0) '${e.key} ${_fmt(e.value)}',
    ];

/// 秒 → 中文时长(16 分钟 / 1 小时 30 分 / 45 秒)。
String? _durationCn(int? seconds) {
  if (seconds == null || seconds <= 0) return null;
  if (seconds < 60) return '$seconds 秒';
  if (seconds < 3600) {
    final m = seconds ~/ 60, s = seconds % 60;
    return s == 0 ? '$m 分钟' : '$m 分 $s 秒';
  }
  final h = seconds ~/ 3600, m = (seconds % 3600) ~/ 60;
  return m == 0 ? '$h 小时' : '$h 小时 $m 分';
}

/// 蓝图句:制造时间 + 所需材料。蓝图详情(材料/工时)在 [BlueprintRepo],
/// 物品自带的 blueprint 仅为引用;优先用内联字段,缺则按 uuid 回查。
String? _blueprintSentence(GameItem item) {
  final refs = item.blueprint;
  if (refs == null || refs.isEmpty) return null;
  final ref = refs.first;

  int? craftSec = ref.craftTimeSeconds;
  String? craftLabel = ref.craftTimeLabel;
  List<BlueprintIngredient>? ingredients = ref.ingredients;

  if (ingredients == null || ingredients.isEmpty) {
    Blueprint? bp;
    final u = ref.uuid;
    if (u != null) bp = BlueprintRepo().getByUuidSync(u);
    if (bp == null && item.uuid != null) {
      bp = BlueprintRepo().findByOutputItemUuidSync(item.uuid!);
    }
    if (bp != null) {
      craftSec = bp.craftTimeSeconds;
      craftLabel = bp.craftTimeLabel;
      ingredients = bp.ingredients;
    }
  }

  final parts = <String>[];
  final dur = _durationCn(craftSec) ?? craftLabel;
  if (dur != null && dur.isNotEmpty) parts.add('制造 $dur');
  final mats = <String>[];
  for (final g in ingredients ?? const <BlueprintIngredient>[]) {
    final n = g.name;
    if (n == null || n.isEmpty) continue;
    final cn = GameItemTranslationRepo().getCommodities(n);
    if (g.quantityScu != null) {
      mats.add('$cn ${_fmt(g.quantityScu)} SCU');
    } else if (g.quantity != null) {
      mats.add('$cn ×${_fmt(g.quantity)}');
    } else {
      mats.add(cn);
    }
  }
  if (mats.isNotEmpty) parts.add('材料 ${mats.join('、')}');
  if (parts.isEmpty) return '蓝图 有';
  return '蓝图：${parts.join('；')}';
}

/// 把单件载具武器 [GameItem] 翻译成一段用于 RAG 的中文描述。
String buildVehicleWeaponRagContent(GameItem item) {
  final w = item.vehicleWeapon;
  final buf = StringBuffer();
  buf.write('uuid: ${item.uuid ?? ''}');

  // —— 简介 ——
  final cn = gameItemDisplayName(item);
  final en = item.name ?? '';
  final title = (en.isNotEmpty && en != cn) ? '$cn（$en）' : cn;
  final mfr = item.manufacturer?.name;
  final maker = (mfr != null && mfr.isNotEmpty) ? '$mfr 出品的 ' : '';
  final sizePart = item.size == null ? '' : 'S${item.size} ';
  final typeCn = (w?.type == null || w!.type!.isEmpty)
      ? '载具武器'
      : (kItemTypeValueCn[w.type] ?? w.type!);
  buf.write('\n$title 是 $maker$sizePart$typeCn。');

  // —— 基础参数 ——
  final base = <String>[];
  if (item.grade != null && item.grade!.isNotEmpty) base.add('等级 ${item.grade}');
  if (w?.range != null) base.add('射程 ${_fmt(w!.range)} m');
  if (w?.rpm != null) base.add('射速 ${_fmt(w!.rpm)} RPM');
  if (w?.capacity != null) {
    base.add(w!.capacity == 0 ? '容量 无限' : '容量 ${w.capacity}');
  }
  if (w?.magazineVolume?.scu != null) {
    base.add('弹匣 ${_fmt(w!.magazineVolume!.scu)} SCU');
  }
  final modes = <String>[];
  for (final m in w?.modes ?? const <VehicleWeaponMode>[]) {
    final mc = m.mode == null ? null : (kFireModeCn[m.mode] ?? m.mode);
    if (mc != null && mc.isNotEmpty && !modes.contains(mc)) modes.add(mc);
  }
  if (modes.isNotEmpty) base.add('射击模式 ${modes.join('、')}');
  if (base.isNotEmpty) buf.write('${base.join('；')}。');

  // —— 伤害 ——
  final d = w?.damage;
  final dmg = <String>[
    if (d?.alphaTotal != null) 'Alpha ${_fmt(d!.alphaTotal)}',
    if (d?.burst != null) 'Burst ${_fmt(d!.burst)}',
    if (d?.sustained60s != null) '持续 DPS ${_fmt(d!.sustained60s)}',
    if (d?.max != null) '最大 DPS ${_fmt(d!.max)}',
  ];
  if (dmg.isNotEmpty) {
    var s = '伤害：${dmg.join('、')}';
    final a = d?.alpha;
    final ad = _damageTypes({
      '物理': a?.physical,
      '能量': a?.energy,
      '畸变': a?.distortion,
      '热能': a?.thermal,
      '生化': a?.biochemical,
      '眩晕': a?.stun,
    });
    if (ad.isNotEmpty) s += '；Alpha 分解 ${ad.join('、')}';
    buf.write('$s。');
  }

  // —— 弹药 ——
  final am = item.ammunition;
  if (am != null) {
    final ammo = <String>[
      if (am.speed != null) '速度 ${_fmt(am.speed)} m/s',
      if (am.lifetime != null) '寿命 ${_fmt(am.lifetime)} s',
      if (am.penetration?.baseDistance != null)
        '穿透基础 ${_fmt(am.penetration!.baseDistance)} m',
      if (am.explosionRadius?.max != null)
        '爆炸半径 ${_fmt(am.explosionRadius!.min)}–${_fmt(am.explosionRadius!.max)} m',
    ];
    final map = am.impactDamageMap;
    final det = am.detonationDamageMap;
    final dm = map != null
        ? _damageTypes({
            '物理': map.physical,
            '能量': map.energy,
            '畸变': map.distortion,
            '热能': map.thermal,
            '生化': map.biochemical,
            '眩晕': map.stun,
          })
        : det != null
            ? _damageTypes({
                '物理': det.physical,
                '能量': det.energy,
                '畸变': det.distortion,
                '热能': det.thermal,
                '生化': det.biochemical,
                '眩晕': det.stun,
              })
            : <String>[];
    if (ammo.isNotEmpty || dm.isNotEmpty) {
      var s = '弹药：${ammo.join('、')}';
      if (dm.isNotEmpty) s += '${ammo.isNotEmpty ? '；' : ''}伤害 ${dm.join('、')}';
      buf.write('$s。');
    }
  }

  // —— 价格 ——
  final purchases = item.uexPrices?.purchase ?? const <UexPrice>[];
  num? minBuy;
  for (final p in purchases) {
    final b = p.priceBuy;
    if (b != null && b > 0 && (minBuy == null || b < minBuy)) minBuy = b;
  }
  if (minBuy != null) buf.write('参考售价 ${_fmt(minBuy)} aUEC。');

  // —— 蓝图(制造时间 + 材料) ——
  final bp = _blueprintSentence(item);
  if (bp != null) buf.write('$bp。');

  // —— 描述 ——
  final desc = item.description?.zhCN ?? item.description?.enEN;
  if (desc != null && desc.trim().isNotEmpty) buf.write('\n${desc.trim()}');

  // —— 游戏内购买 ——
  if (purchases.isNotEmpty) {
    buf.write('\n游戏内购买（${purchases.length} 处）：');
    for (final p in purchases) {
      final loc = p.starmapLocation?.parentName ?? p.starmapLocation?.name ?? '-';
      final sys = p.starmapLocation?.starSystemName ?? '其它';
      final term = p.terminalName ?? '-';
      final pr = p.priceBuy == null ? '-' : '${_fmt(p.priceBuy)} aUEC';
      buf.write('\n- $loc（$sys）$term：$pr');
    }
  }

  return buf.toString();
}

/// 单件载具武器的 RAG 记录。
Map<String, dynamic> buildVehicleWeaponRagRecord(GameItem item) {
  return {
    'key': item.slug,
    'name': gameItemDisplayName(item),
    'name_en': item.name,
    'class_name': item.className,
    'type': 'weapon_gun',
    'content': buildVehicleWeaponRagContent(item),
    'source': item.webUrl ??
        (item.slug == null
            ? null
            : 'https://api.star-citizen.wiki/items/${item.slug}'),
  };
}

/// 把当前版本的全部载具武器导出为单个 JSON 数组文件,返回文件。
Future<File> exportVehicleWeaponsRagJson({
  void Function(int done, int total)? onProgress,
}) async {
  final items = await VehicleWeaponRepo().getVehicleWeapons();

  // 确保蓝图数据已加载(用于制造时间/材料);缺则尝试拉取当前版本。
  try {
    if ((await BlueprintRepo().getBlueprints()).isEmpty) {
      await BlueprintRepo().refresh(version: GameVersionManager().version);
    }
  } catch (_) {}

  final records = <Map<String, dynamic>>[];
  for (var i = 0; i < items.length; i++) {
    records.add(buildVehicleWeaponRagRecord(items[i]));
    onProgress?.call(i + 1, items.length);
  }

  final version = await VehicleWeaponRepo().getSelectedVersion() ?? 'unknown';
  final safeVersion = version.replaceAll(RegExp(r'[^A-Za-z0-9._-]'), '_');
  final dir = Directory('${await StoragePath.getAppDataPath()}/exports');
  await dir.create(recursive: true);
  final file = File('${dir.path}/vehicle_weapons_rag_$safeVersion.json');

  final tmp = File('${file.path}.tmp');
  await tmp.writeAsString(
    const JsonEncoder.withIndent('  ').convert(records),
    flush: true,
  );
  await tmp.rename(file.path);
  return file;
}
