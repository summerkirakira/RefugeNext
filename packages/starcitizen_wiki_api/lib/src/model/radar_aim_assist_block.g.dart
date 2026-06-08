// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radar_aim_assist_block.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadarAimAssistBlock _$RadarAimAssistBlockFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RadarAimAssistBlock',
      json,
      ($checkedConvert) {
        final val = RadarAimAssistBlock(
          distanceMinAssignment: $checkedConvert(
            'distance_min_assignment',
            (v) => (v as num?)?.toDouble(),
          ),
          distanceMaxAssignment: $checkedConvert(
            'distance_max_assignment',
            (v) => (v as num?)?.toDouble(),
          ),
          outsideRangeBufferDistance: $checkedConvert(
            'outside_range_buffer_distance',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'distanceMinAssignment': 'distance_min_assignment',
        'distanceMaxAssignment': 'distance_max_assignment',
        'outsideRangeBufferDistance': 'outside_range_buffer_distance',
      },
    );

Map<String, dynamic> _$RadarAimAssistBlockToJson(
  RadarAimAssistBlock instance,
) => <String, dynamic>{
  'distance_min_assignment': ?instance.distanceMinAssignment,
  'distance_max_assignment': ?instance.distanceMaxAssignment,
  'outside_range_buffer_distance': ?instance.outsideRangeBufferDistance,
};
