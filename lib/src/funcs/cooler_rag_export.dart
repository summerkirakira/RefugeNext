import 'dart:io';

import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/cooler.dart';

import 'rag_export_common.dart';

/// 把单件冷却器 [GameItem] 翻译成一段用于 RAG 的中文描述。
String buildCoolerRagContent(GameItem item) {
  final buf = StringBuffer();
  ragHeader(buf, item, '冷却器');

  final c = item.cooler;
  final u = item.resourceNetwork?.usage;
  final st = <String>[];
  if (item.grade != null && item.grade!.isNotEmpty) st.add('等级 ${item.grade}');
  if (c?.coolingRate != null) st.add('冷却速率 ${ragNum(c!.coolingRate)}');
  if (c?.coolantSegmentGeneration != null) {
    st.add('制冷段生成 ${ragNum(c!.coolantSegmentGeneration)}');
  }
  if (c?.suppressionIrFactor != null) {
    st.add('红外抑制 ${ragNum(c!.suppressionIrFactor)}');
  }
  if (c?.suppressionHeatFactor != null) {
    st.add('热抑制 ${ragNum(c!.suppressionHeatFactor)}');
  }
  final power = ragRange(u?.power?.min, u?.power?.max, unit: ' 段');
  if (power != null) st.add('功率用量 $power');

  if (st.isNotEmpty) buf.write('${st.join('；')}。');

  ragTail(buf, item);
  return buf.toString();
}

/// 把当前版本的全部冷却器导出为单个 JSON 数组文件,返回文件。
Future<File> exportCoolersRagJson({
  void Function(int done, int total)? onProgress,
}) async {
  final items = await CoolerRepo().getCoolers();
  await ensureBlueprintsLoaded();

  final records = <Map<String, dynamic>>[];
  for (var i = 0; i < items.length; i++) {
    records.add(ragRecord(items[i], 'cooler', buildCoolerRagContent(items[i])));
    onProgress?.call(i + 1, items.length);
  }

  final version = await CoolerRepo().getSelectedVersion() ?? 'unknown';
  return writeRagJson('coolers_rag', version, records);
}
