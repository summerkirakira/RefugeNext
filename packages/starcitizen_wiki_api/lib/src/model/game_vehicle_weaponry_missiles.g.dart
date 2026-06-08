// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_weaponry_missiles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleWeaponryMissiles _$GameVehicleWeaponryMissilesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameVehicleWeaponryMissiles', json, ($checkedConvert) {
  final val = GameVehicleWeaponryMissiles(
    count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
    damage: $checkedConvert(
      'damage',
      (v) => v == null
          ? null
          : GameVehicleWeaponryMissilesDamage.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
  );
  return val;
});

Map<String, dynamic> _$GameVehicleWeaponryMissilesToJson(
  GameVehicleWeaponryMissiles instance,
) => <String, dynamic>{
  'count': ?instance.count,
  'damage': ?instance.damage?.toJson(),
};
