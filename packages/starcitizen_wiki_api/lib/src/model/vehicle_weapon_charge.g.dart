// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_weapon_charge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleWeaponCharge _$VehicleWeaponChargeFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'VehicleWeaponCharge',
      json,
      ($checkedConvert) {
        final val = VehicleWeaponCharge(
          time: $checkedConvert('time', (v) => (v as num?)?.toDouble()),
          overchargeTime: $checkedConvert(
            'overcharge_time',
            (v) => (v as num?)?.toDouble(),
          ),
          overchargedTime: $checkedConvert(
            'overcharged_time',
            (v) => (v as num?)?.toDouble(),
          ),
          cooldownTime: $checkedConvert(
            'cooldown_time',
            (v) => (v as num?)?.toDouble(),
          ),
          autoFire: $checkedConvert('auto_fire', (v) => v as bool?),
          requireFullCharge: $checkedConvert(
            'require_full_charge',
            (v) => v as bool?,
          ),
          autoCharge: $checkedConvert('auto_charge', (v) => v as bool?),
          interpolateBonus: $checkedConvert(
            'interpolate_bonus',
            (v) => v as bool?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'overchargeTime': 'overcharge_time',
        'overchargedTime': 'overcharged_time',
        'cooldownTime': 'cooldown_time',
        'autoFire': 'auto_fire',
        'requireFullCharge': 'require_full_charge',
        'autoCharge': 'auto_charge',
        'interpolateBonus': 'interpolate_bonus',
      },
    );

Map<String, dynamic> _$VehicleWeaponChargeToJson(
  VehicleWeaponCharge instance,
) => <String, dynamic>{
  'time': ?instance.time,
  'overcharge_time': ?instance.overchargeTime,
  'overcharged_time': ?instance.overchargedTime,
  'cooldown_time': ?instance.cooldownTime,
  'auto_fire': ?instance.autoFire,
  'require_full_charge': ?instance.requireFullCharge,
  'auto_charge': ?instance.autoCharge,
  'interpolate_bonus': ?instance.interpolateBonus,
};
