import 'dart:convert';
import 'dart:io';

import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/blueprint.dart';
import 'package:refuge_next/src/repo/game_item_translation.dart';
import 'package:refuge_next/src/repo/game_version_manager.dart';
import 'package:refuge_next/src/utils/storage_path.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart'
    show gameItemDisplayName, descValue, kItemClassValueCn;

/// 组件类 RAG 导出的公共工具(数字格式化、简介、价格/蓝图/购买尾段、记录骨架、落盘)。

/// 数字格式化:整数→千分位;小数→保留(最多 5 位)并去尾零。
String ragNum(num? value) {
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

/// 区间:`min–max{unit}`;min==max 或仅一端时取单值。null 返回 null。
String? ragRange(num? min, num? max, {String unit = ''}) {
  if (min == null && max == null) return null;
  if (min != null && max != null && min != max) {
    return '${ragNum(min)}–${ragNum(max)}$unit';
  }
  return '${ragNum(min ?? max)}$unit';
}

/// 倍率 → ±%(负值=减少);1.0/null 视为无修正返回 null。
String? ragMult(num? value) {
  if (value == null || value == 1.0) return null;
  final pct = (value - 1) * 100;
  final sign = pct > 0 ? '+' : '';
  return '$sign${pct.toStringAsFixed(pct.abs() < 10 ? 1 : 0)}%';
}

/// 秒 → 中文时长。
String? ragDuration(int? seconds) {
  if (seconds == null || seconds <= 0) return null;
  if (seconds < 60) return '$seconds 秒';
  if (seconds < 3600) {
    final m = seconds ~/ 60, s = seconds % 60;
    return s == 0 ? '$m 分钟' : '$m 分 $s 秒';
  }
  final h = seconds ~/ 3600, m = (seconds % 3600) ~/ 60;
  return m == 0 ? '$h 小时' : '$h 小时 $m 分';
}

/// 简介句:`{中文名}（{英文}）是 {厂商} 出品的 S{size} {类别} {类目}`(无句号)。
/// 类别取 descriptionData['Class'] 经 [kItemClassValueCn]。
String ragIntro(GameItem item, String categoryCn) {
  final cn = gameItemDisplayName(item);
  final en = item.name ?? '';
  final title = (en.isNotEmpty && en != cn) ? '$cn（$en）' : cn;
  final mfr = item.manufacturer?.name;
  final maker = (mfr != null && mfr.isNotEmpty) ? '$mfr 出品的 ' : '';
  final sizePart = item.size == null ? '' : 'S${item.size} ';
  final clsRaw = descValue(item, 'Class');
  final clsCn = (clsRaw == null || clsRaw.isEmpty)
      ? ''
      : '${kItemClassValueCn[clsRaw] ?? clsRaw} ';
  return '$title 是 $maker$sizePart$clsCn$categoryCn';
}

/// 写 `uuid:` 行 + 简介句(带句号)。
void ragHeader(StringBuffer buf, GameItem item, String categoryCn) {
  buf.write('uuid: ${item.uuid ?? ''}');
  buf.write('\n${ragIntro(item, categoryCn)}。');
}

/// 蓝图句:制造时间 + 所需材料(材料名经 [GameItemTranslationRepo.getCommodities] 汉化)。
String? ragBlueprint(GameItem item) {
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
  final dur = ragDuration(craftSec) ?? craftLabel;
  if (dur != null && dur.isNotEmpty) parts.add('制造 $dur');
  final mats = <String>[];
  for (final g in ingredients ?? const <BlueprintIngredient>[]) {
    final n = g.name;
    if (n == null || n.isEmpty) continue;
    final cn = GameItemTranslationRepo().getCommodities(n);
    if (g.quantityScu != null) {
      mats.add('$cn ${ragNum(g.quantityScu)} SCU');
    } else if (g.quantity != null) {
      mats.add('$cn ×${ragNum(g.quantity)}');
    } else {
      mats.add(cn);
    }
  }
  if (mats.isNotEmpty) parts.add('材料 ${mats.join('、')}');
  if (parts.isEmpty) return '蓝图 有';
  return '蓝图：${parts.join('；')}';
}

/// 公共尾段:参考售价 + 蓝图 + 描述 + 游戏内购买。
void ragTail(StringBuffer buf, GameItem item) {
  final purchases = item.uexPrices?.purchase ?? const <UexPrice>[];
  num? minBuy;
  for (final p in purchases) {
    final b = p.priceBuy;
    if (b != null && b > 0 && (minBuy == null || b < minBuy)) minBuy = b;
  }
  if (minBuy != null) buf.write('参考售价 ${ragNum(minBuy)} aUEC。');

  final bp = ragBlueprint(item);
  if (bp != null) buf.write('$bp。');

  final desc = item.description?.zhCN ?? item.description?.enEN;
  if (desc != null && desc.trim().isNotEmpty) buf.write('\n${desc.trim()}');

  if (purchases.isNotEmpty) {
    buf.write('\n游戏内购买（${purchases.length} 处）：');
    for (final p in purchases) {
      final loc = p.starmapLocation?.parentName ?? p.starmapLocation?.name ?? '-';
      final sys = p.starmapLocation?.starSystemName ?? '其它';
      final term = p.terminalName ?? '-';
      final pr = p.priceBuy == null ? '-' : '${ragNum(p.priceBuy)} aUEC';
      buf.write('\n- $loc（$sys）$term：$pr');
    }
  }
}

/// 通用记录骨架。
Map<String, dynamic> ragRecord(GameItem item, String typeTag, String content) {
  return {
    'key': item.slug,
    'name': gameItemDisplayName(item),
    'name_en': item.name,
    'class_name': item.className,
    'type': typeTag,
    'content': content,
    'source': item.webUrl ??
        (item.slug == null
            ? null
            : 'https://api.star-citizen.wiki/items/${item.slug}'),
  };
}

/// 写 JSON 数组到 `exports/{fileBase}_{version}.json`(原子写),返回文件。
Future<File> writeRagJson(
    String fileBase, String version, List<Map<String, dynamic>> records) async {
  final safe = version.replaceAll(RegExp(r'[^A-Za-z0-9._-]'), '_');
  final dir = Directory('${await StoragePath.getAppDataPath()}/exports');
  await dir.create(recursive: true);
  final file = File('${dir.path}/${fileBase}_$safe.json');
  final tmp = File('${file.path}.tmp');
  await tmp.writeAsString(
    const JsonEncoder.withIndent('  ').convert(records),
    flush: true,
  );
  await tmp.rename(file.path);
  return file;
}

/// 确保蓝图数据已加载(供制造时间/材料);缺则拉取当前版本。
Future<void> ensureBlueprintsLoaded() async {
  try {
    if ((await BlueprintRepo().getBlueprints()).isEmpty) {
      await BlueprintRepo().refresh(version: GameVersionManager().version);
    }
  } catch (_) {}
}
