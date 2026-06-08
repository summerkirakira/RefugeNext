// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_weapon_barrel_spin_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleWeaponBarrelSpinTime _$VehicleWeaponBarrelSpinTimeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VehicleWeaponBarrelSpinTime', json, ($checkedConvert) {
  final val = VehicleWeaponBarrelSpinTime(
    up: $checkedConvert('up', (v) => (v as num?)?.toDouble()),
    down: $checkedConvert('down', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$VehicleWeaponBarrelSpinTimeToJson(
  VehicleWeaponBarrelSpinTime instance,
) => <String, dynamic>{'up': ?instance.up, 'down': ?instance.down};
