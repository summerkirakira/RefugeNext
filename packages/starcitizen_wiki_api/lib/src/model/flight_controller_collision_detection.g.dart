// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_controller_collision_detection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightControllerCollisionDetection _$FlightControllerCollisionDetectionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FlightControllerCollisionDetection',
  json,
  ($checkedConvert) {
    final val = FlightControllerCollisionDetection(
      collisionWarnSpeed: $checkedConvert(
        'collision_warn_speed',
        (v) => (v as num?)?.toDouble(),
      ),
      collisionWarnTime: $checkedConvert(
        'collision_warn_time',
        (v) => (v as num?)?.toDouble(),
      ),
      collisionDangerCloseWarnTime: $checkedConvert(
        'collision_danger_close_warn_time',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'collisionWarnSpeed': 'collision_warn_speed',
    'collisionWarnTime': 'collision_warn_time',
    'collisionDangerCloseWarnTime': 'collision_danger_close_warn_time',
  },
);

Map<String, dynamic> _$FlightControllerCollisionDetectionToJson(
  FlightControllerCollisionDetection instance,
) => <String, dynamic>{
  'collision_warn_speed': ?instance.collisionWarnSpeed,
  'collision_warn_time': ?instance.collisionWarnTime,
  'collision_danger_close_warn_time': ?instance.collisionDangerCloseWarnTime,
};
