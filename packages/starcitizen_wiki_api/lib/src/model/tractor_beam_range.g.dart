// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tractor_beam_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TractorBeamRange _$TractorBeamRangeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TractorBeamRange',
  json,
  ($checkedConvert) {
    final val = TractorBeamRange(
      min: $checkedConvert('min', (v) => (v as num?)?.toDouble()),
      max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
      fullStrengthDistance: $checkedConvert(
        'full_strength_distance',
        (v) => (v as num?)?.toDouble(),
      ),
      maxAngle: $checkedConvert('max_angle', (v) => (v as num?)?.toDouble()),
      hitRadius: $checkedConvert('hit_radius', (v) => (v as num?)?.toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {
    'fullStrengthDistance': 'full_strength_distance',
    'maxAngle': 'max_angle',
    'hitRadius': 'hit_radius',
  },
);

Map<String, dynamic> _$TractorBeamRangeToJson(TractorBeamRange instance) =>
    <String, dynamic>{
      'min': ?instance.min,
      'max': ?instance.max,
      'full_strength_distance': ?instance.fullStrengthDistance,
      'max_angle': ?instance.maxAngle,
      'hit_radius': ?instance.hitRadius,
    };
