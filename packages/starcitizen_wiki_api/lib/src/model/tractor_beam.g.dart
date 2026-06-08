// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tractor_beam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TractorBeam _$TractorBeamFromJson(Map<String, dynamic> json) => $checkedCreate(
  'TractorBeam',
  json,
  ($checkedConvert) {
    final val = TractorBeam(
      force: $checkedConvert(
        'force',
        (v) => v == null
            ? null
            : TractorBeamForce.fromJson(v as Map<String, dynamic>),
      ),
      range: $checkedConvert(
        'range',
        (v) => v == null
            ? null
            : TractorBeamRange.fromJson(v as Map<String, dynamic>),
      ),
      tether: $checkedConvert(
        'tether',
        (v) => v == null
            ? null
            : TractorBeamTether.fromJson(v as Map<String, dynamic>),
      ),
      cargoModeOverride: $checkedConvert(
        'cargo_mode_override',
        (v) => v == null
            ? null
            : TractorBeamCargoModeOverride.fromJson(v as Map<String, dynamic>),
      ),
      towing: $checkedConvert(
        'towing',
        (v) => v == null
            ? null
            : TractorBeamTowing.fromJson(v as Map<String, dynamic>),
      ),
      minForce: $checkedConvert('min_force', (v) => (v as num?)?.toDouble()),
      maxForce: $checkedConvert('max_force', (v) => (v as num?)?.toDouble()),
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
      maxAngle: $checkedConvert('max_angle', (v) => (v as num?)?.toDouble()),
      maxVolume: $checkedConvert('max_volume', (v) => (v as num?)?.toDouble()),
      volumeForceCoefficient: $checkedConvert(
        'volume_force_coefficient',
        (v) => (v as num?)?.toDouble(),
      ),
      tetherBreakTime: $checkedConvert(
        'tether_break_time',
        (v) => (v as num?)?.toDouble(),
      ),
      safeRangeValueFactor: $checkedConvert(
        'safe_range_value_factor',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'cargoModeOverride': 'cargo_mode_override',
    'minForce': 'min_force',
    'maxForce': 'max_force',
    'minDistance': 'min_distance',
    'maxDistance': 'max_distance',
    'fullStrengthDistance': 'full_strength_distance',
    'maxAngle': 'max_angle',
    'maxVolume': 'max_volume',
    'volumeForceCoefficient': 'volume_force_coefficient',
    'tetherBreakTime': 'tether_break_time',
    'safeRangeValueFactor': 'safe_range_value_factor',
  },
);

Map<String, dynamic> _$TractorBeamToJson(TractorBeam instance) =>
    <String, dynamic>{
      'force': ?instance.force?.toJson(),
      'range': ?instance.range?.toJson(),
      'tether': ?instance.tether?.toJson(),
      'cargo_mode_override': ?instance.cargoModeOverride?.toJson(),
      'towing': ?instance.towing?.toJson(),
      'min_force': ?instance.minForce,
      'max_force': ?instance.maxForce,
      'min_distance': ?instance.minDistance,
      'max_distance': ?instance.maxDistance,
      'full_strength_distance': ?instance.fullStrengthDistance,
      'max_angle': ?instance.maxAngle,
      'max_volume': ?instance.maxVolume,
      'volume_force_coefficient': ?instance.volumeForceCoefficient,
      'tether_break_time': ?instance.tetherBreakTime,
      'safe_range_value_factor': ?instance.safeRangeValueFactor,
    };
