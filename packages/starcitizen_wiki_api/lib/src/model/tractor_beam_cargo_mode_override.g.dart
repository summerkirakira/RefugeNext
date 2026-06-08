// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tractor_beam_cargo_mode_override.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TractorBeamCargoModeOverride _$TractorBeamCargoModeOverrideFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TractorBeamCargoModeOverride',
  json,
  ($checkedConvert) {
    final val = TractorBeamCargoModeOverride(
      minForce: $checkedConvert('min_force', (v) => (v as num?)?.toDouble()),
      maxForce: $checkedConvert('max_force', (v) => (v as num?)?.toDouble()),
      minAcceleration: $checkedConvert(
        'min_acceleration',
        (v) => (v as num?)?.toDouble(),
      ),
      maxAcceleration: $checkedConvert(
        'max_acceleration',
        (v) => (v as num?)?.toDouble(),
      ),
      minSpeed: $checkedConvert('min_speed', (v) => (v as num?)?.toDouble()),
      maxSpeed: $checkedConvert('max_speed', (v) => (v as num?)?.toDouble()),
      accelerationFactor: $checkedConvert(
        'acceleration_factor',
        (v) => (v as num?)?.toDouble(),
      ),
      degreesPerAction: $checkedConvert(
        'degrees_per_action',
        (v) => (v as num?)?.toDouble(),
      ),
      maxAngularAcceleration: $checkedConvert(
        'max_angular_acceleration',
        (v) => (v as num?)?.toDouble(),
      ),
      maxAngularVelocity: $checkedConvert(
        'max_angular_velocity',
        (v) => (v as num?)?.toDouble(),
      ),
      degreesPerActionScrollWheel: $checkedConvert(
        'degrees_per_action_scroll_wheel',
        (v) => (v as num?)?.toDouble(),
      ),
      forceFractionRotation: $checkedConvert(
        'force_fraction_rotation',
        (v) => (v as num?)?.toDouble(),
      ),
      minDistance: $checkedConvert(
        'min_distance',
        (v) => (v as num?)?.toDouble(),
      ),
      maxDistance: $checkedConvert(
        'max_distance',
        (v) => (v as num?)?.toDouble(),
      ),
      fullStrengthDistance: $checkedConvert(
        'full_strength_distance',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'minForce': 'min_force',
    'maxForce': 'max_force',
    'minAcceleration': 'min_acceleration',
    'maxAcceleration': 'max_acceleration',
    'minSpeed': 'min_speed',
    'maxSpeed': 'max_speed',
    'accelerationFactor': 'acceleration_factor',
    'degreesPerAction': 'degrees_per_action',
    'maxAngularAcceleration': 'max_angular_acceleration',
    'maxAngularVelocity': 'max_angular_velocity',
    'degreesPerActionScrollWheel': 'degrees_per_action_scroll_wheel',
    'forceFractionRotation': 'force_fraction_rotation',
    'minDistance': 'min_distance',
    'maxDistance': 'max_distance',
    'fullStrengthDistance': 'full_strength_distance',
  },
);

Map<String, dynamic> _$TractorBeamCargoModeOverrideToJson(
  TractorBeamCargoModeOverride instance,
) => <String, dynamic>{
  'min_force': ?instance.minForce,
  'max_force': ?instance.maxForce,
  'min_acceleration': ?instance.minAcceleration,
  'max_acceleration': ?instance.maxAcceleration,
  'min_speed': ?instance.minSpeed,
  'max_speed': ?instance.maxSpeed,
  'acceleration_factor': ?instance.accelerationFactor,
  'degrees_per_action': ?instance.degreesPerAction,
  'max_angular_acceleration': ?instance.maxAngularAcceleration,
  'max_angular_velocity': ?instance.maxAngularVelocity,
  'degrees_per_action_scroll_wheel': ?instance.degreesPerActionScrollWheel,
  'force_fraction_rotation': ?instance.forceFractionRotation,
  'min_distance': ?instance.minDistance,
  'max_distance': ?instance.maxDistance,
  'full_strength_distance': ?instance.fullStrengthDistance,
};
