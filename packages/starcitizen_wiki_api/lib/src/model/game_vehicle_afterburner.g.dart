// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_afterburner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleAfterburner _$GameVehicleAfterburnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameVehicleAfterburner',
  json,
  ($checkedConvert) {
    final val = GameVehicleAfterburner(
      pitchBoostMultiplier: $checkedConvert(
        'pitch_boost_multiplier',
        (v) => v as num?,
      ),
      rollBoostMultiplier: $checkedConvert(
        'roll_boost_multiplier',
        (v) => v as num?,
      ),
      yawBoostMultiplier: $checkedConvert(
        'yaw_boost_multiplier',
        (v) => v as num?,
      ),
      capacitor: $checkedConvert('capacitor', (v) => v as num?),
      idleCost: $checkedConvert('idle_cost', (v) => v as num?),
      linearCost: $checkedConvert('linear_cost', (v) => v as num?),
      angularCost: $checkedConvert('angular_cost', (v) => v as num?),
      regenPerSecond: $checkedConvert('regen_per_second', (v) => v as num?),
      regenDelayAfterUse: $checkedConvert(
        'regen_delay_after_use',
        (v) => v as num?,
      ),
      preDelayTime: $checkedConvert('pre_delay_time', (v) => v as num?),
      rampUpTime: $checkedConvert('ramp_up_time', (v) => v as num?),
      rampDownTime: $checkedConvert('ramp_down_time', (v) => v as num?),
      regenTime: $checkedConvert('regen_time', (v) => v as num?),
      regenDelay: $checkedConvert('regen_delay', (v) => v as num?),
    );
    return val;
  },
  fieldKeyMap: const {
    'pitchBoostMultiplier': 'pitch_boost_multiplier',
    'rollBoostMultiplier': 'roll_boost_multiplier',
    'yawBoostMultiplier': 'yaw_boost_multiplier',
    'idleCost': 'idle_cost',
    'linearCost': 'linear_cost',
    'angularCost': 'angular_cost',
    'regenPerSecond': 'regen_per_second',
    'regenDelayAfterUse': 'regen_delay_after_use',
    'preDelayTime': 'pre_delay_time',
    'rampUpTime': 'ramp_up_time',
    'rampDownTime': 'ramp_down_time',
    'regenTime': 'regen_time',
    'regenDelay': 'regen_delay',
  },
);

Map<String, dynamic> _$GameVehicleAfterburnerToJson(
  GameVehicleAfterburner instance,
) => <String, dynamic>{
  'pitch_boost_multiplier': ?instance.pitchBoostMultiplier,
  'roll_boost_multiplier': ?instance.rollBoostMultiplier,
  'yaw_boost_multiplier': ?instance.yawBoostMultiplier,
  'capacitor': ?instance.capacitor,
  'idle_cost': ?instance.idleCost,
  'linear_cost': ?instance.linearCost,
  'angular_cost': ?instance.angularCost,
  'regen_per_second': ?instance.regenPerSecond,
  'regen_delay_after_use': ?instance.regenDelayAfterUse,
  'pre_delay_time': ?instance.preDelayTime,
  'ramp_up_time': ?instance.rampUpTime,
  'ramp_down_time': ?instance.rampDownTime,
  'regen_time': ?instance.regenTime,
  'regen_delay': ?instance.regenDelay,
};
