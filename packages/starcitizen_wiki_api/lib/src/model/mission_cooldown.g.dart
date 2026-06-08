// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_cooldown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionCooldown _$MissionCooldownFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MissionCooldown',
      json,
      ($checkedConvert) {
        final val = MissionCooldown(
          label: $checkedConvert('label', (v) => v as String?),
          personalSeconds: $checkedConvert(
            'personal_seconds',
            (v) => (v as num?)?.toInt(),
          ),
          abandonedSeconds: $checkedConvert(
            'abandoned_seconds',
            (v) => (v as num?)?.toInt(),
          ),
          personalVariationSeconds: $checkedConvert(
            'personal_variation_seconds',
            (v) => (v as num?)?.toInt(),
          ),
          abandonedVariationSeconds: $checkedConvert(
            'abandoned_variation_seconds',
            (v) => (v as num?)?.toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'personalSeconds': 'personal_seconds',
        'abandonedSeconds': 'abandoned_seconds',
        'personalVariationSeconds': 'personal_variation_seconds',
        'abandonedVariationSeconds': 'abandoned_variation_seconds',
      },
    );

Map<String, dynamic> _$MissionCooldownToJson(MissionCooldown instance) =>
    <String, dynamic>{
      'label': ?instance.label,
      'personal_seconds': ?instance.personalSeconds,
      'abandoned_seconds': ?instance.abandonedSeconds,
      'personal_variation_seconds': ?instance.personalVariationSeconds,
      'abandoned_variation_seconds': ?instance.abandonedVariationSeconds,
    };
