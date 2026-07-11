import 'dart:io';

import 'package:refuge_next/src/network/wiki/wiki_api.dart';
import 'package:refuge_next/src/repo/game_vehicle.dart';
import 'package:refuge_next/src/repo/vehicle_weapon.dart';
import 'package:refuge_next/src/repo/personal_weapon.dart';
import 'package:refuge_next/src/repo/shield.dart';
import 'package:refuge_next/src/repo/cooler.dart';
import 'package:refuge_next/src/repo/power_plant.dart';
import 'package:refuge_next/src/repo/quantum_drive.dart';
import 'package:refuge_next/src/repo/weapon_attachment.dart';
import 'package:refuge_next/src/utils/storage_path.dart';

/// 把全部航船（GameVehicle）+ 7 类 GameItem 的图片 URL（缩略图 + 大图）导出为 txt，
/// 每行一个 URL、已去重、无表头，便于批量下载（wget -i / aria2c -i）。
/// 图片字段是完整绝对 URL（starcitizen.tools 实拍图），无需拼前缀。
Future<File> exportItemImageUrls({
  void Function(int done, int total)? onProgress,
}) async {
  // 1. 加载全部仓库（无缓存则触发网络）。
  await Future.wait([
    GameVehicleRepo().getVehicles(),
    VehicleWeaponRepo().getVehicleWeapons(),
    PersonalWeaponRepo().getPersonalWeapons(),
    ShieldRepo().getShields(),
    CoolerRepo().getCoolers(),
    PowerPlantRepo().getPowerPlants(),
    QuantumDriveRepo().getQuantumDrives(),
    WeaponAttachmentRepo().getWeaponAttachments(),
  ]);

  // 2. 收集去重 URL（Set 保序去重），缩略图 + 大图都收。
  final urls = <String>{};
  void addImg(String? thumb, String? orig) {
    if (thumb != null && thumb.isNotEmpty) urls.add(thumb);
    if (orig != null && orig.isNotEmpty) urls.add(orig);
  }

  final ships = GameVehicleRepo().getVehiclesSync();
  final items = <GameItem>[
    ...VehicleWeaponRepo().itemsSync,
    ...PersonalWeaponRepo().itemsSync,
    ...ShieldRepo().itemsSync,
    ...CoolerRepo().itemsSync,
    ...PowerPlantRepo().itemsSync,
    ...QuantumDriveRepo().itemsSync,
    ...WeaponAttachmentRepo().itemsSync,
  ];
  final total = ships.length + items.length;
  var done = 0;

  for (final v in ships) {
    for (final img in v.images ?? const []) {
      addImg(img.thumbnailUrl, img.originalUrl);
    }
    onProgress?.call(++done, total);
  }
  for (final it in items) {
    for (final img in it.images ?? const []) {
      addImg(img.thumbnailUrl, img.originalUrl);
    }
    onProgress?.call(++done, total);
  }

  // 3. 原子写 txt（先写 .tmp 再 rename），落到 exports 目录。
  final version = await GameVehicleRepo().getSelectedVersion() ?? 'unknown';
  final safe = version.replaceAll(RegExp(r'[^A-Za-z0-9._-]'), '_');
  final dir = Directory('${await StoragePath.getAppDataPath()}/exports');
  await dir.create(recursive: true);
  final file = File('${dir.path}/image_urls_$safe.txt');
  final tmp = File('${file.path}.tmp');
  await tmp.writeAsString('${urls.join('\n')}\n', flush: true);
  await tmp.rename(file.path);
  return file;
}
