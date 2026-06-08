// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_vehicle_speed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameVehicleSpeed _$GameVehicleSpeedFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GameVehicleSpeed',
      json,
      ($checkedConvert) {
        final val = GameVehicleSpeed(
          scm: $checkedConvert('scm', (v) => v as num?),
          max: $checkedConvert('max', (v) => v as num?),
          boostForward: $checkedConvert('boost_forward', (v) => v as num?),
          boostBackward: $checkedConvert('boost_backward', (v) => v as num?),
          zeroToScm: $checkedConvert('zero_to_scm', (v) => v as num?),
          zeroToMax: $checkedConvert('zero_to_max', (v) => v as num?),
          scmToZero: $checkedConvert('scm_to_zero', (v) => v as num?),
          maxToZero: $checkedConvert('max_to_zero', (v) => v as num?),
        );
        return val;
      },
      fieldKeyMap: const {
        'boostForward': 'boost_forward',
        'boostBackward': 'boost_backward',
        'zeroToScm': 'zero_to_scm',
        'zeroToMax': 'zero_to_max',
        'scmToZero': 'scm_to_zero',
        'maxToZero': 'max_to_zero',
      },
    );

Map<String, dynamic> _$GameVehicleSpeedToJson(GameVehicleSpeed instance) =>
    <String, dynamic>{
      'scm': ?instance.scm,
      'max': ?instance.max,
      'boost_forward': ?instance.boostForward,
      'boost_backward': ?instance.boostBackward,
      'zero_to_scm': ?instance.zeroToScm,
      'zero_to_max': ?instance.zeroToMax,
      'scm_to_zero': ?instance.scmToZero,
      'max_to_zero': ?instance.maxToZero,
    };
