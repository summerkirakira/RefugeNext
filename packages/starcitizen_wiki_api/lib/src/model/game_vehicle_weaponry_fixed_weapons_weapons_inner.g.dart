// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_weaponry_fixed_weapons_weapons_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleWeaponryFixedWeaponsWeaponsInner
_$GameVehicleWeaponryFixedWeaponsWeaponsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleWeaponryFixedWeaponsWeaponsInner',
  json,
  ($checkedConvert) {
    final val = GameVehicleWeaponryFixedWeaponsWeaponsInner(
      name: $checkedConvert('name', (v) => v as String?),
      dps: $checkedConvert('dps', (v) => v as num?),
      sustainedDps: $checkedConvert('sustained_dps', (v) => v as num?),
      alpha: $checkedConvert('alpha', (v) => v as num?),
    );
    return val;
  },
  fieldKeyMap: const {'sustainedDps': 'sustained_dps'},
);

Map<String, dynamic> _$GameVehicleWeaponryFixedWeaponsWeaponsInnerToJson(
  GameVehicleWeaponryFixedWeaponsWeaponsInner instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'dps': ?instance.dps,
  'sustained_dps': ?instance.sustainedDps,
  'alpha': ?instance.alpha,
};
