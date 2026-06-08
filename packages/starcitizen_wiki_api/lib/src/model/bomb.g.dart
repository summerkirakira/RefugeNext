// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bomb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bomb _$BombFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Bomb',
  json,
  ($checkedConvert) {
    final val = Bomb(
      armTime: $checkedConvert('arm_time', (v) => (v as num?)?.toDouble()),
      igniteTime: $checkedConvert(
        'ignite_time',
        (v) => (v as num?)?.toDouble(),
      ),
      collisionDelayTime: $checkedConvert(
        'collision_delay_time',
        (v) => (v as num?)?.toDouble(),
      ),
      explosionSafetyDistance: $checkedConvert(
        'explosion_safety_distance',
        (v) => (v as num?)?.toDouble(),
      ),
      explosionRadiusMin: $checkedConvert(
        'explosion_radius_min',
        (v) => (v as num?)?.toDouble(),
      ),
      explosionRadiusMax: $checkedConvert(
        'explosion_radius_max',
        (v) => (v as num?)?.toDouble(),
      ),
      maximumDropAngle: $checkedConvert(
        'maximum_drop_angle',
        (v) => (v as num?)?.toDouble(),
      ),
      damage: $checkedConvert('damage', (v) => (v as num?)?.toDouble()),
      damageTotal: $checkedConvert(
        'damage_total',
        (v) => (v as num?)?.toDouble(),
      ),
      damages: $checkedConvert(
        'damages',
        (v) => (v as List<dynamic>?)
            ?.map((e) => WeaponDamage.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      explosion: $checkedConvert(
        'explosion',
        (v) => v == null
            ? null
            : BombExplosion.fromJson(v as Map<String, dynamic>),
      ),
      delays: $checkedConvert(
        'delays',
        (v) =>
            v == null ? null : BombDelays.fromJson(v as Map<String, dynamic>),
      ),
      damageMap: $checkedConvert(
        'damage_map',
        (v) => v == null
            ? null
            : BombDamageMap.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'armTime': 'arm_time',
    'igniteTime': 'ignite_time',
    'collisionDelayTime': 'collision_delay_time',
    'explosionSafetyDistance': 'explosion_safety_distance',
    'explosionRadiusMin': 'explosion_radius_min',
    'explosionRadiusMax': 'explosion_radius_max',
    'maximumDropAngle': 'maximum_drop_angle',
    'damageTotal': 'damage_total',
    'damageMap': 'damage_map',
  },
);

Map<String, dynamic> _$BombToJson(Bomb instance) => <String, dynamic>{
  'arm_time': ?instance.armTime,
  'ignite_time': ?instance.igniteTime,
  'collision_delay_time': ?instance.collisionDelayTime,
  'explosion_safety_distance': ?instance.explosionSafetyDistance,
  'explosion_radius_min': ?instance.explosionRadiusMin,
  'explosion_radius_max': ?instance.explosionRadiusMax,
  'maximum_drop_angle': ?instance.maximumDropAngle,
  'damage': ?instance.damage,
  'damage_total': ?instance.damageTotal,
  'damages': ?instance.damages?.map((e) => e.toJson()).toList(),
  'explosion': ?instance.explosion?.toJson(),
  'delays': ?instance.delays?.toJson(),
  'damage_map': ?instance.damageMap?.toJson(),
};
