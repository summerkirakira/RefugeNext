// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Missile _$MissileFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Missile',
  json,
  ($checkedConvert) {
    final val = Missile(
      clusterSize: $checkedConvert('cluster_size', (v) => v as num?),
      signalType: $checkedConvert('signal_type', (v) => v as String?),
      trackingSignalMin: $checkedConvert(
        'tracking_signal_min',
        (v) => (v as num?)?.toDouble(),
      ),
      lockTime: $checkedConvert('lock_time', (v) => (v as num?)?.toDouble()),
      lockRangeMax: $checkedConvert(
        'lock_range_max',
        (v) => (v as num?)?.toDouble(),
      ),
      lockRangeMin: $checkedConvert(
        'lock_range_min',
        (v) => (v as num?)?.toDouble(),
      ),
      lockAngle: $checkedConvert('lock_angle', (v) => (v as num?)?.toDouble()),
      speed: $checkedConvert('speed', (v) => (v as num?)?.toDouble()),
      fuelTankSize: $checkedConvert(
        'fuel_tank_size',
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
      flight: $checkedConvert(
        'flight',
        (v) => v == null
            ? null
            : MissileFlight.fromJson(v as Map<String, dynamic>),
      ),
      targetLock: $checkedConvert(
        'target_lock',
        (v) => v == null
            ? null
            : MissileTargetLock.fromJson(v as Map<String, dynamic>),
      ),
      explosion: $checkedConvert(
        'explosion',
        (v) => v == null
            ? null
            : MissileExplosion.fromJson(v as Map<String, dynamic>),
      ),
      delays: $checkedConvert(
        'delays',
        (v) => v == null
            ? null
            : MissileDelays.fromJson(v as Map<String, dynamic>),
      ),
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
      damageMap: $checkedConvert(
        'damage_map',
        (v) =>
            (v as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as num)),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'clusterSize': 'cluster_size',
    'signalType': 'signal_type',
    'trackingSignalMin': 'tracking_signal_min',
    'lockTime': 'lock_time',
    'lockRangeMax': 'lock_range_max',
    'lockRangeMin': 'lock_range_min',
    'lockAngle': 'lock_angle',
    'fuelTankSize': 'fuel_tank_size',
    'explosionRadiusMin': 'explosion_radius_min',
    'explosionRadiusMax': 'explosion_radius_max',
    'targetLock': 'target_lock',
    'damageTotal': 'damage_total',
    'damageMap': 'damage_map',
  },
);

Map<String, dynamic> _$MissileToJson(Missile instance) => <String, dynamic>{
  'cluster_size': ?instance.clusterSize,
  'signal_type': ?instance.signalType,
  'tracking_signal_min': ?instance.trackingSignalMin,
  'lock_time': ?instance.lockTime,
  'lock_range_max': ?instance.lockRangeMax,
  'lock_range_min': ?instance.lockRangeMin,
  'lock_angle': ?instance.lockAngle,
  'speed': ?instance.speed,
  'fuel_tank_size': ?instance.fuelTankSize,
  'explosion_radius_min': ?instance.explosionRadiusMin,
  'explosion_radius_max': ?instance.explosionRadiusMax,
  'flight': ?instance.flight?.toJson(),
  'target_lock': ?instance.targetLock?.toJson(),
  'explosion': ?instance.explosion?.toJson(),
  'delays': ?instance.delays?.toJson(),
  'damage_total': ?instance.damageTotal,
  'damages': ?instance.damages?.map((e) => e.toJson()).toList(),
  'damage_map': ?instance.damageMap,
};
