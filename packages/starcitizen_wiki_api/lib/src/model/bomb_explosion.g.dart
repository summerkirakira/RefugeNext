// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bomb_explosion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BombExplosion _$BombExplosionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BombExplosion',
  json,
  ($checkedConvert) {
    final val = BombExplosion(
      requiresLauncher: $checkedConvert('requires_launcher', (v) => v as bool?),
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
    'requiresLauncher': 'requires_launcher',
    'radiusMin': 'radius_min',
    'radiusMax': 'radius_max',
    'safetyDistance': 'safety_distance',
  },
);

Map<String, dynamic> _$BombExplosionToJson(BombExplosion instance) =>
    <String, dynamic>{
      'requires_launcher': ?instance.requiresLauncher,
      'radius_min': ?instance.radiusMin,
      'radius_max': ?instance.radiusMax,
      'safety_distance': ?instance.safetyDistance,
      'proximity': ?instance.proximity,
    };
