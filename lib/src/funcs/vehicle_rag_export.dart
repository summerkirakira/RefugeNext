import 'dart:convert';
import 'dart:io';

import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/network/cirno/property/property.dart' show ShipAlias;
import 'package:refuge_next/src/repo/game_vehicle.dart';
import 'package:refuge_next/src/repo/ship_alias.dart';
import 'package:refuge_next/src/utils/storage_path.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/vehicle_detail_page.dart'
    show vehicleDisplayName, vehicleRoleCn;

/// 舰船尺寸等级(sizeClass 1-5)中文。
const kVehicleSizeClassCn = {
  1: '微型',
  2: '小型',
  3: '中型',
  4: '大型',
  5: '巨型',
};

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

/// 倍率 → ±%(镜像详情页:(倍率-1)×100,负值=减伤)。
String? _mult(num? value) {
  if (value == null) return null;
  final pct = (value - 1) * 100;
  final sign = pct > 0 ? '+' : '';
  return '$sign${pct.toStringAsFixed(pct.abs() < 10 ? 1 : 0)}%';
}

String _kindCn(GameVehicle v) {
  if (v.isSpaceship == true) return '飞船';
  if (v.isGravlev == true) return '反重力载具';
  if (v.isVehicle == true) return '地面载具';
  return '载具';
}

String? _crewText(GameVehicleCrew? c) {
  final mn = c?.min, mx = c?.max;
  if (mn == null && mx == null) return null;
  if (mn != null && mx != null && mx > mn) return '$mn–$mx';
  return '${mn ?? mx}';
}

/// 驾驶员武器:按名称分组计数 → "4× CF-337 Panther Repeater、…"。
String? _pilotWeapons(GameVehicle v) {
  final ws = v.weaponry?.fixedWeapons?.weapons ?? const [];
  final order = <String>[];
  final counts = <String, int>{};
  for (final w in ws) {
    final n = w.name;
    if (n == null || n.isEmpty) continue;
    if (!counts.containsKey(n)) order.add(n);
    counts[n] = (counts[n] ?? 0) + 1;
  }
  if (order.isEmpty) return null;
  return order.map((n) => '${counts[n]}× $n').join('、');
}

int _turretCount(GameVehicleTurrets? t) =>
    (t?.manned?.length ?? 0) +
    (t?.remote?.length ?? 0) +
    (t?.pdc?.length ?? 0);

