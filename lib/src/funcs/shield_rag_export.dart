import 'dart:io';

import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/shield.dart';

import 'rag_export_common.dart';

/// 把单件护盾 [GameItem] 翻译成一段用于 RAG 的中文描述。
String buildShieldRagContent(GameItem item) {
  final buf = StringBuffer();
  ragHeader(buf, item, '护盾');

  final s = item.shield;
  final st = <String>[];
  if (item.grade != null && item.grade!.isNotEmpty) st.add('等级 ${item.grade}');
  if (s?.maxHealth != null) st.add('最大血量 ${ragNum(s!.maxHealth)} HP');
  if (s?.regenRate != null) st.add('回复速率 ${ragNum(s!.regenRate)} HP/s');
  if (s?.regenTime != null) st.add('回复时间 ${ragNum(s!.regenTime)} s');
  if (s?.decayRatio != null) st.add('衰减比 ${ragNum(s!.decayRatio)}');
  if (s?.regenDelay?.damage != null) {
    st.add('受击回复延迟 ${ragNum(s!.regenDelay!.damage)} s');
  }
  if (s?.regenDelay?.downed != null) {
    st.add('击穿回复延迟 ${ragNum(s!.regenDelay!.downed)} s');
  }

  // 抗性(取各类型 max,百分比;非空才列)
  final r = s?.resistance;
  final res = <String>[
    for (final e in <String, double?>{
      '物理': r?.physical?.max,
      '能量': r?.energy?.max,
      '畸变': r?.distortion?.max,
      '热能': r?.thermal?.max,
    }.entries)
      if (e.value != null && e.value != 0) '${e.key} ${ragNum(e.value! * 100)}%',
  ];
  if (res.isNotEmpty) st.add('抗性 ${res.join('、')}');

  if (st.isNotEmpty) buf.write('${st.join('；')}。');

  ragTail(buf, item);
  return buf.toString();
}

/// 把当前版本的全部护盾导出为单个 JSON 数组文件,返回文件。
Future<File> exportShieldsRagJson({
  void Function(int done, int total)? onProgress,
}) async {
  final items = await ShieldRepo().getShields();
  await ensureBlueprintsLoaded();

  final records = <Map<String, dynamic>>[];
  for (var i = 0; i < items.length; i++) {
    records.add(ragRecord(items[i], 'shield', buildShieldRagContent(items[i])));
    onProgress?.call(i + 1, items.length);
  }

  final version = await ShieldRepo().getSelectedVersion() ?? 'unknown';
  return writeRagJson('shields_rag', version, records);
}
