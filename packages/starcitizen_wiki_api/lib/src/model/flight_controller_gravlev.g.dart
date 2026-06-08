// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_controller_gravlev.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightControllerGravlev _$FlightControllerGravlevFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FlightControllerGravlev',
  json,
  ($checkedConvert) {
    final val = FlightControllerGravlev(
      maxSpeed: $checkedConvert('max_speed', (v) => (v as num?)?.toDouble()),
      turnFriction: $checkedConvert(
        'turn_friction',
        (v) => (v as num?)?.toDouble(),
      ),
      airControllerMultiplier: $checkedConvert(
        'air_controller_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
      antiFallMultiplier: $checkedConvert(
        'anti_fall_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
      lateralStrafeMultiplier: $checkedConvert(
        'lateral_strafe_multiplier',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'maxSpeed': 'max_speed',
    'turnFriction': 'turn_friction',
    'airControllerMultiplier': 'air_controller_multiplier',
    'antiFallMultiplier': 'anti_fall_multiplier',
    'lateralStrafeMultiplier': 'lateral_strafe_multiplier',
  },
);

Map<String, dynamic> _$FlightControllerGravlevToJson(
  FlightControllerGravlev instance,
) => <String, dynamic>{
  'max_speed': ?instance.maxSpeed,
  'turn_friction': ?instance.turnFriction,
  'air_controller_multiplier': ?instance.airControllerMultiplier,
  'anti_fall_multiplier': ?instance.antiFallMultiplier,
  'lateral_strafe_multiplier': ?instance.lateralStrafeMultiplier,
};