/// 把单艘 [GameVehicle] 翻译成一段用于 RAG 的中文描述。
String buildVehicleRagContent(GameVehicle v, int aliasId) {
  final buf = StringBuffer();
  buf.write('uuid: ${v.uuid ?? ''}');
  buf.write('\nship_alias_id: $aliasId');

  // —— 简介句 ——
  final cn = vehicleDisplayName(v);
  final en = v.name ?? '';
  final size = v.sizeClass == null ? '' : (kVehicleSizeClassCn[v.sizeClass] ?? '');
  final mfr = v.manufacturer?.name;
  final maker = (mfr != null && mfr.isNotEmpty) ? ' $mfr 出品的' : '';
  buf.write('\n$cn（$en）是$maker$size${_kindCn(v)}。');

  // —— 定位:foci + role 中文 + role 原文 ——
  final pos = <String>[];
  for (final t in v.foci ?? const <Translation>[]) {
    final s = t.zhCN ?? t.enEN;
    if (s != null && s.isNotEmpty && !pos.contains(s)) pos.add(s);
  }
  final roleCn = vehicleRoleCn(v.role);
  if (roleCn != null && roleCn.isNotEmpty && !pos.contains(roleCn)) {
    pos.add(roleCn);
  }
  final roleRaw = v.role?.trim();
  if (roleRaw != null &&
      roleRaw.isNotEmpty &&
      roleRaw != '<= PLACEHOLDER =>' &&
      !pos.contains(roleRaw)) {
    pos.add(roleRaw);
  }
  if (pos.isNotEmpty) buf.write('定位：${pos.join('、')}。');

  // —— 统计句(；连接,末尾。) ——
  final stats = <String>[];
  void add(String? s) {
    if (s != null && s.isNotEmpty) stats.add(s);
  }

  final crew = _crewText(v.crew);
  if (crew != null) add('乘员 $crew 人');

  final shieldHp = v.shield?.hp;
  if (shieldHp != null) {
    final regen = v.shield?.regeneration;
    add(regen != null
        ? '护盾 ${_fmt(shieldHp)}（回复 ${_fmt(regen)}/s）'
        : '护盾 ${_fmt(shieldHp)}');
  }
  if (v.health != null) add('机体 ${_fmt(v.health)} HP');

  final dm = v.armor?.damageMultiplier;
  final ar = <String>[
    if (dm?.physical != null) '物理 ${_mult(dm!.physical)}',
    if (dm?.energy != null) '能量 ${_mult(dm!.energy)}',
    if (dm?.distortion != null) '扭曲 ${_mult(dm!.distortion)}',
    if (dm?.thermal != null) '热 ${_mult(dm!.thermal)}',
  ];
  if (ar.isNotEmpty) add('装甲抗性 ${ar.join('、')}');

  add(_pilotWeapons(v) == null ? null : '驾驶员武器 ${_pilotWeapons(v)}');
  if (v.weaponry?.pilotDps != null) {
    add('飞行员 DPS ${_fmt(v.weaponry!.pilotDps)}');
  }
  final missiles = v.weaponry?.missiles?.count;
  if (missiles != null && missiles > 0) add('导弹 $missiles 枚');
  final turrets = _turretCount(v.turrets);
  if (turrets > 0) add('炮塔 $turrets 座');

  final scm = v.speed?.scm, vmax = v.speed?.max;
  if (scm != null && vmax != null) {
    add('SCM 速度 ${_fmt(scm)} m/s、NAV 速度 ${_fmt(vmax)} m/s');
  } else if (scm != null) {
    add('SCM 速度 ${_fmt(scm)} m/s');
  } else if (vmax != null) {
    add('NAV 速度 ${_fmt(vmax)} m/s');
  }

  final a = v.agility;
  final ag = <String>[
    if (a?.pitch != null) '俯仰 ${_fmt(a!.pitch)}',
    if (a?.yaw != null) '偏航 ${_fmt(a!.yaw)}',
    if (a?.roll != null) '滚转 ${_fmt(a!.roll)}',
  ];
  if (ag.isNotEmpty) add('角速度 ${ag.join('、')} °/s');

  if (v.fuel?.capacity != null) add('油箱 ${_fmt(v.fuel!.capacity)}');
  if (v.quantum?.quantumFuelCapacity != null) {
    add('量子油箱 ${_fmt(v.quantum!.quantumFuelCapacity)}');
  }

  final d = v.dimension;
  if (d?.length != null && d?.width != null && d?.height != null) {
    add('尺寸 ${_fmt(d!.length)}×${_fmt(d.width)}×${_fmt(d.height)} m');
  }
  if (v.massTotal != null) add('质量 ${_fmt(v.massTotal)} kg');
  if (v.cargoCapacity != null) add('货舱 ${_fmt(v.cargoCapacity)} SCU');
  if (v.vehicleInventory != null) {
    add('个人存储 ${_fmt(v.vehicleInventory! / 1000000)} SCU');
  }
  if (v.msrp != null) add('参考售价 \$${_fmt(v.msrp)}');

  final claim = v.insurance?.claimTime;
  if (claim != null) {
    final exTime = v.insurance?.expediteTime;
    final exCost = v.insurance?.expediteCost;
    var s = '保险索赔 ${_fmt(claim)} 分钟';
    if (exTime != null || exCost != null) {
      s += '（加急 ${_fmt(exTime)} 分钟 / ${_fmt(exCost)} aUEC）';
    }
    add(s);
  }

  final prod = v.productionStatus?.zhCN ?? v.productionStatus?.enEN;
  if (prod != null && prod.isNotEmpty) add('生产状态：$prod');

  if (stats.isNotEmpty) buf.write('${stats.join('；')}。');

  // —— 营销描述 ——
  final desc = v.description?.zhCN;
  if (desc != null && desc.trim().isNotEmpty) buf.write('\n${desc.trim()}');

  // —— 游戏内购买 ——
  final purchases = v.uexPrices?.purchase ?? const <UexPrice>[];
  if (purchases.isNotEmpty) {
    buf.write('\n游戏内购买（${purchases.length} 处）：');
    for (final p in purchases) {
      final loc = p.starmapLocation?.parentName ?? p.starmapLocation?.name ?? '-';
      final sys = p.starmapLocation?.starSystemName ?? '其它';
      final term = p.terminalName ?? '-';
      final price = p.priceBuy == null ? '-' : '${_fmt(p.priceBuy)} aUEC';
      buf.write('\n- $loc（$sys）$term：$price');
    }
  }

  return buf.toString();
}

/// 单艘船的 RAG 记录(用户给定结构)。
Map<String, dynamic> buildVehicleRagRecord(GameVehicle v, ShipAlias alias) {
  return {
    'key': v.slug,
    'name': vehicleDisplayName(v),
    'name_en': v.name,
    'class_name': v.className,
    'ship_alias_id': alias.id,
    'type': 'ship',
    'content': buildVehicleRagContent(v, alias.id),
    'source': v.slug == null
        ? null
        : 'https://api.star-citizen.wiki/vehicles/${v.slug}',
  };
}

/// 把当前版本下「有中文别名」的舰船导出为单个 JSON 数组文件,返回文件。
///
/// 仅保留能在 [ShipAliasRepo] 按 uuid 查到别名的船(即有 ship_alias_id)。
Future<File> exportVehiclesRagJson({
  void Function(int done, int total)? onProgress,
}) async {
  final vehicles = await GameVehicleRepo().getVehicles();
  final aliasRepo = ShipAliasRepo();
  await aliasRepo.getShipAliases(); // 确保 uuid 索引已加载

  final eligible = vehicles
      .where((v) =>
          v.uuid != null && aliasRepo.getShipAliasByUuidSync(v.uuid!) != null)
      .toList();

  final records = <Map<String, dynamic>>[];
  for (var i = 0; i < eligible.length; i++) {
    final v = eligible[i];
    final alias = aliasRepo.getShipAliasByUuidSync(v.uuid!)!;
    records.add(buildVehicleRagRecord(v, alias));
    onProgress?.call(i + 1, eligible.length);
  }

  final version = await GameVehicleRepo().getSelectedVersion() ?? 'unknown';
  final safeVersion = version.replaceAll(RegExp(r'[^A-Za-z0-9._-]'), '_');
  final dir = Directory('${await StoragePath.getAppDataPath()}/exports');
  await dir.create(recursive: true);
  final file = File('${dir.path}/ships_rag_$safeVersion.json');

  final tmp = File('${file.path}.tmp');
  await tmp.writeAsString(
    const JsonEncoder.withIndent('  ').convert(records),
    flush: true,
  );
  await tmp.rename(file.path);
  return file;
}
