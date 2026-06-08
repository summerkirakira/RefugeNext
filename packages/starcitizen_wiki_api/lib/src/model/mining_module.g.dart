// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mining_module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MiningModule _$MiningModuleFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MiningModule',
      json,
      ($checkedConvert) {
        final val = MiningModule(
          type: $checkedConvert('type', (v) => v as String?),
          moduleType: $checkedConvert('module_type', (v) => v as String?),
          usage: $checkedConvert(
            'usage',
            (v) => v == null
                ? null
                : MiningModuleUsage.fromJson(v as Map<String, dynamic>),
          ),
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
          modifiers: $checkedConvert(
            'modifiers',
            (v) => v == null
                ? null
                : MiningModuleModifiers.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'moduleType': 'module_type',
        'lifetimeSeconds': 'lifetime_seconds',
        'durationSeconds': 'duration_seconds',
      },
    );

Map<String, dynamic> _$MiningModuleToJson(MiningModule instance) =>
    <String, dynamic>{
      'type': ?instance.type,
      'module_type': ?instance.moduleType,
      'usage': ?instance.usage?.toJson(),
      'charges': ?instance.charges,
      'lifetime_seconds': ?instance.lifetimeSeconds,
      'uses': ?instance.uses,
      'duration_seconds': ?instance.durationSeconds,
      'modifiers': ?instance.modifiers?.toJson(),
    };
