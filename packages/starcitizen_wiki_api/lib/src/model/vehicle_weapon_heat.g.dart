// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_weapon_heat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleWeaponHeat _$VehicleWeaponHeatFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'VehicleWeaponHeat',
      json,
      ($checkedConvert) {
        final val = VehicleWeaponHeat(
          perShot: $checkedConvert('per_shot', (v) => (v as num?)?.toDouble()),
          coolingDelay: $checkedConvert(
            'cooling_delay',
            (v) => (v as num?)?.toDouble(),
          ),
          coolingPerSecond: $checkedConvert(
            'cooling_per_second',
            (v) => (v as num?)?.toDouble(),
          ),
          overheatMaxShots: $checkedConvert(
            'overheat_max_shots',
            (v) => (v as num?)?.toDouble(),
          ),
          overheatMaxTime: $checkedConvert(
            'overheat_max_time',
            (v) => (v as num?)?.toDouble(),
          ),
          overheatCooldown: $checkedConvert(
            'overheat_cooldown',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'perShot': 'per_shot',
        'coolingDelay': 'cooling_delay',
        'coolingPerSecond': 'cooling_per_second',
        'overheatMaxShots': 'overheat_max_shots',
        'overheatMaxTime': 'overheat_max_time',
        'overheatCooldown': 'overheat_cooldown',
      },
    );

Map<String, dynamic> _$VehicleWeaponHeatToJson(VehicleWeaponHeat instance) =>
    <String, dynamic>{
      'per_shot': ?instance.perShot,
      'cooling_delay': ?instance.coolingDelay,
      'cooling_per_second': ?instance.coolingPerSecond,
      'overheat_max_shots': ?instance.overheatMaxShots,
      'overheat_max_time': ?instance.overheatMaxTime,
      'overheat_cooldown': ?instance.overheatCooldown,
    };
