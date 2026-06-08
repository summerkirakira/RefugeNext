// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salvage_modifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalvageModifier _$SalvageModifierFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SalvageModifier',
      json,
      ($checkedConvert) {
        final val = SalvageModifier(
          salvageSpeedMultiplier: $checkedConvert(
            'salvage_speed_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          radiusMultiplier: $checkedConvert(
            'radius_multiplier',
            (v) => (v as num?)?.toDouble(),
          ),
          extractionEfficiency: $checkedConvert(
            'extraction_efficiency',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'salvageSpeedMultiplier': 'salvage_speed_multiplier',
        'radiusMultiplier': 'radius_multiplier',
        'extractionEfficiency': 'extraction_efficiency',
      },
    );

Map<String, dynamic> _$SalvageModifierToJson(SalvageModifier instance) =>
    <String, dynamic>{
      'salvage_speed_multiplier': ?instance.salvageSpeedMultiplier,
      'radius_multiplier': ?instance.radiusMultiplier,
      'extraction_efficiency': ?instance.extractionEfficiency,
    };
