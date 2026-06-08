// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turret_axis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TurretAxis _$TurretAxisFromJson(Map<String, dynamic> json) => $checkedCreate(
  'TurretAxis',
  json,
  ($checkedConvert) {
    final val = TurretAxis(
      slavedOnly: $checkedConvert('slaved_only', (v) => v as bool?),
      speed: $checkedConvert('speed', (v) => (v as num?)?.toDouble()),
      timeToFullSpeed: $checkedConvert(
        'time_to_full_speed',
        (v) => (v as num?)?.toDouble(),
      ),
      accelerationDecay: $checkedConvert(
        'acceleration_decay',
        (v) => (v as num?)?.toDouble(),
      ),
      angleLimitMin: $checkedConvert(
        'angle_limit_min',
        (v) => (v as num?)?.toDouble(),
      ),
      angleLimitMax: $checkedConvert(
        'angle_limit_max',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'slavedOnly': 'slaved_only',
    'timeToFullSpeed': 'time_to_full_speed',
    'accelerationDecay': 'acceleration_decay',
    'angleLimitMin': 'angle_limit_min',
    'angleLimitMax': 'angle_limit_max',
  },
);

Map<String, dynamic> _$TurretAxisToJson(TurretAxis instance) =>
    <String, dynamic>{
      'slaved_only': ?instance.slavedOnly,
      'speed': ?instance.speed,
      'time_to_full_speed': ?instance.timeToFullSpeed,
      'acceleration_decay': ?instance.accelerationDecay,
      'angle_limit_min': ?instance.angleLimitMin,
      'angle_limit_max': ?instance.angleLimitMax,
    };
