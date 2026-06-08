// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_controller_recall_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightControllerRecallParams _$FlightControllerRecallParamsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FlightControllerRecallParams',
  json,
  ($checkedConvert) {
    final val = FlightControllerRecallParams(
      hoverHeightAtDestination: $checkedConvert(
        'hover_height_at_destination',
        (v) => (v as num?)?.toDouble(),
      ),
      forwardOffset: $checkedConvert(
        'forward_offset',
        (v) => (v as num?)?.toDouble(),
      ),
      obstructionDetectionRange: $checkedConvert(
        'obstruction_detection_range',
        (v) => (v as num?)?.toDouble(),
      ),
      defaultPlatformDetectionRange: $checkedConvert(
        'default_platform_detection_range',
        (v) => (v as num?)?.toDouble(),
      ),
      minimumRecallDistance: $checkedConvert(
        'minimum_recall_distance',
        (v) => (v as num?)?.toDouble(),
      ),
      brakingDistanceOffset: $checkedConvert(
        'braking_distance_offset',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'hoverHeightAtDestination': 'hover_height_at_destination',
    'forwardOffset': 'forward_offset',
    'obstructionDetectionRange': 'obstruction_detection_range',
    'defaultPlatformDetectionRange': 'default_platform_detection_range',
    'minimumRecallDistance': 'minimum_recall_distance',
    'brakingDistanceOffset': 'braking_distance_offset',
  },
);

Map<String, dynamic> _$FlightControllerRecallParamsToJson(
  FlightControllerRecallParams instance,
) => <String, dynamic>{
  'hover_height_at_destination': ?instance.hoverHeightAtDestination,
  'forward_offset': ?instance.forwardOffset,
  'obstruction_detection_range': ?instance.obstructionDetectionRange,
  'default_platform_detection_range': ?instance.defaultPlatformDetectionRange,
  'minimum_recall_distance': ?instance.minimumRecallDistance,
  'braking_distance_offset': ?instance.brakingDistanceOffset,
};
