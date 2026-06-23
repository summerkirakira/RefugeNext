import 'dart:io';

import 'package:refuge_next/src/repo/cooler.dart';
import 'package:refuge_next/src/repo/game_vehicle.dart';
import 'package:refuge_next/src/repo/personal_weapon.dart';
import 'package:refuge_next/src/repo/power_plant.dart';
import 'package:refuge_next/src/repo/quantum_drive.dart';
import 'package:refuge_next/src/repo/shield.dart';
import 'package:refuge_next/src/repo/ship_alias.dart';
import 'package:refuge_next/src/repo/vehicle_weapon.dart';
import 'package:refuge_next/src/repo/weapon_attachment.dart';

import 'cooler_rag_export.dart';
import 'personal_weapon_rag_export.dart';
import 'power_plant_rag_export.dart';
import 'quantum_drive_rag_export.dart';
import 'rag_export_common.dart';
import 'shield_rag_export.dart';
import 'vehicle_rag_export.dart';
import 'vehicle_weapon_rag_export.dart';
import 'weapon_attachment_rag_export.dart';

/// 把之前所有类别的 RAG 记录合并导出为**单个** JSON 数组文件,返回文件。
///
/// 覆盖:舰船(有中文别名) + 载具武器 + 个人武器 + 护盾 + 冷却器 + 发电机 +
/// 量子引擎 + 武器配件。复用各类别的记录/内容构造函数,统一写入一个文件。
Future<File> exportAllRagJson({
  void Function(int done, int total)? onProgress,
}) async {
  await ensureBlueprintsLoaded();

  // 舰船:仅有中文别名的
  final vehicles = await GameVehicleRepo().getVehicles();
  final aliasRepo = ShipAliasRepo();
  await aliasRepo.getShipAliases();
  final ships = vehicles
      .where((v) =>
          v.uuid != null && aliasRepo.getShipAliasByUuidSync(v.uuid!) != null)
      .toList();

  final vWeapons = await VehicleWeaponRepo().getVehicleWeapons();
  final pWeapons = await PersonalWeaponRepo().getPersonalWeapons();
  final shields = await ShieldRepo().getShields();
  final coolers = await CoolerRepo().getCoolers();
  final powerPlants = await PowerPlantRepo().getPowerPlants();
  final quantums = await QuantumDriveRepo().getQuantumDrives();
  final attachments = await WeaponAttachmentRepo().getWeaponAttachments();

  final total = ships.length +
      vWeapons.length +
      pWeapons.length +
      shields.length +
      coolers.length +
      powerPlants.length +
      quantums.length +
      attachments.length;

  final records = <Map<String, dynamic>>[];
  void add(Map<String, dynamic> r) {
    records.add(r);
    onProgress?.call(records.length, total);
  }

  for (final v in ships) {
    add(buildVehicleRagRecord(v, aliasRepo.getShipAliasByUuidSync(v.uuid!)!));
  }
  for (final it in vWeapons) {
    add(buildVehicleWeaponRagRecord(it));
  }
  for (final it in pWeapons) {
    add(buildPersonalWeaponRagRecord(it));
  }
  for (final it in shields) {
    add(ragRecord(it, 'shield', buildShieldRagContent(it)));
  }
  for (final it in coolers) {
    add(ragRecord(it, 'cooler', buildCoolerRagContent(it)));
  }
  for (final it in powerPlants) {
    add(ragRecord(it, 'power_plant', buildPowerPlantRagContent(it)));
  }
  for (final it in quantums) {
    add(ragRecord(it, 'quantum_drive', buildQuantumDriveRagContent(it)));
  }
  for (final it in attachments) {
    add(ragRecord(it, 'weapon_attachment', buildWeaponAttachmentRagContent(it)));
  }

  final version = await GameVehicleRepo().getSelectedVersion() ?? 'unknown';
  return writeRagJson('all_rag', version, records);
}
