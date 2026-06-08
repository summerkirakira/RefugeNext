// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_lifetime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionLifetime _$MissionLifetimeFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MissionLifetime',
      json,
      ($checkedConvert) {
        final val = MissionLifetime(
          label: $checkedConvert('label', (v) => v as String?),
          respawnTimeSeconds: $checkedConvert(
            'respawn_time_seconds',
            (v) => (v as num?)?.toInt(),
          ),
          maxInstances: $checkedConvert(
            'max_instances',
            (v) => (v as num?)?.toInt(),
          ),
          respawnTimeVariationSeconds: $checkedConvert(
            'respawn_time_variation_seconds',
            (v) => (v as num?)?.toInt(),
          ),
          maxInstancesPerPlayer: $checkedConvert(
            'max_instances_per_player',
            (v) => (v as num?)?.toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'respawnTimeSeconds': 'respawn_time_seconds',
        'maxInstances': 'max_instances',
        'respawnTimeVariationSeconds': 'respawn_time_variation_seconds',
        'maxInstancesPerPlayer': 'max_instances_per_player',
      },
    );

Map<String, dynamic> _$MissionLifetimeToJson(MissionLifetime instance) =>
    <String, dynamic>{
      'label': ?instance.label,
      'respawn_time_seconds': ?instance.respawnTimeSeconds,
      'max_instances': ?instance.maxInstances,
      'respawn_time_variation_seconds': ?instance.respawnTimeVariationSeconds,
      'max_instances_per_player': ?instance.maxInstancesPerPlayer,
    };
