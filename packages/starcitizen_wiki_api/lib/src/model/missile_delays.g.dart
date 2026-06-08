// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missile_delays.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissileDelays _$MissileDelaysFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MissileDelays',
      json,
      ($checkedConvert) {
        final val = MissileDelays(
          armTime: $checkedConvert('arm_time', (v) => (v as num?)?.toDouble()),
          igniteTime: $checkedConvert(
            'ignite_time',
            (v) => (v as num?)?.toDouble(),
          ),
          collisionDelayTime: $checkedConvert(
            'collision_delay_time',
            (v) => (v as num?)?.toDouble(),
          ),
          lockTime: $checkedConvert(
            'lock_time',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'armTime': 'arm_time',
        'igniteTime': 'ignite_time',
        'collisionDelayTime': 'collision_delay_time',
        'lockTime': 'lock_time',
      },
    );

Map<String, dynamic> _$MissileDelaysToJson(MissileDelays instance) =>
    <String, dynamic>{
      'arm_time': ?instance.armTime,
      'ignite_time': ?instance.igniteTime,
      'collision_delay_time': ?instance.collisionDelayTime,
      'lock_time': ?instance.lockTime,
    };
