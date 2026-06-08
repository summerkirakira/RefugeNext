// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_weapon_damage_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleWeaponDamageEntry _$VehicleWeaponDamageEntryFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VehicleWeaponDamageEntry', json, ($checkedConvert) {
  final val = VehicleWeaponDamageEntry(
    type: $checkedConvert('type', (v) => v as String?),
    name: $checkedConvert('name', (v) => v as String?),
    damage: $checkedConvert('damage', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$VehicleWeaponDamageEntryToJson(
  VehicleWeaponDamageEntry instance,
) => <String, dynamic>{
  'type': ?instance.type,
  'name': ?instance.name,
  'damage': ?instance.damage,
};
