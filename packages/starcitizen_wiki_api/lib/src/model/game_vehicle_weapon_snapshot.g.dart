// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_weapon_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleWeaponSnapshot _$GameVehicleWeaponSnapshotFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleWeaponSnapshot',
  json,
  ($checkedConvert) {
    final val = GameVehicleWeaponSnapshot(
      pilotGunsCount: $checkedConvert(
        'pilot_guns_count',
        (v) => (v as num?)?.toInt(),
      ),
      turretsMannedCount: $checkedConvert(
        'turrets_manned_count',
        (v) => (v as num?)?.toInt(),
      ),
      turretsRemoteCount: $checkedConvert(
        'turrets_remote_count',
        (v) => (v as num?)?.toInt(),
      ),
      turretWeaponGunsCount: $checkedConvert(
        'turret_weapon_guns_count',
        (v) => (v as num?)?.toInt(),
      ),
      missileRackCount: $checkedConvert(
        'missile_rack_count',
        (v) => (v as num?)?.toInt(),
      ),
      missileCount: $checkedConvert(
        'missile_count',
        (v) => (v as num?)?.toInt(),
      ),
      countermeasuresCount: $checkedConvert(
        'countermeasures_count',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'pilotGunsCount': 'pilot_guns_count',
    'turretsMannedCount': 'turrets_manned_count',
    'turretsRemoteCount': 'turrets_remote_count',
    'turretWeaponGunsCount': 'turret_weapon_guns_count',
    'missileRackCount': 'missile_rack_count',
    'missileCount': 'missile_count',
    'countermeasuresCount': 'countermeasures_count',
  },
);

Map<String, dynamic> _$GameVehicleWeaponSnapshotToJson(
  GameVehicleWeaponSnapshot instance,
) => <String, dynamic>{
  'pilot_guns_count': ?instance.pilotGunsCount,
  'turrets_manned_count': ?instance.turretsMannedCount,
  'turrets_remote_count': ?instance.turretsRemoteCount,
  'turret_weapon_guns_count': ?instance.turretWeaponGunsCount,
  'missile_rack_count': ?instance.missileRackCount,
  'missile_count': ?instance.missileCount,
  'countermeasures_count': ?instance.countermeasuresCount,
};
