// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'harvestable_setup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HarvestableSetup _$HarvestableSetupFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'HarvestableSetup',
      json,
      ($checkedConvert) {
        final val = HarvestableSetup(
          respawnSeconds: $checkedConvert(
            'respawn_seconds',
            (v) => (v as num?)?.toInt(),
          ),
          respawnFormatted: $checkedConvert(
            'respawn_formatted',
            (v) => v as String?,
          ),
          despawnSeconds: $checkedConvert(
            'despawn_seconds',
            (v) => (v as num?)?.toInt(),
          ),
          despawnFormatted: $checkedConvert(
            'despawn_formatted',
            (v) => v as String?,
          ),
          relativeProbability: $checkedConvert(
            'relative_probability',
            (v) => v as num?,
          ),
          relativeProbabilityPercent: $checkedConvert(
            'relative_probability_percent',
            (v) => v as num?,
          ),
          respawnMultiplier: $checkedConvert(
            'respawn_multiplier',
            (v) => v as num?,
          ),
          additionalWaitSeconds: $checkedConvert(
            'additional_wait_seconds',
            (v) => (v as num?)?.toInt(),
          ),
          additionalWaitFormatted: $checkedConvert(
            'additional_wait_formatted',
            (v) => v as String?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'respawnSeconds': 'respawn_seconds',
        'respawnFormatted': 'respawn_formatted',
        'despawnSeconds': 'despawn_seconds',
        'despawnFormatted': 'despawn_formatted',
        'relativeProbability': 'relative_probability',
        'relativeProbabilityPercent': 'relative_probability_percent',
        'respawnMultiplier': 'respawn_multiplier',
        'additionalWaitSeconds': 'additional_wait_seconds',
        'additionalWaitFormatted': 'additional_wait_formatted',
      },
    );

Map<String, dynamic> _$HarvestableSetupToJson(HarvestableSetup instance) =>
    <String, dynamic>{
      'respawn_seconds': ?instance.respawnSeconds,
      'respawn_formatted': ?instance.respawnFormatted,
      'despawn_seconds': ?instance.despawnSeconds,
      'despawn_formatted': ?instance.despawnFormatted,
      'relative_probability': ?instance.relativeProbability,
      'relative_probability_percent': ?instance.relativeProbabilityPercent,
      'respawn_multiplier': ?instance.respawnMultiplier,
      'additional_wait_seconds': ?instance.additionalWaitSeconds,
      'additional_wait_formatted': ?instance.additionalWaitFormatted,
    };
