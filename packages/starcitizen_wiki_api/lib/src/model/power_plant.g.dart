// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'power_plant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PowerPlant _$PowerPlantFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PowerPlant',
  json,
  ($checkedConvert) {
    final val = PowerPlant(
      powerOutput: $checkedConvert(
        'power_output',
        (v) => (v as num?)?.toDouble(),
      ),
      powerSegmentGeneration: $checkedConvert(
        'power_segment_generation',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'powerOutput': 'power_output',
    'powerSegmentGeneration': 'power_segment_generation',
  },
);

Map<String, dynamic> _$PowerPlantToJson(PowerPlant instance) =>
    <String, dynamic>{
      'power_output': ?instance.powerOutput,
      'power_segment_generation': ?instance.powerSegmentGeneration,
    };
