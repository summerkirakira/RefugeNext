// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tractor_beam_force.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TractorBeamForce _$TractorBeamForceFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TractorBeamForce',
      json,
      ($checkedConvert) {
        final val = TractorBeamForce(
          min: $checkedConvert('min', (v) => (v as num?)?.toDouble()),
          max: $checkedConvert('max', (v) => (v as num?)?.toDouble()),
          maxVolume: $checkedConvert(
            'max_volume',
            (v) => (v as num?)?.toDouble(),
          ),
          volumeForceCoefficient: $checkedConvert(
            'volume_force_coefficient',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'maxVolume': 'max_volume',
        'volumeForceCoefficient': 'volume_force_coefficient',
      },
    );

Map<String, dynamic> _$TractorBeamForceToJson(TractorBeamForce instance) =>
    <String, dynamic>{
      'min': ?instance.min,
      'max': ?instance.max,
      'max_volume': ?instance.maxVolume,
      'volume_force_coefficient': ?instance.volumeForceCoefficient,
    };
