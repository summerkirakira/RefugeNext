// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_starmap_location_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStarmapLocationType _$GameStarmapLocationTypeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GameStarmapLocationType',
  json,
  ($checkedConvert) {
    final val = GameStarmapLocationType(
      uuid: $checkedConvert('uuid', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      classification: $checkedConvert('classification', (v) => v as String?),
      spawnNavPoints: $checkedConvert('spawn_nav_points', (v) => v as bool?),
      validQuantumTravelDestination: $checkedConvert(
        'valid_quantum_travel_destination',
        (v) => v as bool?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'spawnNavPoints': 'spawn_nav_points',
    'validQuantumTravelDestination': 'valid_quantum_travel_destination',
  },
);

Map<String, dynamic> _$GameStarmapLocationTypeToJson(
  GameStarmapLocationType instance,
) => <String, dynamic>{
  'uuid': ?instance.uuid,
  'name': ?instance.name,
  'classification': ?instance.classification,
  'spawn_nav_points': ?instance.spawnNavPoints,
  'valid_quantum_travel_destination': ?instance.validQuantumTravelDestination,
};
