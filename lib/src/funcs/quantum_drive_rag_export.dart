import 'dart:io';

import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/quantum_drive.dart';

import 'rag_export_common.dart';

/// 把单件量子引擎 [GameItem] 翻译成一段用于 RAG 的中文描述。
String buildQuantumDriveRagContent(GameItem item) {
  final buf = StringBuffer();
  ragHeader(buf, item, '量子引擎');

  final q = item.quantumDrive;
  final n = q?.standardJump;
  final st = <String>[];
  if (item.grade != null && item.grade!.isNotEmpty) st.add('等级 ${item.grade}');
  final speed = n?.driveSpeedFormatted ??
      (n?.driveSpeed == null ? null : '${ragNum(n!.driveSpeed)} m/s');
  if (speed != null) st.add('跃迁速度 $speed');
  final range = q?.jumpRangeFormatted ??
      (q?.jumpRange == null ? null : '${ragNum(q!.jumpRange)} m');
  if (range != null) st.add('航程 $range');
  if (q?.fuelEfficiency != null) {
    st.add('燃料效率 ${ragNum(q!.fuelEfficiency)} GM/SCU');
  }
  if (q?.quantumFuelRequirement != null) {
    st.add('量子燃料需求 ${ragNum(q!.quantumFuelRequirement)}');
  }
  if (n?.cooldownTime != null) st.add('冷却时间 ${ragNum(n!.cooldownTime)} s');
  if (n?.spoolUpTime != null) st.add('充能时间 ${ragNum(n!.spoolUpTime)} s');
  if (n?.calibrationRate != null) {
    st.add('校准速率 ${ragNum(n!.calibrationRate)}');
  }

  if (st.isNotEmpty) buf.write('${st.join('；')}。');

  ragTail(buf, item);
  return buf.toString();
}

/// 把当前版本的全部量子引擎导出为单个 JSON 数组文件,返回文件。
Future<File> exportQuantumDrivesRagJson({
  void Function(int done, int total)? onProgress,
}) async {
  final items = await QuantumDriveRepo().getQuantumDrives();
  await ensureBlueprintsLoaded();

  final records = <Map<String, dynamic>>[];
  for (var i = 0; i < items.length; i++) {
    records.add(ragRecord(
        items[i], 'quantum_drive', buildQuantumDriveRagContent(items[i])));
    onProgress?.call(i + 1, items.length);
  }

  final version = await QuantumDriveRepo().getSelectedVersion() ?? 'unknown';
  return writeRagJson('quantum_drives_rag', version, records);
}
