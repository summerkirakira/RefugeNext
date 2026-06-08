// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tractor_beam_towing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TractorBeamTowing _$TractorBeamTowingFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TractorBeamTowing',
      json,
      ($checkedConvert) {
        final val = TractorBeamTowing(
          force: $checkedConvert('force', (v) => (v as num?)?.toDouble()),
          maxAcceleration: $checkedConvert(
            'max_acceleration',
            (v) => (v as num?)?.toDouble(),
          ),
          maxDistance: $checkedConvert(
            'max_distance',
            (v) => (v as num?)?.toDouble(),
          ),
          qtMassLimit: $checkedConvert(
            'qt_mass_limit',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'maxAcceleration': 'max_acceleration',
        'maxDistance': 'max_distance',
        'qtMassLimit': 'qt_mass_limit',
      },
    );

Map<String, dynamic> _$TractorBeamTowingToJson(TractorBeamTowing instance) =>
    <String, dynamic>{
      'force': ?instance.force,
      'max_acceleration': ?instance.maxAcceleration,
      'max_distance': ?instance.maxDistance,
      'qt_mass_limit': ?instance.qtMassLimit,
    };
