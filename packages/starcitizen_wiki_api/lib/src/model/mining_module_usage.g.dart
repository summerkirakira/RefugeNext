// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mining_module_usage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MiningModuleUsage _$MiningModuleUsageFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MiningModuleUsage',
      json,
      ($checkedConvert) {
        final val = MiningModuleUsage(
          charges: $checkedConvert('charges', (v) => (v as num?)?.toInt()),
          lifetimeSeconds: $checkedConvert(
            'lifetime_seconds',
            (v) => (v as num?)?.toDouble(),
          ),
          uses: $checkedConvert('uses', (v) => (v as num?)?.toInt()),
          durationSeconds: $checkedConvert(
            'duration_seconds',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'lifetimeSeconds': 'lifetime_seconds',
        'durationSeconds': 'duration_seconds',
      },
    );

Map<String, dynamic> _$MiningModuleUsageToJson(MiningModuleUsage instance) =>
    <String, dynamic>{
      'charges': ?instance.charges,
      'lifetime_seconds': ?instance.lifetimeSeconds,
      'uses': ?instance.uses,
      'duration_seconds': ?instance.durationSeconds,
    };
