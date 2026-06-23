import 'dart:io';

import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/power_plant.dart';

import 'rag_export_common.dart';

/// 把单件发电机 [GameItem] 翻译成一段用于 RAG 的中文描述。
String buildPowerPlantRagContent(GameItem item) {
  final buf = StringBuffer();
  ragHeader(buf, item, '发电机');

  final p = item.powerPlant;
  final u = item.resourceNetwork?.usage;
  final st = <String>[];
  if (item.grade != null && item.grade!.isNotEmpty) st.add('等级 ${item.grade}');
  if (p?.powerSegmentGeneration != null) {
    st.add('发电量 ${ragNum(p!.powerSegmentGeneration)}');
  }
  final power = ragRange(u?.power?.min, u?.power?.max, unit: ' 段');
  if (power != null) st.add('功率生成 $power');
  final coolant = ragRange(u?.coolant?.min, u?.coolant?.max, unit: ' 段');
  if (coolant != null) st.add('冷却用量 $coolant');

  if (st.isNotEmpty) buf.write('${st.join('；')}。');

  ragTail(buf, item);
  return buf.toString();
}

/// 把当前版本的全部发电机导出为单个 JSON 数组文件,返回文件。
Future<File> exportPowerPlantsRagJson({
  void Function(int done, int total)? onProgress,
}) async {
  final items = await PowerPlantRepo().getPowerPlants();
  await ensureBlueprintsLoaded();

  final records = <Map<String, dynamic>>[];
  for (var i = 0; i < items.length; i++) {
    records.add(
        ragRecord(items[i], 'power_plant', buildPowerPlantRagContent(items[i])));
    onProgress?.call(i + 1, items.length);
  }

  final version = await PowerPlantRepo().getSelectedVersion() ?? 'unknown';
  return writeRagJson('power_plants_rag', version, records);
}
