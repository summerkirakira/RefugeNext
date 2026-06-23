import 'dart:io';

import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/weapon_attachment.dart';
import 'package:refuge_next/src/widgets/ship_info_neo/game_item_detail_page.dart'
    show descValue, kItemTypeValueCn, kAttachSubTypeCn;

import 'rag_export_common.dart';

/// 把单件武器配件 [GameItem] 翻译成一段用于 RAG 的中文描述。
String buildWeaponAttachmentRagContent(GameItem item) {
  final buf = StringBuffer();

  // 类目:优先具体类型(descriptionData Type),回退安装位(subType),再回退「武器配件」。
  final typeRaw = descValue(item, 'Type');
  final typeCn = (typeRaw == null || typeRaw.isEmpty)
      ? null
      : (kItemTypeValueCn[typeRaw] ?? typeRaw);
  final subCn = (item.subType == null || item.subType!.isEmpty)
      ? null
      : (kAttachSubTypeCn[item.subType] ?? item.subType);
  ragHeader(buf, item, typeCn ?? subCn ?? '武器配件');

  final st = <String>[];
  if (item.grade != null && item.grade!.isNotEmpty) st.add('等级 ${item.grade}');
  if (subCn != null && subCn != typeCn) st.add('安装位 $subCn');

  // 修正(武器加成,只列 ≠100% 的)
  final base = item.weaponModifier?.base_;
  final recoil = item.weaponModifier?.recoil;
  final mods = <String>[
    for (final e in <String, double?>{
      '伤害': base?.damageMultiplier,
      '射速': base?.fireRateMultiplier,
      '弹速': base?.projectileSpeedMultiplier,
      '弹药消耗': base?.ammoCostMultiplier,
      '发热': base?.heatGenerationMultiplier,
      '枪口火光': base?.muzzleFlashMultiplier,
      '声音半径': base?.soundRadiusMultiplier,
      '充能时间': base?.chargeTimeMultiplier,
      '后坐力': recoil?.multiplier,
      '后坐力衰减': recoil?.decayMultiplier,
    }.entries)
      if (ragMult(e.value) != null) '${e.key} ${ragMult(e.value)}',
  ];
  if (mods.isNotEmpty) st.add('修正 ${mods.join('、')}');

  // 瞄具
  final sight = item.ironSight;
  if (sight != null) {
    final sp = <String>[
      if (sight.zoomScale != null) '倍率 ${ragNum(sight.zoomScale)}×',
      if (sight.maxRange != null) '最大归零 ${ragNum(sight.maxRange)} m',
      if (sight.defaultRange != null) '默认归零 ${ragNum(sight.defaultRange)} m',
    ];
    if (sp.isNotEmpty) st.add('瞄具 ${sp.join('、')}');
  }

  // 激光指示器
  final laser = item.laserPointer;
  if (laser?.range != null) st.add('激光射程 ${ragNum(laser!.range)} m');

  if (st.isNotEmpty) buf.write('${st.join('；')}。');

  ragTail(buf, item);
  return buf.toString();
}

/// 把当前版本的全部武器配件导出为单个 JSON 数组文件,返回文件。
Future<File> exportWeaponAttachmentsRagJson({
  void Function(int done, int total)? onProgress,
}) async {
  final items = await WeaponAttachmentRepo().getWeaponAttachments();
  await ensureBlueprintsLoaded();

  final records = <Map<String, dynamic>>[];
  for (var i = 0; i < items.length; i++) {
    records.add(ragRecord(items[i], 'weapon_attachment',
        buildWeaponAttachmentRagContent(items[i])));
    onProgress?.call(i + 1, items.length);
  }

  final version = await WeaponAttachmentRepo().getSelectedVersion() ?? 'unknown';
  return writeRagJson('weapon_attachments_rag', version, records);
}
