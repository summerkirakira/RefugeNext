// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_weapon_capacitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleWeaponCapacitor _$VehicleWeaponCapacitorFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'VehicleWeaponCapacitor',
  json,
  ($checkedConvert) {
    final val = VehicleWeaponCapacitor(
      maxAmmoLoad: $checkedConvert(
        'max_ammo_load',
        (v) => (v as num?)?.toDouble(),
      ),
      regenPerSecond: $checkedConvert(
        'regen_per_second',
        (v) => (v as num?)?.toDouble(),
      ),
      cooldown: $checkedConvert('cooldown', (v) => (v as num?)?.toDouble()),
      requestedAmmoLoad: $checkedConvert(
        'requested_ammo_load',
        (v) => (v as num?)?.toDouble(),
      ),
      costsPerShot: $checkedConvert(
        'costs_per_shot',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'maxAmmoLoad': 'max_ammo_load',
    'regenPerSecond': 'regen_per_second',
    'requestedAmmoLoad': 'requested_ammo_load',
    'costsPerShot': 'costs_per_shot',
  },
);

Map<String, dynamic> _$VehicleWeaponCapacitorToJson(
  VehicleWeaponCapacitor instance,
) => <String, dynamic>{
  'max_ammo_load': ?instance.maxAmmoLoad,
  'regen_per_second': ?instance.regenPerSecond,
  'cooldown': ?instance.cooldown,
  'requested_ammo_load': ?instance.requestedAmmoLoad,
  'costs_per_shot': ?instance.costsPerShot,
};
