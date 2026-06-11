// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_power.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehiclePower _$GameVehiclePowerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GameVehiclePower',
      json,
      ($checkedConvert) {
        final val = GameVehiclePower(
          generationSegments: $checkedConvert(
            'generation_segments',
            (v) => v as num?,
          ),
          usedSegmentsShields: $checkedConvert(
            'used_segments_shields',
            (v) => v as num?,
          ),
          usedSegmentsQuantum: $checkedConvert(
            'used_segments_quantum',
            (v) => v as num?,
          ),
          usedSegmentsGrouped: $checkedConvert(
            'used_segments_grouped',
            (v) => (v as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(k, e as num),
            ),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'generationSegments': 'generation_segments',
        'usedSegmentsShields': 'used_segments_shields',
        'usedSegmentsQuantum': 'used_segments_quantum',
        'usedSegmentsGrouped': 'used_segments_grouped',
      },
    );

Map<String, dynamic> _$GameVehiclePowerToJson(GameVehiclePower instance) =>
    <String, dynamic>{
      'generation_segments': ?instance.generationSegments,
      'used_segments_shields': ?instance.usedSegmentsShields,
      'used_segments_quantum': ?instance.usedSegmentsQuantum,
      'used_segments_grouped': ?instance.usedSegmentsGrouped,
    };
