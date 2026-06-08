// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_starmap_location_quantum_travel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStarmapLocationQuantumTravel _$GameStarmapLocationQuantumTravelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameStarmapLocationQuantumTravel',
  json,
  ($checkedConvert) {
    final val = GameStarmapLocationQuantumTravel(
      obstructionRadius: $checkedConvert(
        'obstruction_radius',
        (v) => v as num?,
      ),
      obstructionRadiusFormatted: $checkedConvert(
        'obstruction_radius_formatted',
        (v) => v as String?,
      ),
      arrivalRadius: $checkedConvert('arrival_radius', (v) => v as num?),
      arrivalRadiusFormatted: $checkedConvert(
        'arrival_radius_formatted',
        (v) => v as String?,
      ),
      arrivalPointDetectionOffset: $checkedConvert(
        'arrival_point_detection_offset',
        (v) => v as num?,
      ),
      adoptionRadius: $checkedConvert('adoption_radius', (v) => v as num?),
      adoptionRadiusFormatted: $checkedConvert(
        'adoption_radius_formatted',
        (v) => v as String?,
      ),
      subPointRadiusMultiplier: $checkedConvert(
        'sub_point_radius_multiplier',
        (v) => v as num?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'obstructionRadius': 'obstruction_radius',
    'obstructionRadiusFormatted': 'obstruction_radius_formatted',
    'arrivalRadius': 'arrival_radius',
    'arrivalRadiusFormatted': 'arrival_radius_formatted',
    'arrivalPointDetectionOffset': 'arrival_point_detection_offset',
    'adoptionRadius': 'adoption_radius',
    'adoptionRadiusFormatted': 'adoption_radius_formatted',
    'subPointRadiusMultiplier': 'sub_point_radius_multiplier',
  },
);

Map<String, dynamic> _$GameStarmapLocationQuantumTravelToJson(
  GameStarmapLocationQuantumTravel instance,
) => <String, dynamic>{
  'obstruction_radius': ?instance.obstructionRadius,
  'obstruction_radius_formatted': ?instance.obstructionRadiusFormatted,
  'arrival_radius': ?instance.arrivalRadius,
  'arrival_radius_formatted': ?instance.arrivalRadiusFormatted,
  'arrival_point_detection_offset': ?instance.arrivalPointDetectionOffset,
  'adoption_radius': ?instance.adoptionRadius,
  'adoption_radius_formatted': ?instance.adoptionRadiusFormatted,
  'sub_point_radius_multiplier': ?instance.subPointRadiusMultiplier,
};
