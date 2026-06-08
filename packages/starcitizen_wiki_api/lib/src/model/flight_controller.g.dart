// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightController _$FlightControllerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'FlightController',
  json,
  ($checkedConvert) {
    final val = FlightController(
      scmSpeed: $checkedConvert('scm_speed', (v) => (v as num?)?.toDouble()),
      boostSpeedForward: $checkedConvert(
        'boost_speed_forward',
        (v) => (v as num?)?.toDouble(),
      ),
      boostSpeedBackward: $checkedConvert(
        'boost_speed_backward',
        (v) => (v as num?)?.toDouble(),
      ),
      maxSpeed: $checkedConvert('max_speed', (v) => (v as num?)?.toDouble()),
      pitch: $checkedConvert('pitch', (v) => (v as num?)?.toDouble()),
      yaw: $checkedConvert('yaw', (v) => (v as num?)?.toDouble()),
      roll: $checkedConvert('roll', (v) => (v as num?)?.toDouble()),
      pitchBoosted: $checkedConvert(
        'pitch_boosted',
        (v) => (v as num?)?.toInt(),
      ),
      yawBoosted: $checkedConvert('yaw_boosted', (v) => (v as num?)?.toInt()),
      rollBoosted: $checkedConvert('roll_boosted', (v) => (v as num?)?.toInt()),
      boostCapacitor: $checkedConvert(
        'boost_capacitor',
        (v) => v == null
            ? null
            : FlightControllerBoostCapacitor.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      boostActivation: $checkedConvert(
        'boost_activation',
        (v) => v == null
            ? null
            : FlightControllerBoostActivation.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      thrusterDecay: $checkedConvert(
        'thruster_decay',
        (v) => v == null
            ? null
            : FlightControllerThrusterDecay.fromJson(v as Map<String, dynamic>),
      ),
      multiplier: $checkedConvert(
        'multiplier',
        (v) => v == null
            ? null
            : FlightControllerMultiplier.fromJson(v as Map<String, dynamic>),
      ),
      boostMultiplier: $checkedConvert(
        'boost_multiplier',
        (v) => v == null
            ? null
            : FlightControllerBoostMultiplier.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      precisionMode: $checkedConvert(
        'precision_mode',
        (v) => v == null
            ? null
            : FlightControllerPrecisionMode.fromJson(v as Map<String, dynamic>),
      ),
      recallParams: $checkedConvert(
        'recall_params',
        (v) => v == null
            ? null
            : FlightControllerRecallParams.fromJson(v as Map<String, dynamic>),
      ),
      collisionDetection: $checkedConvert(
        'collision_detection',
        (v) => v == null
            ? null
            : FlightControllerCollisionDetection.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
      gravlev: $checkedConvert(
        'gravlev',
        (v) => v == null
            ? null
            : FlightControllerGravlev.fromJson(v as Map<String, dynamic>),
      ),
      noFuelParams: $checkedConvert(
        'no_fuel_params',
        (v) => v == null
            ? null
            : FlightNoFuelParams.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'scmSpeed': 'scm_speed',
    'boostSpeedForward': 'boost_speed_forward',
    'boostSpeedBackward': 'boost_speed_backward',
    'maxSpeed': 'max_speed',
    'pitchBoosted': 'pitch_boosted',
    'yawBoosted': 'yaw_boosted',
    'rollBoosted': 'roll_boosted',
    'boostCapacitor': 'boost_capacitor',
    'boostActivation': 'boost_activation',
    'thrusterDecay': 'thruster_decay',
    'boostMultiplier': 'boost_multiplier',
    'precisionMode': 'precision_mode',
    'recallParams': 'recall_params',
    'collisionDetection': 'collision_detection',
    'noFuelParams': 'no_fuel_params',
  },
);

Map<String, dynamic> _$FlightControllerToJson(FlightController instance) =>
    <String, dynamic>{
      'scm_speed': ?instance.scmSpeed,
      'boost_speed_forward': ?instance.boostSpeedForward,
      'boost_speed_backward': ?instance.boostSpeedBackward,
      'max_speed': ?instance.maxSpeed,
      'pitch': ?instance.pitch,
      'yaw': ?instance.yaw,
      'roll': ?instance.roll,
      'pitch_boosted': ?instance.pitchBoosted,
      'yaw_boosted': ?instance.yawBoosted,
      'roll_boosted': ?instance.rollBoosted,
      'boost_capacitor': ?instance.boostCapacitor?.toJson(),
      'boost_activation': ?instance.boostActivation?.toJson(),
      'thruster_decay': ?instance.thrusterDecay?.toJson(),
      'multiplier': ?instance.multiplier?.toJson(),
      'boost_multiplier': ?instance.boostMultiplier?.toJson(),
      'precision_mode': ?instance.precisionMode?.toJson(),
      'recall_params': ?instance.recallParams?.toJson(),
      'collision_detection': ?instance.collisionDetection?.toJson(),
      'gravlev': ?instance.gravlev?.toJson(),
      'no_fuel_params': ?instance.noFuelParams?.toJson(),
    };
