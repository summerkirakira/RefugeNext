// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bomb_delays.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BombDelays _$BombDelaysFromJson(Map<String, dynamic> json) => $checkedCreate(
  'BombDelays',
  json,
  ($checkedConvert) {
    final val = BombDelays(
      armTime: $checkedConvert('arm_time', (v) => (v as num?)?.toDouble()),
      igniteTime: $checkedConvert(
        'ignite_time',
        (v) => (v as num?)?.toDouble(),
      ),
      collisionDelayTime: $checkedConvert(
        'collision_delay_time',
        (v) => (v as num?)?.toDouble(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'armTime': 'arm_time',
    'igniteTime': 'ignite_time',
    'collisionDelayTime': 'collision_delay_time',
  },
);

Map<String, dynamic> _$BombDelaysToJson(BombDelays instance) =>
    <String, dynamic>{
      'arm_time': ?instance.armTime,
      'ignite_time': ?instance.igniteTime,
      'collision_delay_time': ?instance.collisionDelayTime,
    };
