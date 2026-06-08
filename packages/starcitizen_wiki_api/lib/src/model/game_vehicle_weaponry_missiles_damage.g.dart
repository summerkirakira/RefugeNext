// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_weaponry_missiles_damage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleWeaponryMissilesDamage _$GameVehicleWeaponryMissilesDamageFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleWeaponryMissilesDamage', json, (
  $checkedConvert,
) {
  final val = GameVehicleWeaponryMissilesDamage(
    physical: $checkedConvert('physical', (v) => v as num?),
    energy: $checkedConvert('energy', (v) => v as num?),
    distortion: $checkedConvert('distortion', (v) => v as num?),
    thermal: $checkedConvert('thermal', (v) => v as num?),
    biochemical: $checkedConvert('biochemical', (v) => v as num?),
    stun: $checkedConvert('stun', (v) => v as num?),
    total: $checkedConvert('total', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleWeaponryMissilesDamageToJson(
  GameVehicleWeaponryMissilesDamage instance,
) => <String, dynamic>{
  'physical': ?instance.physical,
  'energy': ?instance.energy,
  'distortion': ?instance.distortion,
  'thermal': ?instance.thermal,
  'biochemical': ?instance.biochemical,
  'stun': ?instance.stun,
  'total': ?instance.total,
};
