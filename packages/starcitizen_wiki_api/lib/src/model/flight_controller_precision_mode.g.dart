// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_controller_precision_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightControllerPrecisionMode _$FlightControllerPrecisionModeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FlightControllerPrecisionMode',
  json,
  ($checkedConvert) {
    final val = FlightControllerPrecisionMode(
      maxSpeedFullProximityAssist: $checkedConvert(
        'max_speed_full_proximity_assist',
        (v) => (v as num?)?.toDouble(),
      ),
      maxSpeedZeroProximityAssist: $checkedConvert(
        'max_speed_zero_proximity_assist',
        (v) => (v as num?)?.toDouble(),
      ),
      minDistance: $checkedConvert(
        'min_distance',
        (v) => (v as num?)?.toDouble(),
      ),
      maxDistance: $checkedConvert(
        'max_distance',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'maxSpeedFullProximityAssist': 'max_speed_full_proximity_assist',
    'maxSpeedZeroProximityAssist': 'max_speed_zero_proximity_assist',
    'minDistance': 'min_distance',
    'maxDistance': 'max_distance',
  },
);

Map<String, dynamic> _$FlightControllerPrecisionModeToJson(
  FlightControllerPrecisionMode instance,
) => <String, dynamic>{
  'max_speed_full_proximity_assist': ?instance.maxSpeedFullProximityAssist,
  'max_speed_zero_proximity_assist': ?instance.maxSpeedZeroProximityAssist,
  'min_distance': ?instance.minDistance,
  'max_distance': ?instance.maxDistance,
};
