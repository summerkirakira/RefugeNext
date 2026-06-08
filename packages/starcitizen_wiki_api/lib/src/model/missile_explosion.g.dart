// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missile_explosion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissileExplosion _$MissileExplosionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'MissileExplosion',
  json,
  ($checkedConvert) {
    final val = MissileExplosion(
      isCluster: $checkedConvert('is_cluster', (v) => v as bool?),
      clusterSize: $checkedConvert('cluster_size', (v) => v as num?),
      requiresLauncher: $checkedConvert('requires_launcher', (v) => v as bool?),
      allowDumbFiring: $checkedConvert('allow_dumb_firing', (v) => v as bool?),
      radiusMin: $checkedConvert('radius_min', (v) => (v as num?)?.toDouble()),
      radiusMax: $checkedConvert('radius_max', (v) => (v as num?)?.toDouble()),
      safetyDistance: $checkedConvert(
        'safety_distance',
        (v) => (v as num?)?.toDouble(),
      ),
      proximity: $checkedConvert('proximity', (v) => (v as num?)?.toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {
    'isCluster': 'is_cluster',
    'clusterSize': 'cluster_size',
    'requiresLauncher': 'requires_launcher',
    'allowDumbFiring': 'allow_dumb_firing',
    'radiusMin': 'radius_min',
    'radiusMax': 'radius_max',
    'safetyDistance': 'safety_distance',
  },
);

Map<String, dynamic> _$MissileExplosionToJson(MissileExplosion instance) =>
    <String, dynamic>{
      'is_cluster': ?instance.isCluster,
      'cluster_size': ?instance.clusterSize,
      'requires_launcher': ?instance.requiresLauncher,
      'allow_dumb_firing': ?instance.allowDumbFiring,
      'radius_min': ?instance.radiusMin,
      'radius_max': ?instance.radiusMax,
      'safety_distance': ?instance.safetyDistance,
      'proximity': ?instance.proximity,
    };
