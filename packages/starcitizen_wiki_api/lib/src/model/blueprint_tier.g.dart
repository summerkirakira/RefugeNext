// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_tier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlueprintTier _$BlueprintTierFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BlueprintTier',
      json,
      ($checkedConvert) {
        final val = BlueprintTier(
          tierIndex: $checkedConvert('tier_index', (v) => (v as num?)?.toInt()),
          craftTimeSeconds: $checkedConvert(
            'craft_time_seconds',
            (v) => (v as num?)?.toInt(),
          ),
          requirements: $checkedConvert(
            'requirements',
            (v) => v == null
                ? null
                : BlueprintRequirementNode.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'tierIndex': 'tier_index',
        'craftTimeSeconds': 'craft_time_seconds',
      },
    );

Map<String, dynamic> _$BlueprintTierToJson(BlueprintTier instance) =>
    <String, dynamic>{
      'tier_index': ?instance.tierIndex,
      'craft_time_seconds': ?instance.craftTimeSeconds,
      'requirements': ?instance.requirements?.toJson(),
    };
